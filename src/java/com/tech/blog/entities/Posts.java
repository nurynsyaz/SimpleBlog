package com.tech.blog.entities;

import java.sql.Timestamp;

public class Posts {
    
    // Private fields for post attributes
    private int pid;
    private String pTitle;
    private String pContent;
    private String pCode;
    private String pPic;
    private Timestamp pDate;
    private int catId;
    private int userId;

    // Default constructor
    public Posts() {
    }

    // Constructor to initialize all fields
    public Posts(int pid, String pTitle, String pContent, String pCode, String pPic, Timestamp pDate, int catId, int userId) {
        this.pid = pid; // Set post ID
        this.pTitle = pTitle; // Set post title
        this.pContent = pContent; // Set post content
        this.pCode = pCode; // Set post code
        this.pPic = pPic; // Set post picture
        this.pDate = pDate; // Set post date
        this.catId = catId; // Set category ID
        this.userId = userId; // Set user ID
    }

    // Constructor to initialize all fields except post ID
    public Posts(String pTitle, String pContent, String pCode, String pPic, Timestamp pDate, int catId, int userId) {
        this.pTitle = pTitle; // Set post title
        this.pContent = pContent; // Set post content
        this.pCode = pCode; // Set post code
        this.pPic = pPic; // Set post picture
        this.pDate = pDate; // Set post date
        this.catId = catId; // Set category ID
        this.userId = userId; // Set user ID
    }

    // Getter and setter methods for all fields
    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public String getpTitle() {
        return pTitle;
    }

    public void setpTitle(String pTitle) {
        this.pTitle = pTitle;
    }

    public String getpContent() {
        return pContent;
    }

    public void setpContent(String pContent) {
        this.pContent = pContent;
    }

    public String getpCode() {
        return pCode;
    }

    public void setpCode(String pCode) {
        this.pCode = pCode;
    }

    public String getpPic() {
        return pPic;
    }

    public void setpPic(String pPic) {
        this.pPic = pPic;
    }

    public Timestamp getpDate() {
        return pDate;
    }

    public void setpDate(Timestamp pDate) {
        this.pDate = pDate;
    }

    public int getCatId() {
        return catId;
    }

    public void setCatId(int catId) {
        this.catId = catId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }
}
