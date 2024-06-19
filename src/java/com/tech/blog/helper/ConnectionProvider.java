package com.tech.blog.helper;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionProvider {
    
    private static Connection con;

    // Method to get a connection to the database
    public static Connection getConnection() {
        try {
            if (con == null) {
                // Load the MySQL JDBC driver
                Class.forName("com.mysql.jdbc.Driver");
                // Establish the connection
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/techblog", "root", "");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return con; // Return the connection object
    }
}
