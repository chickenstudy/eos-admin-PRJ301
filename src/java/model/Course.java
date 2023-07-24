/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author User
 */
public class Course {

    private int id;
    private String name;
    private String description;
    private int totalTest;
    private int totalQuestion;
    private int totalCourse;

    public Course(int totalCourse) {
        this.totalCourse = totalCourse;
    }

    public int getTotalCourse() {
        return totalCourse;
    }

    public void setTotalCourse(int totalCourse) {
        this.totalCourse = totalCourse;
    }

    public Course(int id, String name, String description, int totalTest, int totalQuestion, int totalCourse) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.totalTest = totalTest;
        this.totalQuestion = totalQuestion;
        this.totalCourse = totalCourse;
    }

    public Course(int id, String name, String description, int totalTest, int totalQuestion) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.totalTest = totalTest;
        this.totalQuestion = totalQuestion;
    }

    public Course(int id, String name, String description) {
        this.id = id;
        this.name = name;
        this.description = description;
    }

    public Course(String name, String description) {
        this.name = name;
        this.description = description;
    }

    public Course() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getTotalTest() {
        return totalTest;
    }

    public void setTotalTest(int totalTest) {
        this.totalTest = totalTest;
    }

    public int getTotalQuestion() {
        return totalQuestion;
    }

    public void setTotalQuestion(int totalQuestion) {
        this.totalQuestion = totalQuestion;
    }

}
