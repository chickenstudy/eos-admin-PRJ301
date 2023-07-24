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
public class ResetPasswordController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        if (!newPassword.equals(confirmPassword)) {
            // Nếu mật khẩu mới và mật khẩu xác nhận không khớp, sẽ hiển thị thông báo lỗi và quay lại biểu mẫu đặt lại mật khẩu
            request.setAttribute("error confirm", "Mật khẩu mới và xác nhận mật khẩu không khớp!");
            request.getRequestDispatcher("resetPassword.jsp").forward(request, response);
            return;
        }

        // Đặt lại mật khẩu cho người dùng
       
        UserDao db = new UserDao();
        boolean isResetSuccessful = db.resetPassword(email, newPassword);

        if (isResetSuccessful) {
            // Hiển thị thông báo thành công nếu đặt lại mật khẩu thành công
            request.setAttribute("success", "Mật khẩu đã được cập nhật!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            // Hiển thị thông báo lỗi nếu không đặt lại được mật khẩu
            request.setAttribute("error", "Có lỗi xảy ra khi cập nhật mật khẩu, vui lòng thử lại sau!");
            request.getRequestDispatcher("resetPassword.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("resetPassword.jsp").forward(req, resp);
    }

}
