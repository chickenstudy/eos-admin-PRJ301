/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.CourseDao;
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
public class ListCourseController extends HttpServlet {

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
        CourseDao dao = new CourseDao();
        String search = request.getParameter("search") != null ? request.getParameter("search") : "";
        final int RECORD_PER_PAGE = 5;
        int page = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
        int totalRecord = dao.getCount();
        int total = totalRecord / RECORD_PER_PAGE;
        total = totalRecord % RECORD_PER_PAGE > 0 ? ++total : total;
        request.setAttribute("search", search);
        ArrayList<Course> list = dao.gets(search, page, RECORD_PER_PAGE);
         // total course 
        int count = 0;
        count = dao.getCount();
        request.setAttribute("totalCourse", count);

        request.setAttribute("list", list);
        request.setAttribute("page", page);
        request.setAttribute("total", total);
        request.getRequestDispatcher("./listCourse.jsp").forward(request, response);
    }

}
