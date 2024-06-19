package com.tech.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LikeDao {

    Connection con;

    public LikeDao(Connection con) {
        this.con = con; // Initialize the database connection
    }

    public boolean insertLike(int pid, int uid) {
        boolean f = false;
        try {
            String q = "insert into liked(pid,uid) values(?,?)";
            PreparedStatement p = this.con.prepareStatement(q);
            // Setting values for the prepared statement
            p.setInt(1, pid); // Set post ID
            p.setInt(2, uid); // Set user ID
            p.executeUpdate();
            f = true; // Update success flag

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f; // Return success flag
    }

    public int countLikeOnPost(int pid) {
        int count = 0;
        String q = "select count(*) from liked where pid = ?";

        try {
            PreparedStatement p = this.con.prepareStatement(q);
            p.setInt(1, pid); // Set post ID
            ResultSet set = p.executeQuery();
            if (set.next()) {
                count = set.getInt("count(*)"); // Retrieve like count
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return count; // Return like count
    }

    public boolean isLikedByUser(int pid, int uid) {
        boolean f = false;
        try {
            PreparedStatement p = this.con.prepareStatement("select * from liked where pid=? and uid=?");
            p.setInt(1, pid); // Set post ID
            p.setInt(2, uid); // Set user ID
            ResultSet set = p.executeQuery();
            if (set.next()) {
                f = true; // User has liked the post
            }

        } catch (Exception e) {
        }

        return f; // Return if liked by user
    }
    
    public boolean deleteLike(int pid, int uid) {
        boolean f = false;
        
        try {
            PreparedStatement p = this.con.prepareStatement("delete from liked where pid= ? and uid = ? ");
            p.setInt(1, pid); // Set post ID
            p.setInt(2, uid); // Set user ID
            p.executeUpdate();
            f = true; // Update success flag

        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return f; // Return success flag
    }

}
