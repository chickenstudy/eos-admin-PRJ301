/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Course;

/**
 *
 * @author User
 */
public class CourseDao {

    public ArrayList<Course> gets(String search, int page, int recordPerPage) {
        DBContext dBContext = new DBContext();
        ArrayList<Course> courseses = new ArrayList<>();
        try {
            Connection connection = dBContext.getConnection();
            String query = "select *, "
                    + "(select COUNT(id)  from question where question.id_course = course.id) as total_question,"
                    + "(select COUNT(id)  from test where test.id_course = course.id) as total_test from course \n"
                    + "where name like ? \n"
                    + "order by id\n"
                    + "offset ? rows fetch next ? rows only";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, '%' + search + '%');
            ps.setInt(2, (page - 1) * recordPerPage);
            ps.setInt(3, recordPerPage);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                courseses.add(new Course(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(5),
                        rs.getInt(4)
                ));
            }
            dBContext.closeConnection(connection, ps);
        } catch (SQLException e) {
            Logger.getLogger(Course.class.getName()).log(Level.SEVERE, null, e);
        }
        return courseses;
    }

    public static void main(String[] args) {
        System.out.println(new CourseDao().gets("", 1, 5));
    }

    public int getCount() {
        DBContext dBContext = new DBContext();
        int count = 0;
        try {
            Connection connection = dBContext.getConnection();
            String query = "select COUNT(id) from course";
            PreparedStatement ps = connection.prepareStatement(query);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
            dBContext.closeConnection(connection, ps);
        } catch (SQLException e) {
            Logger.getLogger(Course.class.getName()).log(Level.SEVERE, null, e);
        }
        return count;
    }

    public void delete(int id) {
        DBContext dBContext = new DBContext();
        try {
            Connection connection = dBContext.getConnection();
            String query = "DELETE FROM course WHERE id = ?";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            ps.executeUpdate();
            dBContext.closeConnection(connection, ps);
        } catch (SQLException ex) {
            Logger.getLogger(Course.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void create(String name, String description) {
        DBContext dBContext = new DBContext();
        try {
            Connection connection = dBContext.getConnection();
            String query = "insert into course values(?,?)";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, description);
            ps.executeUpdate();
            dBContext.closeConnection(connection, ps);
        } catch (SQLException e) {
            Logger.getLogger(Course.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public Course getInfomation(int id) {
        DBContext dBContext = new DBContext();
        Course course = new Course();
        try {
            Connection connection = dBContext.getConnection();
            String query = "select * from course where id = ?";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                course.setId(rs.getInt("id"));
                course.setName(rs.getString("name"));
                course.setDescription(rs.getString("description"));
            }
            dBContext.closeConnection(connection, ps);
        } catch (SQLException e) {
            Logger.getLogger(Course.class.getName()).log(Level.SEVERE, null, e);
        }
        return course;
    }

    public void update(Course course) {
        DBContext dBContext = new DBContext();
        try {
            Connection connection = dBContext.getConnection();
            String query = "UPDATE course SET name = ?, description =? WHERE id= ?";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, course.getName());
            ps.setString(2, course.getDescription());
            ps.setInt(3, course.getId());
            ps.executeUpdate();
            dBContext.closeConnection(connection, ps);
        } catch (SQLException e) {
            Logger.getLogger(Course.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public ArrayList<Course> gets() {
        DBContext dBContext = new DBContext();
        ArrayList<Course> courseses = new ArrayList<>();
        try {
            Connection connection = dBContext.getConnection();
            String query = "select * from course";
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                courseses.add(new Course(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3)
                ));
            }
            dBContext.closeConnection(connection, ps);
        } catch (SQLException e) {
            Logger.getLogger(Course.class.getName()).log(Level.SEVERE, null, e);
        }
        return courseses;
    }
}
