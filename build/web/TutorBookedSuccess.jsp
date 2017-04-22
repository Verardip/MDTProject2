<%-- 
    Document   : TutorBookedSuccess
    Created on : Apr 22, 2017, 2:32:53 PM
    Author     : sjhermanek
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Great!</h1>
        <p>
            <%  
                String studentName = (String)request.getAttribute("studentName2");
                String tutorName = (String)request.getAttribute("tutorName2");
                String className = (String)request.getAttribute("className2");
                String tutorTime = (String)request.getAttribute("tutorTime2");



            %>
            <%= studentName %>, you are all set for your tutoring session in <%= className %> with <%= tutorName %> on <%= tutorTime %>!
        </p>
    </body>
</html>
