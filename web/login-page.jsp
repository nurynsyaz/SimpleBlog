<%@page import="com.tech.blog.entities.Message"%> <!-- Import Message class from com.tech.blog.entities package -->
<%@page contentType="text/html" pageEncoding="UTF-8"%> <!-- Set the content type and encoding for the page -->
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> <!-- Set the character encoding for the page -->
    <title>Simple Blog Group 5 - Login</title> <!-- Set the title of the page -->

    <!-- Link to Bootstrap CSS for styling -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> <!-- Set the character encoding for the page -->
    <title>Simple Blog Group 5</title> <!-- Set the title of the page again -->
    <link href="css/mystyle.css" rel="stylesheet" type="text/css"/> <!-- Link to custom CSS file -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> <!-- Link to Font Awesome CSS for icons -->
    
    <!-- Inline CSS for custom styles --><!-- Custom style for banner background -->
    <style>
        .banner-background {
            clip-path: polygon(0% 0%, 81% 5%, 95% 54%, 80% 96%, 0% 100%); 
        }
    </style>
</head>

<body>
    <!-- Include the navigation bar from an external JSP file -->
    <%@include file="normal_navbar.jsp"%>

    <!-- Main content section with a login form -->
    <main class="d-flex align-items-center primary-background banner-background" style="height: 80vh">
        <div class="container">
            <div class="row">
                <div class="col-md-4 offset-md-4">

                    <div class="card">
                        <div class="card-header primary-background text-white text-center">
                            <span class="fa fa-user-plus fa-3x"></span> <!-- User icon -->
                            <br>
                            <p>login here</p> <!-- Login prompt -->
                        </div>

                        <%
                            // Retrieve the message from the session
                            Message m = (Message) session.getAttribute("msg");

                            if (m != null) {
                        %>
                        <!-- Display the message if available -->
                        <div class="alert <%= m.getCssClass() %>" role="alert">
                            <%= m.getContent() %>
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>

                        <%
                                // Remove the message attribute from the session
                                session.removeAttribute("msg");
                            }
                        %>

                        <div class="card-body">
                            <!-- Login form -->
                            <form action="LoginServlet" method="post">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label> <!-- Email label -->
                                    <input name="email" required type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email"> <!-- Email input -->
                                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small> <!-- Email help text -->
                                </div>

                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label> <!-- Password label -->
                                    <input name="password" required type="password" class="form-control" id="exampleInputPassword1" placeholder="Password"> <!-- Password input -->
                                </div>

                                <div class="container text-center">
                                    <button type="submit" class="btn btn-primary">Submit</button> <!-- Submit button -->
                                </div>
                            </form>
                        </div>

                    </div>

                </div>
            </div>
        </div>
    </main>

    <!-- JavaScript links for interactivity and functionality -->
    <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script> <!-- Link to jQuery -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script> <!-- Link to Popper.js -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script> <!-- Link to Bootstrap JS -->
    <script src="js/myJS.js" type="text/javascript"></script> <!-- Link to custom JavaScript file -->
</body>
</html>
