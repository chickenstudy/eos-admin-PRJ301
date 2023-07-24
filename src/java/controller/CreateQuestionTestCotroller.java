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
public class CreateQuestionTestCotroller extends HttpServlet {

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
        int idTest = request.getParameter("idTest") != null ? Integer.valueOf(request.getParameter("idTest")) : 0;
        int idQuestion = request.getParameter("idQuestion") != null ? Integer.valueOf(request.getParameter("idQuestion")) : 0;
        QuestionDao dao = new QuestionDao();
        dao.createQuestionTest(idTest, idQuestion);
        response.sendRedirect("test-detail?id=" + idTest);
    }

}
