/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.CourseDao;
import dao.QuestionDao;
import dao.TestDao;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Course;
import model.Question;
import model.Test;

/**
 *
 * @author User
 */
public class DetailTestController extends HttpServlet {

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
        int id = Integer.parseInt(request.getParameter("id"));
        TestDao testDao = new TestDao();
        QuestionDao questionDao = new QuestionDao();
        Test test = testDao.get(id);
        CourseDao courseDao = new CourseDao();
        test.setQuestions(questionDao.getQuestionTest(id));
        ArrayList<Question> questions = questionDao.getQuestionCourse(test.getIdCourse(), test.getId());
        ArrayList<Course> listCourses = courseDao.gets();
        request.setAttribute("listCourses", listCourses);
        request.setAttribute("test", test);
        request.setAttribute("questions", questions);
        
        request.getRequestDispatcher("detailTest.jsp").forward(request, response);

    }

}
