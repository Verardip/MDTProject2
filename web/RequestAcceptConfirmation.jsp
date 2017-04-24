<%-- 
    Document   : RequestAcceptConfirmation
    Created on : Apr 23, 2017, 11:03:54 AM
    Author     : pvera
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
                <!-- Style sheets for styling are imported via CDN. 
             I used the popular Skeleton.css framework available via http://getskeleton.com/
             This makes things look a bit nicer without adding much complexity.-->
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/6.0.0/normalize.min.css">
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/skeleton/2.0.4/skeleton.css">
        <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:200,200i,300,300i,400,400i,600,600i,700,700i,900,900i" rel="stylesheet">

        <style>
            * 
            {
                font-family: 'Source Sans Pro', sans-serif;
                font-weight: 300;
                font-size: large;
            }
            
            h4 
            {
                margin-top: 60px;
                font-weight: 600;
            }
            
            .radioText
            {
                margin-left: 10px;
            }
            
            .className
            {
                font-weight: 600;
            }

            
            
            .container { margin-top: 50px; }
        </style>
        
        
        
    </head>
    <body>
        
        <div class="container">
        <h2>Great!</h2>
        <p>
            <%  
                String studentName = (String)request.getAttribute("studentName2");
                String tutorName = (String)request.getAttribute("tutorName2");
                String className = (String)request.getAttribute("className2");
                String tutorTime = (String)request.getAttribute("tutorTime2");



            %>
            <%= tutorName %>, you have successfully accepted <span class="className"><%= studentName %></span>'s request to tutor <span class="className"><%= className %></span> on <u><%= tutorTime %></u>!
        </p>
        </div>
    </body>
</html>