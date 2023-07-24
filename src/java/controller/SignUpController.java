/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import dao.UserDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeParseException;
import model.User;

/**
 *
 * @author User
 */
public class SignUpController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String full_name = req.getParameter("fullname");
        String password = req.getParameter("password");
        String dobStr = req.getParameter("dob");
        String gender = req.getParameter("gender");
        String phone_number = req.getParameter("phonenumber");
        String email = req.getParameter("email");

// Parse the dob string to a LocalDate object and check if it is valid
        LocalDate dob;
        try {
            dob = LocalDate.parse(dobStr);
        } catch (DateTimeParseException ex) {
            req.setAttribute("error date", "Invalid Date of Birth. Please enter a valid date.");
            req.getRequestDispatcher("login.jsp").forward(req, resp);
            return;
        }

// Check if the dob is before the current date
        if (dob.isAfter(LocalDate.now())) {
            req.setAttribute("error date", "Invalid Date of Birth. Please enter a valid date.");
            req.getRequestDispatcher("login.jsp").forward(req, resp);
            return;
        }

// Kiểm tra xem email đã đăng ký hay chưa
        User u = new User();
         UserDao db = new UserDao();
        boolean emailExists = db.checkUserExists(email);

        if (emailExists) {
            req.setAttribute("error signup", "Email đã được đăng ký. Vui lòng nhập một email khác.");
            req.getRequestDispatcher("login.jsp").forward(req, resp);
            return;
        }

// Chèn thông tin người dùng mới vào cơ sở dữ liệu
        boolean inserted = db.insertUser(full_name, password, dobStr, gender, email, phone_number);

        if (inserted) {
            req.getSession().setAttribute("email", email);
            resp.sendRedirect("login.jsp");
            return;
        } else {
            req.setAttribute("error fail", "Signup failed. Please try again.");
            req.getRequestDispatcher("login.jsp").forward(req, resp);
            return;
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.sendRedirect("login.jsp");
    }
}
