<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%= request.getAttribute("doctype") %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DS Clicker</title>
    </head>
    <body>
        <h1>Distributed Systems Class Clicker</h1>
        <p>Your "<%=request.getAttribute("answerSubmitted")%>" response has been registered </p>
        <p>Submit your answer to the current question:</p>
        <form action="submit" method="POST">
            <input type="radio" name="answer" id="A" value="A">A<br>
            <input type="radio" name="answer" id="B" value="B">B<br>
            <input type="radio" name="answer" id="C" value="C">C<br>
            <input type="radio" name="answer" id="D" value="D">D<br><br>             
            <input type="submit" value="Submit" />
        </form>
    </body>
</html>

