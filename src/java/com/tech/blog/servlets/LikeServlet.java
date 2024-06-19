/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.tech.blog.servlets;

import com.tech.blog.dao.LikeDao;
import com.tech.blog.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LikeServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            // Fetch user ID and post ID from request
            int uid = Integer.parseInt(request.getParameter("uid"));
            int pid = Integer.parseInt(request.getParameter("pid"));

            // Create LikeDao object
            LikeDao ldao = new LikeDao(ConnectionProvider.getConnection());

            // Check if post is already liked by the user
            boolean liked = ldao.isLikedByUser(pid, uid);

            if (!liked) {
                // If not liked, insert like
                boolean f = ldao.insertLike(pid, uid);
                out.println("liked");
            }
            if (liked) {
                // If liked, delete like
                boolean f = ldao.deleteLike(pid, uid);
                out.println("disliked");
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response); // Call processRequest to handle GET request
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response); // Call processRequest to handle POST request
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
