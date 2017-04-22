<%-- 
    Document   : TutorRequestSuccess
    Created on : Apr 22, 2017, 3:15:52 PM
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
        <h1>Successfully requested a tutor time.</h1>
        
            <%  
                String studentName = (String)request.getAttribute("studentName");
                String className = (String)request.getAttribute("className");
                String tutorTime = (String)request.getAttribute("tutorTime");
 

            %>
            
            <%= studentName %>, you have requested your tutoring session in <%= className %> for <%= tutorTime %>!
            <br>
            We'll let all our tutors know that you need help.
            You'll receive a message when we confirmed your tutoring :)

        
    </body>
</html>
