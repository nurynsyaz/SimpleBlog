<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entities.Posts"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Edit Post</title>
    <!-- Bootstrap CSS for styling -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <!-- Custom CSS -->
    <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>

<% 
    // Get the postId from the request parameter
    int postId = Integer.parseInt(request.getParameter("pid"));
    
    // Initialize PostDao to interact with the database
    PostDao d = new PostDao(ConnectionProvider.getConnection());
    
    // Retrieve the post details by postId using PostDao
    Posts post = d.getPostByPostId(postId);
%>

<div class="container">
    <div class="row">
        <div class="col-md-8 offset-md-2 mt-5">
            <div class="card">
                <div class="card-header primary-background text-white">
                    <h4>Edit Post</h4>
                </div>
                <div class="card-body">
                    <!-- Form to edit the post details -->
                    <form action="UpdatePostServlet" method="post" enctype="multipart/form-data">
                        <!-- Hidden field to store the postId -->
                        <input type="hidden" name="pid" value="<%= post.getPid() %>">
                        
                        <!-- Input field for the post title -->
                        <div class="form-group">
                            <label for="pTitle">Post Title</label>
                            <input type="text" name="pTitle" id="pTitle" class="form-control" value="<%= post.getpTitle() %>">
                        </div>
                        
                        <!-- Dropdown to select the post category -->
                        <div class="form-group">
                            <label for="cid">Category</label>
                            <select class="form-control" name="cid" id="cid">
                                <%
                                    // Get all categories from the database
                                    ArrayList<Category> list = d.getAllCategories();
                                    
                                    // Loop through each category and create an option element
                                    for (Category c : list) {
                                %>
                                <!-- Mark the current category as selected -->
                                <option value="<%= c.getCid() %>" <%= (c.getCid() == post.getCatId()) ? "selected" : "" %>> <%= c.getName() %></option>
                                <%
                                    }
                                %>
                            </select>
                        </div>
                        
                        <!-- Textarea for the post content -->
                        <div class="form-group">
                            <label for="pContent">Post Content</label>
                            <textarea name="pContent" id="pContent" class="form-control" rows="10"><%= post.getpContent() %></textarea>
                        </div>
                        
                        <!-- Textarea for the post code (if any) -->
                        <div class="form-group">
                            <label for="pCode">Post Code (if any)</label>
                            <textarea name="pCode" id="pCode" class="form-control" rows="5"><%= post.getpCode() %></textarea>
                        </div>
                        
                        <!-- File input for the post image -->
                        <div class="form-group">
                            <label for="pic">Post Image</label>
                            <input type="file" name="pic" id="pic" class="form-control">
                            <img src="blog_pics/<%= post.getpPic() %>" alt="Post Image" class="img-thumbnail mt-2" width="100">
                        </div>
                        
                        <!-- Submit and cancel buttons -->
                        <div class="form-group">
                            <button type="submit" class="btn btn-primary">Update Post</button>
                            <a href="profile.jsp" class="btn btn-secondary">Cancel</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- jQuery, Popper.js, and Bootstrap JS for interactivity and functionality -->
<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</body>
</html>
