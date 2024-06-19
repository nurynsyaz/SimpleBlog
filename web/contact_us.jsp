<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Simple Blog Group 5</title>
        <!-- Bootstrap CSS for styling -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <!-- Custom CSS -->
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <!-- Font Awesome for icons -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <!-- Inline CSS styles for card elements -->
        <style>
            #cardd {
                font-family: monospace;
                background: black;
            }
            #cbody, #cfoot, #chead {
                font-size: 35px;
                background: #cca0ff;
                border-color: black;
            }
        </style>
        
    </head>
    
    <body class="primary-background">
        <!-- Include navigation bar -->
        <%@include file="normal_navbar.jsp" %> 
        
        <div class="container" style="margin-top:20px;">
            <!-- Card to display project information -->
            <div class="card mt-4" id="cardd">
                
                <div class="card-header" id="chead"> 
                   Simple Blog Website
                </div> 
                
                <div class="card-body" id="cbody">
                   Developed By - Group 5 CSE3023
                   <br>
                   1. Nurin Syazwani Binti Faizal Azmir (S65620)
                   <br> 2. Nur Ain Nazifah Binti Mohamad Nawi (S65653)
                   <br> 3. Nur Farisha Waheeda Binti Hassan (S65648)
                   <br>
                   <br>Group Assignment for Web-Based Application Development <br>
                   Developed using - 
                   <br>
                   <ul>
                       <li>Front End:
                           <ul>
                               <li>Java EE : JSP (Java Server Pages)</li>
                               <li>Styling using BootStrap And CSS</li>                      
                           </ul>
                       </li>
                       <li>BackEnd And DataBase
                           <ul>
                               <li>BackEnd: Java EE using Servlets and JSP</li>
                               <li>DataBase: MySQL phpMyAdmin</li>
                           </ul>
                       </li>
                   </ul>
                </div> 
            </div>
        </div>
        
    </body>
</html>
