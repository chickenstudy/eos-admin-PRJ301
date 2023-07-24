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
import model.User;

/**
 *
 * @author User
 */
public class ForgotPasswordController extends HttpServlet {

    

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String fullName = req.getParameter("fullName");
        String dob = req.getParameter("dob");
        String gender = req.getParameter("gender");
        String email = req.getParameter("email");
        String phoneNumber = req.getParameter("phoneNumber");
        
        System.out.println(fullName + dob + gender + email + phoneNumber);

        // Kiểm tra thông tin người dùng
       
         UserDao db = new UserDao();
        boolean isUserInfoValid = db.checkUserInfo(fullName, dob, gender, email, phoneNumber);

        if (isUserInfoValid) {
            // Chuyển tới trang reset password nếu thông tin người dùng hợp lệ
            req.setAttribute("email", email);
            req.getRequestDispatcher("resetPassword.jsp").forward(req, resp);
        } else {
            // Hiển thị thông báo lỗi nếu thông tin người dùng không chính xác
            req.setAttribute("error", "Thông tin của bạn không chính xác, vui lòng nhập lại!");
            req.getRequestDispatcher("forgotPassword.jsp").forward(req, resp);
        }
    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
         req.getRequestDispatcher("forgotPassword.jsp").forward(req, resp);
    }

}
        