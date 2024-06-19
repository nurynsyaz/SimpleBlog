package com.tech.blog.servlets;

import com.tech.blog.dao.PostDao;
import com.tech.blog.entities.Posts;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.Helper;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@MultipartConfig
public class EditPostServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            // Fetch post data from the request
            int pid = Integer.parseInt(request.getParameter("pid"));
            String pTitle = request.getParameter("pTitle");
            String pContent = request.getParameter("pContent");
            String pCode = request.getParameter("pCode");
            int cid = Integer.parseInt(request.getParameter("cid"));
            Part part = request.getPart("pic");
            String pPic = part.getSubmittedFileName();

            // Create a PostDao object and get the post by ID
            PostDao dao = new PostDao(ConnectionProvider.getConnection());
            Posts post = dao.getPostByPostId(pid);

            // Update the post object
            post.setpTitle(pTitle);
            post.setpContent(pContent);
            post.setpCode(pCode);
            post.setCatId(cid);

            // If a new picture is uploaded, save it
            if (pPic != null && !pPic.isEmpty()) {
                String oldPic = post.getpPic();
                post.setpPic(pPic);
                String path = request.getRealPath("/") + "blog_pics" + File.separator + pPic;

                if (Helper.saveFile(part.getInputStream(), path)) {
                    if (!oldPic.equals("default.png")) {
                        Helper.deleteFile(request.getRealPath("/") + "blog_pics" + File.separator + oldPic);
                    }
                }
            }

            // Update the post in the database
            boolean updated = dao.updatePost(post);

            if (updated) {
                out.println("Post updated successfully.");
            } else {
                out.println("Failed to update the post.");
            }

            response.sendRedirect("profile.jsp");
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
