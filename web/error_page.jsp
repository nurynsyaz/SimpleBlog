<%@page contentType="text/html" pageEncoding="UTF-8"%> <!-- Set the content type and encoding for the page -->
<%@page isErrorPage="true"%> <!-- Indicates that this page is an error page -->
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> <!-- Set the character encoding for the page -->
    <title>Sorry! Something went Wrong</title> <!-- Set the title of the page -->
    
    <!-- Bootstrap CSS for styling -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> <!-- Set the character encoding for the page again -->
    <title>Simple Blog Group 5</title> <!-- Set the title of the page -->
    <link href="css/mystyle.css" rel="stylesheet" type="text/css"/> <!-- Link to custom CSS file -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> <!-- Link to Font Awesome CSS for icons -->
    
    <!-- Inline CSS for custom styles -->
    <!-- Custom style for banner background -->
    <style>
        .banner-background {
            clip-path: polygon(0% 0%, 81% 5%, 95% 54%, 80% 96%, 0% 100%); 
        }
    </style>
</head>
<body>
    <div class="container text-center">
        <img src="image/error.png" class="img-fluid"> <!-- Display an error image -->
        <h3 class="display-3">Sorry! Something Went Wrong</h3> <!-- Display an error message -->
        <%= exception %> <!-- Display the exception message -->
        <a href="index.jsp" class="btn primary-background btn-lg text-white mt-3">Home</a> <!-- Link to redirect the user to the home page -->
    </div>
</body>
</html>
