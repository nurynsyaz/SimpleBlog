package com.tech.blog.entities;

public class Category {
    
    // Private fields for the category ID, name, and description
    private int cid;
    private String name;
    private String description;

    // Constructor to initialize all fields
    public Category(int cid, String name, String description) {
        this.cid = cid; // Set category ID
        this.name = name; // Set category name
        this.description = description; // Set category description
    }

    // Default constructor
    public Category() {
    }

    // Constructor to initialize name and description fields
    public Category(String name, String description) {
        this.name = name; // Set category name
        this.description = description; // Set category description
    }

    // Getter method for category ID
    public int getCid() {
        return cid;
    }

    // Setter method for category ID
    public void setCid(int cid) {
        this.cid = cid;
    }

    // Getter method for category name
    public String getName() {
        return name;
    }

    // Setter method for category name
    public void setName(String name) {
        this.name = name;
    }

    // Getter method for category description
    public String getDescription() {
        return description;
    }

    // Setter method for category description
    public void setDescription(String description) {
        this.description = description;
    }
}
