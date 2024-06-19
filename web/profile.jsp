<%@page import="java.util.List"%> <!-- Import List class from java.util package -->
<%@page import="com.tech.blog.entities.Posts"%> <!-- Import Posts class from com.tech.blog.entities package -->
<%@page import="java.util.ArrayList"%> <!-- Import ArrayList class from java.util package -->
<%@page import="com.tech.blog.entities.Category"%> <!-- Import Category class from com.tech.blog.entities package -->
<%@page import="com.tech.blog.helper.ConnectionProvider"%> <!-- Import ConnectionProvider class from com.tech.blog.helper package -->
<%@page import="com.tech.blog.dao.PostDao"%> <!-- Import PostDao class from com.tech.blog.dao package -->
<%@page import="com.tech.blog.entities.Message"%> <!-- Import Message class from com.tech.blog.entities package -->
<%@page import="com.tech.blog.entities.User"%> <!-- Import User class from com.tech.blog.entities package -->
<%@page errorPage="error_page.jsp"%> <!-- Specify error page -->

<%
    // Retrieve the current user from the session
    User user = (User) session.getAttribute("currentUser");

    // Redirect to login page if user is not logged in
    if (user == null) {
        response.sendRedirect("login-page.jsp");
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%> <!-- Set the content type and encoding for the page -->
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> <!-- Set the character encoding for the page -->
    <title>Profile Page</title> <!-- Set the title of the page -->

    <!-- Link to Bootstrap CSS for styling -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> <!-- Set the character encoding for the page again -->
    <title>JSP Page</title> <!-- Set the title of the page again -->
    <link href="css/mystyle.css" rel="stylesheet" type="text/css"/> <!-- Link to custom CSS file -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> <!-- Link to Font Awesome CSS for icons -->
    <!--Custom style for banner background -->
    <!-- Set the background image for the body -->
    <!-- Cover the entire body with the background image -->
    <!-- Fix the background image attachment -->
    <style>
        .banner-background {
            clip-path: polygon(0% 0%, 81% 5%, 95% 54%, 80% 96%, 0% 100%); 
        }
        body{
            background:url(image/orange_bg.jpg); 
            background-size: cover; 
            background-attachment: fix; 
        }
    </style>
</head>
<body>

<!-- Navbar Start -->
<nav class="navbar navbar-expand-lg navbar-dark primary-background">
    <a class="navbar-brand" href="index.jsp"><span class="fa fa-asterisk"></span> Simple Blog</a> <!-- Brand link with icon -->
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"> <!-- Toggler button for mobile view -->
        <span class="navbar-toggler-icon"></span> <!-- Icon for the toggler button -->
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent"> <!-- Collapsible part of the navbar -->
        <ul class="navbar-nav mr-auto"> <!-- Navbar items aligned to the left -->
            <li class="nav-item active">
                <a class="nav-link" href="#"><span class="fa fa-home"></span>Home <span class="sr-only">(current)</span></a> <!-- Home link with icon -->
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#"><span class="fa fa-phone-square"></span>Contact us</a> <!-- Contact us link with icon -->
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#" data-toggle="modal" data-target="#add-post-modal"><span class="fa fa-asterisk"></span>Post</a> <!-- Post link with icon -->
            </li>
        </ul>
        <ul class="navbar-nav mr-right"> <!-- Navbar items aligned to the right -->
            <li class="nav-item">
                <a class="nav-link" href="#!" data-toggle="modal" data-target="#profile-modal"><span class="fa fa-user-circle"></span> <%= user.getName()%></a> <!-- Profile link with user name -->
            </li>
            <li class="nav-item">
                <a class="nav-link" href="LogoutServlet1"><span class="fa fa-user-plus"></span>Logout</a> <!-- Logout link with icon -->
            </li>
        </ul>
    </div>
</nav>
<!-- Navbar End -->

<%
    // Retrieve the message from the session
    Message m = (Message) session.getAttribute("msg");

    // Display the message if available
    if (m != null) {
%>
<div class="alert <%= m.getCssClass()%>" role="alert">
    <%= m.getContent()%>
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
</div>
<%
        // Remove the message attribute from the session
        session.removeAttribute("msg");
    }
%>

<!-- Main body of the page -->
<main>
    <div class="container">
        <div class="row mt-4">
            <!-- First column -->
            <div class="col-md-4">
                <!-- Categories -->
                <div class="list-group">
                    <a href="#" onclick="getPosts(0, this)" class="c-link list-group-item list-group-item-action active"> <!-- Link to get all posts -->
                        All Posts
                    </a>

                    <%
                        // Get all categories from the database
                        PostDao d = new PostDao(ConnectionProvider.getConnection());
                        ArrayList<Category> list1 = d.getAllCategories();
                        for (Category cc : list1) {
                    %>
                    <a href="#" onclick="getPosts(<%= cc.getCid()%>, this)" class="c-link list-group-item list-group-item-action"><%= cc.getName()%></a> <!-- Link to get posts by category -->
                    <%
                        }
                    %>
                </div>
            </div>

            <!-- Second column -->
            <div class="col-md-8">
                <!-- Posts -->
                <div class="container text-center" id="loader">
                    <i class="fa fa-refresh fa-4x fa-spin"></i> <!-- Loading spinner -->
                    <h3 class="mt-4">loading....</h3>
                </div>

                <div class="container-fluid" id="post-container">
                    <%
                        // Get all posts from the database
                        List<Posts> posts = d.getAllPosts();
                        for (Posts p : posts) {
                    %>
                    <div class="card mt-2" style="border:2px black;">
                        <div class="card-body">
                            <h5 class="card-title"><%= p.getpTitle() %></h5> <!-- Display post title -->
                            <p class="card-text"><%= p.getpContent() %></p> <!-- Display post content -->
                            <a href="show_blog_page.jsp?post_id=<%= p.getPid() %>" class="btn btn-primary">Read More</a> <!-- Link to read more about the post -->
                        </div>
                    </div>
                    <%
                        }
                    %>
                </div>
            </div>
        </div>
    </div>
</main>
<!-- End of main body of the page -->

<!-- Profile modal -->
<div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header primary-background text-white">
                <h5 class="modal-title" id="exampleModalLabel">Simple Blog || Profile </h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="container text-center">
                    <img src="picture/<%= user.getProfile()%>" style="border-radius :50%"> <!-- Display user profile picture -->
                    <br>
                    <h5 class="modal-title mt-3" id="exampleModalLabel"><%= user.getName()%></h5> <!-- Display user name -->
                    <div id="profile-details">
                        <table class="table">
                            <tbody>
                                <tr>
                                    <th scope="row">ID :</th>
                                    <td><%= user.getId()%></td> <!-- Display user ID -->
                                </tr>
                                <tr>
                                    <th scope="row">Gender :</th>
                                    <td><%= user.getGender()%></td> <!-- Display user gender -->
                                </tr>
                                <tr>
                                    <th scope="row">About :</th>
                                    <td><%= user.getAbout()%></td> <!-- Display user about information -->
                                </tr>
                                <tr>
                                    <th scope="row">Email :</th>
                                    <td><%= user.getEmail()%></td> <!-- Display user email -->
                                </tr>
                                <tr>
                                    <th scope="row">Registered on :</th>
                                    <td><%= user.getDateTimestamp()%></td> <!-- Display user registration date -->
                                </tr>
                            </tbody>
                        </table>
                    </div> 
                    <div id="profile-edit" style="display : none;">
                        <h3 class="mt-3">Edit Carefully!</h3>
                        <form action="EditServlet" method="post" enctype="multipart/form-data"> 
                            <table class="table">
                                <tr>
                                    <td>ID :</td>
                                    <td> <%= user.getId()%> </td> <!-- Display user ID -->
                                </tr>
                                <tr>
                                    <td>Email :</td>
                                    <td> <input class="form-control" type="email" name="user_email" value="<%= user.getEmail()%>" > </td> <!-- Input field for user email -->
                                </tr>
                                <tr>
                                    <td>Name :</td>
                                    <td> <input class="form-control" type="text" name="user_name" value="<%= user.getName()%>" > </td> <!-- Input field for user name -->
                                </tr>
                                <tr>
                                    <td>Password :</td>
                                    <td> <input class="form-control" type="password" name="user_password" value="<%= user.getPassword()%>" > </td> <!-- Input field for user password -->
                                </tr>
                                <tr>
                                    <td>Gender :</td>
                                    <td> <%= user.getGender().toUpperCase()%> </td> <!-- Display user gender -->
                                </tr>
                                <tr>
                                    <td>About :</td>
                                    <td> 
                                        <textarea cols="30" rows="10" class="fomr-control" name="user_about"><%= user.getAbout()%></textarea> <!-- Textarea for user about information -->
                                    </td>
                                </tr>
                                <tr>
                                    <td>Update profile pic :</td>
                                    <td> <input type="file" name="image" class="form-control"> </td> <!-- Input field for user profile picture -->
                                </tr>
                            </table>
                            <div class="container">
                                <button type="submit" class="btn btn-outline-primary">Save</button> <!-- Save button -->
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button> <!-- Close button -->
                <button id="edit-profile-button" type="button" class="btn btn-primary">Edit</button> <!-- Edit button -->
            </div>
        </div>
    </div>
</div>

<!-- Add post modal -->
<div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Provide the post details</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="add-post-form" action="AddPostServlet" method="post" enctype="multipart/form-data">
                    <div class="form-group">
                        <select class="form-control" name="cid">
                            <option selected disabled>----Select Category----</option>
                            <%
                                PostDao postd = new PostDao(ConnectionProvider.getConnection());
                                ArrayList<Category> list = postd.getAllCategories();
                                for (Category c : list) {
                            %>
                            <option value="<%= c.getCid()%>"> <%= c.getName()%></option> <!-- Options for categories -->
                            <%
                                }
                            %>
                        </select>
                    </div>
                    <div class="form-group">
                        <input name="pTitle" type="text" placeholder="Enter post title" class="form-control"> <!-- Input field for post title -->
                    </div>
                    <div class="form-group">
                        <textarea name="pContent" class="form-control" style="height:200px" placeholder="Enter your Content"></textarea> <!-- Textarea for post content -->
                    </div>
                    <div class="form-group">
                        <textarea name="pCode" class="form-control" style="height:200px" placeholder="Enter your program(if any)"></textarea> <!-- Textarea for post code -->
                    </div>
                    <div class="form-group">
                        <label> select your pic </label> <!-- Label for post picture -->
                        <br>
                        <input name="pic" type="file"> <!-- Input field for post picture -->
                    </div>
                    <div class="container text-center">
                        <button type="submit" class="btn btn-outline-primary"> POST</button> <!-- Post button -->
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- JavaScript links for interactivity and functionality -->
<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script> <!-- Link to jQuery -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script> <!-- Link to Popper.js -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script> <!-- Link to Bootstrap JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script> <!-- Link to SweetAlert JavaScript library -->
<script src="js/myJS.js" type="text/javascript"></script> <!-- Link to custom JavaScript file -->

<script>
    // Toggle the edit information of user
    $(document).ready(function () {
        let editStatus = false;
        $('#edit-profile-button').click(function () {
            if (editStatus == false) {
                $('#profile-details').hide(); <!-- Hide profile details -->
                $('#profile-edit').show(); <!-- Show profile edit form -->
                editStatus = true;
                $(this).text("back");
            } else {
                $('#profile-details').show(); <!-- Show profile details -->
                $('#profile-edit').hide(); <!-- Hide profile edit form -->
                editStatus = false;
                $(this).text("Edit");
            }
        });
    });
</script>

<!-- Add post -->
<script>
    $(document).ready(function (e) {
        $("#add-post-form").on("submit", function (event) {
            event.preventDefault();
            console.log("you have clicked on submit");

            let form = new FormData(this);

            // Requesting to server
            $.ajax({
                url: "AddPostServlet",
                type: 'POST',
                data: form,
                success: function (data, textStatus, jqXHR) {
                    console.log(data);
                    if (data.trim() === 'done') {
                        swal("Good job!", "Saved successfully!", "success");
                    } else {
                        swal("ERROR!!", "Something went wrong", "error");
                    }
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    swal("ERROR!!", "Something went wrong", "error");
                },
                processData: false,
                contentType: false
            });
        });
    });
</script>

<!-- Load posts using Ajax -->
<script>
    function getPosts(catId, temp) {
        $("#loader").show(); <!-- Show loader -->
        $("#post-container").hide(); <!-- Hide post container -->
        $(".c-link").removeClass('active'); <!-- Remove active class from category links -->
        $.ajax({
            url: "load_posts.jsp",
            data: {cid: catId},
            success: function (data, textStatus, jqXHR) {
                console.log(data);
                $("#loader").hide(); <!-- Hide loader -->
                $("#post-container").show(); <!-- Show post container -->
                $('#post-container').html(data);
                $(temp).addClass('active'); <!-- Add active class to the selected category link -->
            }
        });
    }
    $(document).ready(function (e) {
        let allPostRef = $('.c-link')[0];
        getPosts(0, allPostRef); <!-- Load all posts on page load -->
    });
</script>
</body>
</html>
