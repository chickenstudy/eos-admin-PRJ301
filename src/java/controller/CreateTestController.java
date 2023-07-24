/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.CourseDao;
import dao.TestDao;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Course;

/**
 *
 * @author User
 */
public class CreateTestController extends HttpServlet {

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int idCourse = request.getParameter("idCourse") != null ? Integer.valueOf(request.getParameter("idCourse")) : 0;
        CourseDao courseDao = new CourseDao();
        ArrayList<Course> listCourses = courseDao.gets();
        request.setAttribute("listCourses", listCourses);
        request.setAttribute("idCourse", idCourse);
        request.getRequestDispatcher("./createTest.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        TestDao testDao = new TestDao();
        String name = request.getParameter("name") != null ? request.getParameter("name").trim() : "";
        String description = request.getParameter("description") != null ? request.getParameter("description").trim() : "";
        int idCourse = request.getParameter("idCourse") != null ? Integer.valueOf(request.getParameter("idCourse")) : 0;
        int time = request.getParameter("time") != null ? Integer.valueOf(request.getParameter("time")) : 0;
        int numberQuestion = request.getParameter("numberQuestion") != null ? Integer.valueOf(request.getParameter("numberQuestion")) : 0;
        testDao.create(name, description, time, numberQuestion, idCourse);

        response.sendRedirect("course-detail?id=" + idCourse
        );

    }

}
