<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>MDTutor login</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>        
        <h2>Please login!</h2>
        <%if (request.getAttribute("notfication") == "fa" ){%>
        <h4><%request.getAttribute("notification");%></h4> <%} %>
        <form action="selection" method="GET">
            <label for="username">Username:</label>
            <input type="text" name="username" value="" /><br>
            <label for="letter">Password:</label>
            <input type="text" name="password" value="" /><br>
            <input type="submit" value="Login" />
        </form>
    </body>
</html>
