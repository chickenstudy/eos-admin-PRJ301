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
import model.Question;

/**
 *
 * @author User
 */
public class QuestionDao {

    public int getCount(int id) {
        DBContext dBContext = new DBContext();
        int count = 0;
        try {
            Connection connection = dBContext.getConnection();
            String query = "select COUNT(id) from question where id_course = ?";
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

    public ArrayList<Question> gets(int id, String search, int page, int recordPerPage) {
        DBContext dBContext = new DBContext();
        ArrayList<Question> questions = new ArrayList<>();
        try {
            Connection connection = dBContext.getConnection();
            String query = "select * "
                    + "from question \n"
                    + "where id_course = ? and question like ? \n"
                    + "order by id\n"
                    + "offset ? rows fetch next ? rows only";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            ps.setString(2, '%' + search + '%');
            ps.setInt(3, (page - 1) * recordPerPage);
            ps.setInt(4, recordPerPage);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                questions.add(new Question(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getInt(8)
                ));
            }
            dBContext.closeConnection(connection, ps);
        } catch (SQLException e) {
            Logger.getLogger(Course.class.getName()).log(Level.SEVERE, null, e);
        }
        return questions;
    }

    public void create(String question, String optionA, String optionB, String optionC, String optionD, int rightOption, int idCourse) {
        DBContext dBContext = new DBContext();
        try {
            Connection connection = dBContext.getConnection();
            String query = "insert into question values(?,?,?,?,?,?,?)";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, question);
            ps.setString(2, optionA);
            ps.setString(3, optionB);
            ps.setString(4, optionC);
            ps.setString(5, optionD);
            ps.setInt(6, rightOption);
            ps.setInt(7, idCourse);
            ps.executeUpdate();
            dBContext.closeConnection(connection, ps);
        } catch (SQLException e) {
            Logger.getLogger(Question.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public void update(int id, String question, String optionA, String optionB, String optionC, String optionD, int rightOption, int idCourse) {
        DBContext dBContext = new DBContext();
        try {
            Connection connection = dBContext.getConnection();
            String query = "update question set question = ?, option_a=?, option_b=?,"
                    + "option_c=?,option_d=?,option_right=?,id_course =? where id =?";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, question);
            ps.setString(2, optionA);
            ps.setString(3, optionB);
            ps.setString(4, optionC);
            ps.setString(5 , optionD);
            ps.setInt(6, rightOption);
            ps.setInt(7, idCourse);
            ps.setInt(8, id);
            ps.executeUpdate();
            dBContext.closeConnection(connection, ps);
        } catch (SQLException e) {
            Logger.getLogger(Question.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public void deleteMap(int id) {
        DBContext dBContext = new DBContext();
        try {
            Connection connection = dBContext.getConnection();
            String query = " delete from map_test where id_question = ?";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            ps.executeUpdate();
            dBContext.closeConnection(connection, ps);
        } catch (SQLException ex) {
            Logger.getLogger(Course.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void delete(int id) {
        DBContext dBContext = new DBContext();
        try {
            Connection connection = dBContext.getConnection();
            String query = "DELETE FROM question WHERE id = ?";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            ps.executeUpdate();
            dBContext.closeConnection(connection, ps);
        } catch (SQLException ex) {
            Logger.getLogger(Course.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
//select * from question where id in (select id_question from map_test where map_test.id_test = 2)

    public ArrayList<Question> getQuestionTest(int id) {
        DBContext dBContext = new DBContext();
        ArrayList<Question> questions = new ArrayList<>();
        try {
            Connection connection = dBContext.getConnection();
            String query = "select * from question where id in (select id_question from map_test where map_test.id_test = ?)";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                questions.add(new Question(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getInt(8)
                ));
            }
            dBContext.closeConnection(connection, ps);
        } catch (SQLException e) {
            Logger.getLogger(Course.class.getName()).log(Level.SEVERE, null, e);
        }
        return questions;
    }

    public ArrayList<Question> getQuestionCourse(int idCourse, int idTest) {
        DBContext dBContext = new DBContext();
        ArrayList<Question> questions = new ArrayList<>();
        try {
            Connection connection = dBContext.getConnection();
            String query = "select * from question where id_course = ? and id not in (select id_question from map_test where id_test = ? ) ";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, idCourse);
            ps.setInt(2, idTest);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                questions.add(new Question(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getInt(8)
                ));
            }
            dBContext.closeConnection(connection, ps);
        } catch (SQLException e) {
            Logger.getLogger(Course.class.getName()).log(Level.SEVERE, null, e);
        }
        return questions;
    }

    public void createQuestionTest(int idTest, int idQuestion) {
        DBContext dBContext = new DBContext();
        try {
            Connection connection = dBContext.getConnection();
            String query = "insert into map_test values(?,?)";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, idQuestion);
            ps.setInt(2, idTest);
            ps.executeUpdate();
            dBContext.closeConnection(connection, ps);
        } catch (SQLException e) {
            Logger.getLogger(Question.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public void removeQuestionTest(int idTest, int idQuestion) {
        DBContext dBContext = new DBContext();
        try {
            Connection connection = dBContext.getConnection();
            String query = " delete from map_test where id_question = ? and id_test = ?";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, idQuestion);
            ps.setInt(2, idTest);
            ps.executeUpdate();
            dBContext.closeConnection(connection, ps);
        } catch (SQLException ex) {
            Logger.getLogger(Course.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
