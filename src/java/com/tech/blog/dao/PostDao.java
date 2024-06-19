package com.tech.blog.dao;

import com.tech.blog.entities.Category;
import com.tech.blog.entities.Posts;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PostDao {

    Connection con;

    public PostDao(Connection con) {
        this.con = con; // Initialize the database connection
    }

    public ArrayList<Category> getAllCategories() {
        ArrayList<Category> list = new ArrayList<>();
        try {
            String q = "select * from categories";
            Statement st = con.createStatement();
            ResultSet set = st.executeQuery(q);
            while (set.next()) {
                int cid = set.getInt("cid"); // Retrieve category ID
                String name = set.getString("name"); // Retrieve category name
                String description = set.getString("description"); // Retrieve category description
                Category c = new Category(cid, name, description);
                list.add(c); // Add category to the list
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list; // Return list of categories
    }

    public boolean savePost(Posts p) {
        boolean f = false;
        try {
            String q = "insert into posts(pTitle,pContent,pCode,pPic,catId,userId) values(?,?,?,?,?,?)";
            PreparedStatement pstmt = con.prepareStatement(q);
            pstmt.setString(1, p.getpTitle()); // Set post title
            pstmt.setString(2, p.getpContent()); // Set post content
            pstmt.setString(3, p.getpCode()); // Set post code
            pstmt.setString(4, p.getpPic()); // Set post picture
            pstmt.setInt(5, p.getCatId()); // Set category ID
            pstmt.setInt(6, p.getUserId()); // Set user ID
            pstmt.executeUpdate();
            f = true; // Update success flag
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f; // Return success flag
    }

    public List<Posts> getAllPosts() {
        List<Posts> list = new ArrayList<>();
        try {
            PreparedStatement p = con.prepareStatement("select * from posts order by pid desc");
            ResultSet set = p.executeQuery();
            while (set.next()) {
                int pid = set.getInt("pid"); // Retrieve post ID
                String pTitle = set.getString("pTitle"); // Retrieve post title
                String pContent = set.getString("pContent"); // Retrieve post content
                String pCode = set.getString("pCode"); // Retrieve post code
                String pPic = set.getString("pPic"); // Retrieve post picture
                Timestamp pdate = set.getTimestamp("pdate"); // Retrieve post date
                int catId = set.getInt("catId"); // Retrieve category ID
                int userId = set.getInt("userId"); // Retrieve user ID
                Posts post = new Posts(pid, pTitle, pContent, pCode, pPic, pdate, catId, userId);
                list.add(post); // Add post to the list
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list; // Return list of posts
    }

    public List<Posts> getPostByCatId(int catId) {
        List<Posts> list = new ArrayList<>();
        try {
            PreparedStatement p = con.prepareStatement("select * from posts where catId = ?");
            p.setInt(1, catId); // Set category ID
            ResultSet set = p.executeQuery();
            while (set.next()) {
                int pid = set.getInt("pid"); // Retrieve post ID
                String pTitle = set.getString("pTitle"); // Retrieve post title
                String pContent = set.getString("pContent"); // Retrieve post content
                String pCode = set.getString("pCode"); // Retrieve post code
                String pPic = set.getString("pPic"); // Retrieve post picture
                Timestamp pdate = set.getTimestamp("pdate"); // Retrieve post date
                int userId = set.getInt("userId"); // Retrieve user ID
                Posts post = new Posts(pid, pTitle, pContent, pCode, pPic, pdate, catId, userId);
                list.add(post); // Add post to the list
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list; // Return list of posts by category ID
    }

    public Posts getPostByPostId(int postId) {
        Posts post = null;
        String q = "select * from posts where pid = ?";
        try {
            PreparedStatement p = this.con.prepareStatement(q);
            p.setInt(1, postId); // Set post ID
            ResultSet set = p.executeQuery();
            if (set.next()) {
                int pid = set.getInt("pid"); // Retrieve post ID
                String pTitle = set.getString("pTitle"); // Retrieve post title
                String pContent = set.getString("pContent"); // Retrieve post content
                String pCode = set.getString("pCode"); // Retrieve post code
                String pPic = set.getString("pPic"); // Retrieve post picture
                Timestamp pdate = set.getTimestamp("pdate"); // Retrieve post date
                int cid = set.getInt("catId"); // Retrieve category ID
                int userId = set.getInt("userId"); // Retrieve user ID
                post = new Posts(pid, pTitle, pContent, pCode, pPic, pdate, cid, userId);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return post; // Return post by post ID
    }

    public List<Posts> getLatestPosts() {
        List<Posts> list = new ArrayList<>();
        try {
            PreparedStatement p = con.prepareStatement("select* from posts order by pDate desc limit 6");
            ResultSet set = p.executeQuery();
            while (set.next()) {
                int pid = set.getInt("pid"); // Retrieve post ID
                String pTitle = set.getString("pTitle"); // Retrieve post title
                String pContent = set.getString("pContent"); // Retrieve post content
                String pCode = set.getString("pCode"); // Retrieve post code
                String pPic = set.getString("pPic"); // Retrieve post picture
                Timestamp date = set.getTimestamp("pDate"); // Retrieve post date
                int userId = set.getInt("userId"); // Retrieve user ID
                int catId = set.getInt("catId"); // Retrieve category ID
                Posts post = new Posts(pid, pTitle, pContent, pCode, pPic, date, catId, userId);
                list.add(post); // Add post to the list
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list; // Return list of latest posts
    }

    public boolean updatePost(Posts post) {
        boolean f = false;
        try {
            String q = "update posts set pTitle=?, pContent=?, pCode=?, pPic=?, catId=? where pid=?";
            PreparedStatement pstmt = con.prepareStatement(q);
            pstmt.setString(1, post.getpTitle()); // Set post title
            pstmt.setString(2, post.getpContent()); // Set post content
            pstmt.setString(3, post.getpCode()); // Set post code
            pstmt.setString(4, post.getpPic()); // Set post picture
            pstmt.setInt(5, post.getCatId()); // Set category ID
            pstmt.setInt(6, post.getPid()); // Set post ID
            pstmt.executeUpdate();
            f = true; // Update success flag
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f; // Return success flag
    }

    public boolean deletePost(int pid) {
        boolean f = false;
        try {
            String q = "delete from posts where pid=?";
            PreparedStatement pstmt = con.prepareStatement(q);
            pstmt.setInt(1, pid); // Set post ID
            pstmt.executeUpdate();
            f = true; // Update success flag
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f; // Return success flag
    }

}
