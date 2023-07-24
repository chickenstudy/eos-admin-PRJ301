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
import model.Test;

/**
 *
 * @author User
 */
public class TestDao {

    public int getCount(int id) {
        DBContext dBContext = new DBContext();
        int count = 0;
        try {
            Connection connection = dBContext.getConnection();
            String query = "select COUNT(*) from test where id_course = ?";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, id);
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



    public ArrayList<Test> gets(int id, String search, int page, int recordPerPage) {
        DBContext dBContext = new DBContext();
        ArrayList<Test> tests = new ArrayList<>();
        try {
            Connection connection = dBContext.getConnection();
            String query = " select *,"
                    + "( select COUNT(*)FROM map_test "
                    + "where map_test.id_test = test.id) as total_question "
                    + "from test where id_course = ? and name like ?\n"
                    + "order by id\n"
                    + "offset ? rows fetch next ? rows only";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            ps.setString(2, '%' + search + '%');
            ps.setInt(3, (page - 1) * recordPerPage);
            ps.setInt(4, recordPerPage);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                tests.add(new Test(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getInt(7)
                ));
            }
            dBContext.closeConnection(connection, ps);
        } catch (SQLException e) {
            Logger.getLogger(Course.class.getName()).log(Level.SEVERE, null, e);
        }
        return tests;
    }

    public void create(String name, String description, int time, int numberQuestion, int idCourse) {
        DBContext dBContext = new DBContext();
        try {
            Connection connection = dBContext.getConnection();
            String query = "insert into test values(?,?,?,?,?)";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, description);
            ps.setInt(3, time);
            ps.setInt(4, numberQuestion);
            ps.setInt(5, idCourse);

            ps.executeUpdate();
            dBContext.closeConnection(connection, ps);
        } catch (SQLException e) {
            Logger.getLogger(Course.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public void delete(int id) {
        DBContext dBContext = new DBContext();
        try {
            Connection connection = dBContext.getConnection();
            String query = "DELETE FROM test WHERE id = ?";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            ps.executeUpdate();
            dBContext.closeConnection(connection, ps);
        } catch (SQLException ex) {
            Logger.getLogger(Course.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Test get(int id) {
        DBContext dBContext = new DBContext();
        Test test = new Test();
        try {
            Connection connection = dBContext.getConnection();
            String query = "select * ,( select COUNT(*)FROM map_test where map_test.id_test = test.id) as total_question from test where id = ?";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                test = new Test(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getInt(7));
            }
            dBContext.closeConnection(connection, ps);
        } catch (SQLException e) {
            Logger.getLogger(Course.class.getName()).log(Level.SEVERE, null, e);
        }
        return test;
    }

    public void update(String name, String description, int time, int numberQuestion, int idCourse, int id) {
        DBContext dBContext = new DBContext();
        try {
            Connection connection = dBContext.getConnection();
            String query = "UPDATE test SET name = ? ,description=?, time=?,number_question=?,id_course=? where id =?";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, description);
            ps.setInt(3, time);
            ps.setInt(4, numberQuestion);
            ps.setInt(5, idCourse);
            ps.setInt(6, id);
            ps.executeUpdate();
            dBContext.closeConnection(connection, ps);
        } catch (SQLException e) {
            Logger.getLogger(Course.class.getName()).log(Level.SEVERE, null, e);
        }
    }

}
