package com.tech.blog.entities;

public class Message {
    
    // Private fields for message content, type, and CSS class
    private String content;
    private String type;
    private String cssClass;

    // Constructor to initialize all fields
    public Message(String content, String type, String cssClass) {
        this.content = content; // Set message content
        this.type = type; // Set message type
        this.cssClass = cssClass; // Set CSS class for message
    }
    
    // Getter and setter methods for all fields
    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getCssClass() {
        return cssClass;
    }

    public void setCssClass(String cssClass) {
        this.cssClass = cssClass;
    }
}
