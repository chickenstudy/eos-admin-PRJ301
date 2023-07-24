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
import model.Course;

/**
 *
 * @author User
 */
public class UpdateCourseController extends HttpServlet {

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
        if (request.getParameter("id") == null) {
            response.sendRedirect("course");
        } else {
            int id = Integer.valueOf(request.getParameter("id"));
            String name = request.getParameter("name") != null ? request.getParameter("name").trim() : "";
            String description = request.getParameter("description") != null ? request.getParameter("description").trim() : "";
            CourseDao dao = new CourseDao();
            Course course = new Course(id, name, description);
            dao.update(course);
            response.sendRedirect("course");
        }
    }
}
