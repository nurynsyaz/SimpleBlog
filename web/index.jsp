<%@page import="java.util.List"%> <!-- Import List class from java.util package -->
<%@page import="com.tech.blog.dao.PostDao"%> <!-- Import PostDao class from com.tech.blog.dao package -->
<%@page import="com.tech.blog.entities.Posts"%> <!-- Import Posts class from com.tech.blog.entities package -->
<%@page import="com.tech.blog.helper.ConnectionProvider"%> <!-- Import ConnectionProvider class from com.tech.blog.helper package -->
<%@page import="java.sql.*"%> <!-- Import all classes from java.sql package -->
<%@page contentType="text/html" pageEncoding="UTF-8"%> <!-- Set the content type and encoding for the page -->
<!DOCTYPE html>
<html>
<head>
    <!-- Link to Bootstrap CSS for styling -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> <!-- Set the character encoding for the page -->
    <title>Simple Blog Group 5</title> <!-- Set the title of the page -->
    <link href="css/mystyle.css" rel="stylesheet" type="text/css"/> <!-- Link to custom CSS file -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> <!-- Link to Font Awesome CSS for icons -->
    
    <style>
        .banner-background {
            clip-path: polygon(0% 0%, 81% 5%, 95% 54%, 80% 96%, 0% 100%); 
        }
    </style>
</head>
<body>
    <!-- Include the navigation bar from an external JSP file -->
    <%@include file="normal_navbar.jsp" %> 

    <!-- Banner section -->
    <div class="container-fluid p-0 m-0">
        <div class="jumbotron primary-background text-white banner-background">
            <div class="container">
                <h1 class="display-3">Simple Blog Website</h1> <!-- Display the main heading -->
                <p>
                    The Simple Blog System is a web application which is designed to provide a platform for
                    users to share their thoughts, ideas, or stories in the form of blog posts. It focuses on
                    implementing basic CRUD which are Create, Read, Update, Delete operations within a web
                    application, allowing users to easily create, view, edit and delete their posts. This project aims to
                    address the need for a straightforward blogging platform, focusing on the core aspects of web
                    development without the complexity of more advanced systems.
                </p> <!-- Display the description of the blog system -->

                <a href="login-page.jsp" class="btn btn-outline-light btn-lg"><span class="fa fa-sign-in fa-spin"></span>Login</a> <!-- Link to the login page with a button -->
            </div>
        </div>
    </div>
    
    <br>

    <!-- JavaScript links for interactivity and functionality -->
    <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script> <!-- Link to jQuery -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script> <!-- Link to Popper.js -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script> <!-- Link to Bootstrap JS -->
    <script src="js/myJS.js" type="text/javascript"></script> <!-- Link to custom JavaScript file -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script> <!-- Link to SweetAlert2 JavaScript library -->
</body>
</html>
