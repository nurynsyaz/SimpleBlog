<%-- 
    Document   : register_page
    Created on : Mar 11, 2023, 10:59:31 AM
    Author     : anura
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%> <!-- Set the content type and encoding for the page -->
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> <!-- Set the character encoding for the page -->
    <title>Register Page</title> <!-- Set the title of the page -->
    
    <!-- Link to Bootstrap CSS for styling -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> <!-- Set the character encoding for the page again -->
    <title> JSP Page</title> <!-- Set the title of the page again -->
    <link href="css/mystyle.css" rel="stylesheet" type="text/css"/> <!-- Link to custom CSS file -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> <!-- Link to Font Awesome CSS for icons -->
    
    <!-- Inline CSS for custom styles -->
    <!-- Custom style for banner background -->
    <!-- Enable scroll for textareas -->
    <!-- Disable resize for textareas -->
    <!-- Set width for textareas -->
    <!-- Set height for textareas -->
    <style>
        .banner-background {
            clip-path: polygon(0% 0%, 81% 5%, 95% 54%, 80% 96%, 0% 100%); 
        }
        textarea {
            overflow: auto; 
            resize: none; 
            width: 200px; 
            height: 100px; 
        }
    </style>
</head>
<body>
    <%@include file="normal_navbar.jsp" %> <!-- Include the navigation bar from an external JSP file -->
    
    <main class="primary-background p-5 banner-background">
        <div class="container">
            <div class="col-md-6 offset-md-3">
                <div class="card">
                    <div class="card-header text-center">
                        <span class="fa fa-3x fa-user-circle"></span> <!-- User icon -->
                        <br>
                        Register here <!-- Register prompt -->
                    </div>
                    <div class="card-body">
                        <form id="reg-form" action="RegisterServlet" method="POST">
                            <div class="form-group">
                                <label for="user_name">User Name</label> <!-- Label for user name -->
                                <input name="user_name" type="text" class="form-control" id="user_name" aria-describedby="emailHelp" placeholder="Enter name"> <!-- Input field for user name -->
                            </div>
                            
                            <div class="form-group">
                                <label for="exampleInputEmail1">Email address</label> <!-- Label for email address -->
                                <input name="user_email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email"> <!-- Input field for email address -->
                                <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small> <!-- Help text for email -->
                            </div>
                            
                            <div class="form-group">
                                <label for="exampleInputPassword1">Password</label> <!-- Label for password -->
                                <input name="user_password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password"> <!-- Input field for password -->
                            </div>
                            
                            <div class="form-group">
                                <label for="gender">Select gender</label> <!-- Label for gender -->
                                <br>
                                <input type="radio" id="gender" name="gender" value="male">Male <!-- Radio button for male -->
                                <input type="radio" id="gender" name="gender" value="female">Female <!-- Radio button for female -->
                                
                                <div class="form-group">
                                    <textarea name="about" class="form-control" cols="30" rows="5" placeholder="Enter something about yourself"></textarea> <!-- Textarea for about section -->
                                </div>
                            </div>
                               
                            <div class="form-check">
                                <input name="check" type="checkbox" class="form-check-input" id="exampleCheck1"> <!-- Checkbox for agreeing terms -->
                                <label class="form-check-label" for="exampleCheck1">Agree Terms and Conditions</label> <!-- Label for checkbox -->
                                <div style="max-height: 200px; overflow-y: scroll; border: 1px solid #ccc; padding: 10px; margin-top: 10px;">
                                    <!-- Terms and Conditions text -->
                                    <p>1. Acceptance of Terms</p>
                                    <p>By accessing and using our blog website, you accept and agree to be bound by the terms and provision of this agreement. In addition, when using our website’s particular services, you shall be subject to any posted guidelines or rules applicable to such services.</p>
                                    
                                    <p>2. Changes to Terms</p>
                                    <p>We reserve the right to change or modify these terms at any time and your continued use of the site will signify your acceptance of any adjustment to these terms.</p>
                                    
                                    <p>3. User Conduct</p>
                                    <p>You agree to use the blog website only for lawful purposes and in a way that does not infringe the rights of, restrict or inhibit anyone else's use and enjoyment of the website.</p>
                                    
                                    <p>4. Content</p>
                                    <p>All content provided on this blog is for informational purposes only. We make no representations as to the accuracy or completeness of any information on this site or found by following any link on this site.</p>
                                    
                                    <p>5. Privacy</p>
                                    <p>We are committed to protecting your privacy. Authorized employees within the company on a need-to-know basis only use any information collected from individual customers.</p>
                                    
                                    <p>6. Limitations of Liability</p>
                                    <p>In no event shall the blog website be liable for any damages (including, without limitation, damages for loss of data or profit, or due to business interruption) arising out of the use or inability to use the materials on the blog website.</p>
                                    
                                    <p>7. Governing Law</p>
                                    <p>These terms and conditions are governed by and construed in accordance with the laws of our country, and you irrevocably submit to the exclusive jurisdiction of the courts in that State or location.</p>
                                </div>
                            </div>
                            
                            <br>
                            <div class="container text-center" id="loader" style="display: none">
                                <span class="fa fa-refresh fa-spin fa-3x"></span> <!-- Loading spinner -->
                                <h4>Please Wait...</h4> <!-- Loading text -->
                            </div>
                            
                            <button id="submit-btn" type="submit" class="btn btn-primary">Submit</button> <!-- Submit button -->
                        </form>
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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script> <!-- Link to SweetAlert JavaScript library -->
    
    <!-- JavaScript for form submission and handling -->
    <script>
        $(document).ready(function(){
            console.log("loaded...");
            
            $('#reg-form').on('submit',function(event){
                event.preventDefault();
                
                let form = new FormData(this);
                // Send to register servlet
                
                $("#submit-btn").hide();
                $("#loader").show();
                
                $.ajax({
                    url: "RegisterServlet",
                    type: 'POST',
                    data: form,
                    success: function(data, textStatus, jqXHR) {
                        console.log(data);
                        $("#submit-btn").show();
                        $("#loader").hide();
                        
                        if(data.trim() === 'done') {
                            swal("Registered Successfully!!..redirecting to login page").then((value) => {
                                window.location = "login-page.jsp";
                            });                         
                        } else {
                            swal(data);
                        }
                    }, 
                    error: function(jqXHR, textStatus, errorThrown) {
                        $("#submit-btn").show();
                        $("#loader").hide();
                        swal("OOPS!! Something went Wrong.. try again");
                    },
                    processData: false,
                    contentType: false
                });
            });
        });
    </script>     
</body>
</html>
