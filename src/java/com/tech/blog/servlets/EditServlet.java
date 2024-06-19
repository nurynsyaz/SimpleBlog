package com.tech.blog.servlets;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
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
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig
public class EditServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            // Fetching all new data from the request
            String userEmail = request.getParameter("user_email");
            String userName = request.getParameter("user_name");
            String userPassword = request.getParameter("user_password");
            String userAbout = request.getParameter("user_about");
            Part part = request.getPart("image");
            String imageName = part.getSubmittedFileName();

            // Set user data from session
            HttpSession s = request.getSession();
            User user = (User) s.getAttribute("currentUser");
            user.setEmail(userEmail);
            user.setName(userName);
            user.setPassword(userPassword);
            user.setAbout(userAbout);
            String oldFile = user.getProfile();
            user.setProfile(imageName);

            // Update user data in the database
            UserDao userDao = new UserDao(ConnectionProvider.getConnection());
            boolean ans = userDao.updateUser(user);

            if (ans) {
                // Save the new profile picture
                String path = request.getRealPath("/") + "picture" + File.separator + user.getProfile();
                // Deleting old pic from server after updating a new one
                String pathOldFile = request.getRealPath("/") + "picture" + File.separator + oldFile;
                
                // To prevent deletion of "default.png" image
                if (!oldFile.equals("default.png")) {
                    Helper.deleteFile(pathOldFile);
                }
                
                if (Helper.saveFile(part.getInputStream(), path)) {
                    out.println("profile data updated");
                    Message msg = new Message("profile data updated", "success", "alert-success");
                    s.setAttribute("msg", msg);
                } else {
                    out.println("file not saved ");
                    Message msg = new Message("something went wrong", "error", "alert-danger");
                    s.setAttribute("msg", msg);
                }
            } else {
                out.println("data not updated");
                Message msg = new Message("something went wrong", "error", "alert-danger");
                s.setAttribute("msg", msg);
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
