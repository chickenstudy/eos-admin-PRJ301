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
public class DetailCourseController extends HttpServlet {

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
        int id;
        if (request.getParameter("id") == null) {
            response.sendRedirect("course");
        }
        id = Integer.valueOf(request.getParameter("id"));
        CourseDao daoCourse = new CourseDao();
        Course course = daoCourse.getInfomation(id);
        request.setAttribute("course", course);
       
        //list test 
        TestDao testDao = new TestDao();
        String searchTest = request.getParameter("searchTest") != null ? request.getParameter("searchTest") : "";
        final int RECORD_PER_PAGE_TEST = 5;
        int pageTest = request.getParameter("pageTest") != null ? Integer.parseInt(request.getParameter("pageTest")) : 1;
        int totalRecordTest = testDao.getCount(id);
        int totalTest = totalRecordTest / RECORD_PER_PAGE_TEST;
        totalTest = totalRecordTest % RECORD_PER_PAGE_TEST > 0 ? totalTest++ : totalTest;
        ArrayList<Test> listTest = testDao.gets(id, searchTest, pageTest, RECORD_PER_PAGE_TEST);
        request.setAttribute("searchTest", searchTest);
        request.setAttribute("listTest", listTest);
        request.setAttribute("pageTest", pageTest);
        request.setAttribute("totalTest", totalTest);
        //list questionưd
        QuestionDao questionDao = new QuestionDao();
        String searchQuestion = request.getParameter("searchQuestion") != null ? request.getParameter("searchQuestion") : "";
        final int RECORD_PER_PAGE_QUESTION = 1;
        int pageQuestion = request.getParameter("pageQuestion") != null ? Integer.parseInt(request.getParameter("pageQuestion")) : 1;
        int totalRecordQuestion = questionDao.getCount(id);
        int totalQuestion = totalRecordQuestion / RECORD_PER_PAGE_QUESTION;
        totalQuestion = totalRecordQuestion % RECORD_PER_PAGE_QUESTION > 0 ? ++totalQuestion : totalQuestion;
        ArrayList<Question> listQuestion = questionDao.gets(id, searchQuestion, pageQuestion, RECORD_PER_PAGE_QUESTION);
        request.setAttribute("searchQuestion", searchQuestion);
        request.setAttribute("listQuestion", listQuestion);
        request.setAttribute("pageQuestion", pageQuestion);
        request.setAttribute("totalQuestion", totalQuestion);
        request.setAttribute("id", id);

        request.getRequestDispatcher("detailCourse.jsp").forward(request, response);
    }
}
