package com.tech.blog.dao;

import com.tech.blog.entities.User;
import java.sql.*;

public class UserDao {

    private Connection con;

    public UserDao(Connection con) {
        this.con = con; // Initialize the database connection
    }

    // Method to insert user to database
    public boolean saveUser(User user) {
        boolean f = false;

        try {
            String query = "insert into user(name,email,password,gender,about) values (?,?,?,?,?)";
            PreparedStatement pstmt = this.con.prepareStatement(query);
            pstmt.setString(1, user.getName()); // Set user name
            pstmt.setString(2, user.getEmail()); // Set user email
            pstmt.setString(3, user.getPassword()); // Set user password
            pstmt.setString(4, user.getGender()); // Set user gender
            pstmt.setString(5, user.getAbout()); // Set user about info

            pstmt.executeUpdate();
            f = true; // Update success flag

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f; // Return success flag
    }

    // Get user by email and password
    public User getUserByEmailAndPassword(String email, String password) {
        User user = null;
        /*  This method creates a User object and retrieves user info 
            from the database using the provided email and password. 
            It returns the User object if found, otherwise returns null. */
        try {
            String query = "select* from user where email=? and password=?";
            PreparedStatement psmt = con.prepareStatement(query);
            psmt.setString(1, email); // Set email
            psmt.setString(2, password); // Set password
            ResultSet set = psmt.executeQuery();
            if (set.next()) {
                user = new User();

                // Retrieve data from db
                String name = set.getString("name");
                // Set data to user object
                user.setName(name);

                user.setId(set.getInt("id"));
                user.setEmail(set.getString("email"));
                user.setPassword(set.getString("password"));
                user.setGender(set.getString("gender"));
                user.setAbout(set.getString("about"));
                user.setDateTimestamp(set.getTimestamp("rdate"));
                user.setProfile(set.getString("profile"));
            }

        } catch (SQLException e) {
        }
        return user; // Return user object
    }

    public boolean updateUser(User user) {
        boolean f = false;

        try {
            String query = "update user set name=? , email=? , password=? , gender=?, about=? , profile=? where id=?";
            PreparedStatement p = con.prepareStatement(query);
            p.setString(1, user.getName()); // Set user name
            p.setString(2, user.getEmail()); // Set user email
            p.setString(3, user.getPassword()); // Set user password
            p.setString(4, user.getGender()); // Set user gender
            p.setString(5, user.getAbout()); // Set user about info
            p.setString(6, user.getProfile()); // Set user profile
            p.setInt(7, user.getId()); // Set user ID

            p.executeUpdate();
            f = true; // Update success flag

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f; // Return success flag
    }

    public User getUserByUserId(int userId) {
        User user = null;
        try {
            String q = "select * from user where Id = ?";
            PreparedStatement ps = this.con.prepareStatement(q);
            ps.setInt(1, userId); // Set user ID
            ResultSet set = ps.executeQuery();

            if (set.next()) {
                user = new User();

                // Retrieve data from db
                String name = set.getString("name");
                // Set data to user object
                user.setName(name);

                user.setId(set.getInt("id"));
                user.setEmail(set.getString("email"));
                user.setPassword(set.getString("password"));
                user.setGender(set.getString("gender"));
                user.setAbout(set.getString("about"));
                user.setDateTimestamp(set.getTimestamp("rdate"));
                user.setProfile(set.getString("profile"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return user; // Return user object
    }
}
