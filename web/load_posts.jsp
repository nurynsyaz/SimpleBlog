<%@page import="com.tech.blog.entities.User"%> <!-- Import User class from com.tech.blog.entities package -->
<%@page import="com.tech.blog.dao.LikeDao"%> <!-- Import LikeDao class from com.tech.blog.dao package -->
<%@page import="com.tech.blog.entities.Posts"%> <!-- Import Posts class from com.tech.blog.entities package -->
<%@page import="java.util.List"%> <!-- Import List class from java.util package -->
<%@page import="com.tech.blog.helper.ConnectionProvider"%> <!-- Import ConnectionProvider class from com.tech.blog.helper package -->
<%@page import="com.tech.blog.dao.PostDao"%> <!-- Import PostDao class from com.tech.blog.dao package -->

<div class="row">

    <%
        // Retrieve the current user from the session
        User user = (User) session.getAttribute("currentUser");
        
        // To intentionally delay the response
        Thread.sleep(500);
        
        // Initialize PostDao to interact with the database
        PostDao d = new PostDao(ConnectionProvider.getConnection());

        // Get the category ID from the request parameter
        int cid = Integer.parseInt(request.getParameter("cid"));
        
        // Declare a list to hold posts
        List<Posts> posts = null;
        
        // If category ID is 0, get all posts, otherwise get posts by category ID
        if (cid == 0) {
            posts = d.getAllPosts();
        } else {
            posts = d.getPostByCatId(cid);
        }
        
        // If no posts are available, display a message
        if(posts.size() == 0) {
            out.println("<h3 class='display-3 text-center'>No Post Available In This Category...</h3>");
        }

        // Loop through each post and display it
        for (Posts p : posts) {
    %>

    <div class="col-md-6 mt-2">
        <div class="card">
            <img class="card-img-top" src="blog_pics/<%= p.getpPic() %>" alt="Card image cap"> <!-- Display post image -->
            <div class="card-body">
                <b><%= p.getpTitle() %> </b> <!-- Display post title -->
                <p><%= p.getpContent() %></p> <!-- Display post content -->
            </div>
            <div class="card-footer primary-background text-center">
                <a href="show_blog_page.jsp?post_id=<%= p.getPid() %>" class="btn btn-outline-light btn-sm">Read more...</a> <!-- Link to read more about the post -->
                
                <%
                    // Initialize LikeDao to interact with the database
                    LikeDao ld = new LikeDao(ConnectionProvider.getConnection());
                %>
                
                <!-- Like button with like count -->
                <a href="#!" onclick="doLike(<%= p.getPid() %>,<%= user.getId() %> )" id="like" class="btn btn-sm btn-outline-light"> 
                    <i class="fa fa-thumbs-o-up"></i> 
                    <span id="like-counter-<%= p.getPid() %>"> <%= ld.countLikeOnPost(p.getPid()) %> </span>
                </a>
                
                <!-- Comment button (currently without functionality) -->
                <a href="#!" class="btn btn-outline-light btn-sm">
                    <i class="fa fa-commenting-o"></i> 
                    <span></span>
                </a>
            </div>
        </div>
    </div>

    <%
        } // End of for loop
    %>
</div>
