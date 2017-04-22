<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MDTutor homepage</title>
    </head>
    <body>
        <p>Hello <%= request.getAttribute("username")%> ! </p>
        
        <h3>What do you need today?</h3>
        <form action="tutor" method="GET">
            <input type="submit" value="I want to tutor!" name="intent" /><br>
            <input type="submit" value="I need tutoring!" name="intent" />
            <input type="hidden" name="username" value="<%= request.getAttribute("username") %>" />
        </form>
    </body>
</html>