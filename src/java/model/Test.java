/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;

/**
 *
 * @author User
 */
public class Test {

    private int id;
    private String name;
    private String description;
    private int time;
    private int numberQuestion;
    private int idCourse;
    private int totalQuestion;
    private ArrayList<Question> questions;

    public Test() {
    }

    public Test(int id, String name, String description, int time, int numberQuestion, int idCourse) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.time = time;
        this.numberQuestion = numberQuestion;
        this.idCourse = idCourse;
    }

    public Test(int id, String name, String description, int time, int numberQuestion, int idCourse, int totalQuestion) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.time = time;
        this.numberQuestion = numberQuestion;
        this.idCourse = idCourse;
        this.totalQuestion = totalQuestion;
    }

    public Test(int id, String name, String description, int time, int numberQuestion, int idCourse, int totalQuestion, ArrayList<Question> questions) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.time = time;
        this.numberQuestion = numberQuestion;
        this.idCourse = idCourse;
        this.totalQuestion = totalQuestion;
        this.questions = questions;
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

    public int getTime() {
        return time;
    }

    public void setTime(int time) {
        this.time = time;
    }

    public int getNumberQuestion() {
        return numberQuestion;
    }

    public void setNumberQuestion(int numberQuestion) {
        this.numberQuestion = numberQuestion;
    }

    public int getIdCourse() {
        return idCourse;
    }

    public void setIdCourse(int idCourse) {
        this.idCourse = idCourse;
    }

    public int getTotalQuestion() {
        return totalQuestion;
    }

    public void setTotalQuestion(int totalQuestion) {
        this.totalQuestion = totalQuestion;
    }

    public ArrayList<Question> getQuestions() {
        return questions;
    }

    public void setQuestions(ArrayList<Question> questions) {
        this.questions = questions;
    }



}
