package com.tech.blog.entities;

import java.sql.Timestamp;

public class User {
    // Private fields for user attributes
    private int id;
    private String name;
    private String email;
    private String password;
    private String gender;
    private Timestamp dateTimestamp;
    private String about;
    private String profile;

    // Constructor to initialize all fields
    public User(int id, String name, String email, String password, String gender, Timestamp dateTimestamp, String about) {
        this.id = id; // Set user ID
        this.name = name; // Set user name
        this.email = email; // Set user email
        this.password = password; // Set user password
        this.gender = gender; // Set user gender
        this.dateTimestamp = dateTimestamp; // Set user registration date
        this.about = about; // Set user about info
    }

    // Default constructor
    public User() {
    }

    // Constructor to initialize all fields except user ID and registration date
    public User(String name, String email, String password, String gender, String about) {
        this.name = name; // Set user name
        this.email = email; // Set user email
        this.password = password; // Set user password
        this.gender = gender; // Set user gender
        this.about = about; // Set user about info
    }
    
    // Getter and setter methods for all fields
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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public Timestamp getDateTimestamp() {
        return dateTimestamp;
    }

    public void setDateTimestamp(Timestamp dateTimestamp) {
        this.dateTimestamp = dateTimestamp;
    }

    public String getAbout() {
        return about;
    }

    public void setAbout(String about) {
        this.about = about;
    }

    public String getProfile() {
        return profile;
    }

    public void setProfile(String profile) {
        this.profile = profile;
    }
}
