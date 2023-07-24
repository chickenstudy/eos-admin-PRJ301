/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.time.LocalDate;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.User;

/**
 *
 * @author User
 */
public class UserDao {

    public User login(String email, String password) {
        DBContext dBContext = new DBContext();
        User user = new User();
        try {
            Connection connection = dBContext.getConnection();
            String sql = "select * from Users where  email = ? and password = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            System.out.println("run");
            if (rs.next()) {
                System.out.println("out");
                user = new User(rs.getInt("id"),
                        rs.getString("full_name"),
                        rs.getString("password"),
                        rs.getDate("dob"),
                        rs.getString("gender"),
                        rs.getString("email"),
                        rs.getString("phone_number"));
            }
            dBContext.closeConnection(connection, ps);
        } catch (SQLException e) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, e);
        }
        return user;
    }

    public boolean checkUserExists(String email) {
        try {
            DBContext dBContext = new DBContext();
            Connection connection = dBContext.getConnection();
            String strSelect = "SELECT * FROM users WHERE email=?";
            PreparedStatement ps = connection.prepareStatement(strSelect);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return true;
            }
            dBContext.closeConnection(connection, ps);
        } catch (SQLException e) {
            System.out.println("checkUserExists:" + e.getMessage());
        }
        return false;
    }

    public boolean insertUser(String full_name, String password, String dob, String gender, String email, String phone_number) {
        try {
            DBContext dBContext = new DBContext();
            Connection connection = dBContext.getConnection();
            String strInsert = "INSERT INTO Users (full_name, password, dob, gender, email, phone_number) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = connection.prepareStatement(strInsert);
            ps.setString(1, full_name);
            ps.setString(2, password);
            if (dob.isEmpty()) {
                ps.setNull(3, Types.DATE);
            } else {
                LocalDate date = LocalDate.parse(dob);
                ps.setDate(3, Date.valueOf(date));
            }

            ps.setString(4, gender);
            ps.setString(5, email);
            ps.setString(6, phone_number);
            int rowsAffected = ps.executeUpdate();
            if (rowsAffected == 1) {
                return true;
            }
            dBContext.closeConnection(connection, ps);
        } catch (Exception e) {
            System.out.println("insertUser:" + e.getMessage());
        }
        return false;
    }

    public boolean checkUserInfo(String full_name, String dob, String gender, String email, String phone_number) {
        try {
            DBContext dBContext = new DBContext();
            Connection connection = dBContext.getConnection();

            // Kiểm tra xem user có tồn tại trong database hay không
            String strSelect = "SELECT * FROM Users WHERE full_name=? AND dob=? AND gender=? AND email=? AND phone_number=?";
            PreparedStatement ps = connection.prepareStatement(strSelect);
            ps.setString(1, full_name);

            if (dob.isEmpty()) {
                ps.setNull(2, Types.DATE);
            } else {
                LocalDate date = LocalDate.parse(dob);
                ps.setDate(2, Date.valueOf(date));
            }

            ps.setString(3, gender);
            ps.setString(4, email);
            ps.setString(5, phone_number);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                dBContext.closeConnection(connection, ps);
                return true;
            }
            dBContext.closeConnection(connection, ps);
        } catch (Exception e) {
            System.out.println("checkUserInfo:" + e.getMessage());
        }
        return false;
    }

    public boolean resetPassword(String email, String newPassword) {
        try {
            DBContext dBContext = new DBContext();
            Connection connection = dBContext.getConnection();
            String strUpdate = "UPDATE Users SET password=? WHERE email=?";
            PreparedStatement ps = connection.prepareStatement(strUpdate);
            ps.setString(1, newPassword);
            ps.setString(2, email);
            int rowsAffected = ps.executeUpdate();
            if (rowsAffected == 1) {
                return true;
            }
            dBContext.closeConnection(connection, ps);
        } catch (SQLException e) {
            System.out.println("resetPassword:" + e.getMessage());
        }
        return false;
    }

    public boolean updateUser(int id, String full_name, String password, String dob, String gender, String email, String phone_number) {
        try {
            DBContext dBContext = new DBContext();
            Connection connection = dBContext.getConnection();
            String strUpdate = "UPDATE Users SET full_name=?, password=?, dob=?, gender=?, phone_number=? WHERE email=?";
            PreparedStatement ps = connection.prepareStatement(strUpdate);
            ps.setString(1, full_name);
            ps.setString(2, password);

            if (dob.isEmpty()) {
                ps.setNull(3, Types.DATE);
            } else {
                LocalDate date = LocalDate.parse(dob);
                ps.setDate(3, Date.valueOf(date));
            }

            ps.setString(4, gender);
            ps.setString(5, phone_number);
            ps.setString(6, email);
            int rowsAffected = ps.executeUpdate();
            if (rowsAffected == 1) {
                return true;
            }
            dBContext.closeConnection(connection, ps);
        } catch (SQLException e) {
            System.out.println("updateUser:" + e.getMessage());
        }
        return false;
    }
}
