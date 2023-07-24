/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.QuestionDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author User
 */
public class UpdateQuestionController extends HttpServlet {

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
        if (request.getParameter("idCourse") == null || request.getParameter("id") == null) {
            response.sendRedirect("course");
        }
        int id = Integer.parseInt(request.getParameter("id"));
        int idCourse = Integer.parseInt(request.getParameter("idCourse"));
        String question = request.getParameter("question") != null ? request.getParameter("question").trim() : "";
        String optionA = request.getParameter("optionA") != null ? request.getParameter("optionA").trim() : "";
        String optionB = request.getParameter("optionB") != null ? request.getParameter("optionB").trim() : "";
        String optionC = request.getParameter("optionC") != null ? request.getParameter("optionC").trim() : "";
        String optionD = request.getParameter("optionD") != null ? request.getParameter("optionD").trim() : "";
        int rightOption = request.getParameter("rightOption") != null ? Integer.valueOf(request.getParameter("rightOption")) : 0;
        QuestionDao dao = new QuestionDao();
        dao.update(id, question, optionA, optionB, optionC, optionD, rightOption, idCourse);
        response.sendRedirect("course-detail?id=" + idCourse);
    }

}
