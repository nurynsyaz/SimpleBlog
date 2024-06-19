package com.tech.blog.servlets;

import com.tech.blog.dao.PostDao;
import com.tech.blog.entities.Posts;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.Helper;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DeletePostServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            // Fetch post id from the request
            int pid = Integer.parseInt(request.getParameter("pid"));

            // Create a PostDao object and get the post by ID
            PostDao dao = new PostDao(ConnectionProvider.getConnection());
            Posts post = dao.getPostByPostId(pid);

            // Delete the post
            boolean deleted = dao.deletePost(pid);

            if (deleted) {
                // Delete the associated image file
                String path = request.getRealPath("/") + "blog_pics" + File.separator + post.getpPic();
                Helper.deleteFile(path);
                out.println("Post deleted successfully!");
                response.sendRedirect("profile.jsp");
            } else {
                out.println("Post deletion failed!");
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
