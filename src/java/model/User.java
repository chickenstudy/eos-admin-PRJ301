/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;

/**
 *
 * @author User
 */
public class User {

    

  
    @Override
    public String toString() {
        return "Users{" + "id=" + id + ", full_name=" + full_name  + ", password=" + password + ", dob=" + dob + ", gender=" + gender  + ", email=" + email + ", phone_number=" + phone_number + '}';
    }

   
    private int id;
    private String full_name;
    private String password;
    private Date dob;
    private String gender;
    private String email;
    private String phone_number;

    public User() {
    }

    public User(int id, String full_name, String password, Date dob, String gender, String email, String phone_number) {
        this.id = id;
        this.full_name = full_name;
        this.password = password;
        this.dob = dob;
        this.gender = gender;
        this.email = email;
        this.phone_number = phone_number;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFullName() {
        return full_name;
    }

    public void setFullName(String full_name) {
        this.full_name = full_name;
    }

  

   

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

  

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getNumberPhone() {
        return phone_number;
    }

    public void setNumberPhone(String phone_number) {
        this.phone_number = phone_number;
    }

}
