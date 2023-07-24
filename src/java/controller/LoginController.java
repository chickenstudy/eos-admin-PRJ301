/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import dao.UserDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import model.User;

/**
 *
 * @author User
 */
public class LoginController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("user");
        if (user == null) {
            String email = "";
            String password = "";
            Cookie ck[] = request.getCookies();
            for (Cookie ck1 : ck) {
                if (ck1.getName().equalsIgnoreCase("email")) {
                    email = ck1.getValue();
                }
                if (ck1.getName().equalsIgnoreCase("password")) {
                    password = ck1.getValue();
                }
            }
            request.setAttribute("email", email);
            request.setAttribute("password", password);
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        } else {
            response.sendRedirect("/");

        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        User user = (User) request.getSession().getAttribute("user");
        if (user == null) {
            UserDao db = new UserDao();
            String email = request.getParameter("email").trim();
            String password = request.getParameter("password").trim();

            User u = db.login(email, password);
            if (u.getId() == 0) {
                request.setAttribute("login", false);
                request.setAttribute("email", email);
                request.setAttribute("password", password);
                request.setAttribute("error", "Invalid email or password."); // Đặt thông báo lỗi
                request.getRequestDispatcher("login.jsp").forward(request, response);
            } else {
                if (request.getParameter("remember") != null) {
                    Cookie userCookie = new Cookie("email", u.getEmail());
                    Cookie passCookie = new Cookie("password", u.getPassword());
                    userCookie.setMaxAge(60 * 60 * 24);
                    passCookie.setMaxAge(60 * 60 * 24);
                    response.addCookie(userCookie);
                    response.addCookie(passCookie);
                }
                request.getSession().setAttribute("user", u);
                response.sendRedirect("./course");
            }
        } else {
            response.sendRedirect("./course");
        }

    }
}
