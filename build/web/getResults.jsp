<%@page import="java.util.Map"%>
<%@page import="DSClicker.DSClickerModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%= request.getAttribute("doctype") %>

<html>
    <head>
        <title>Results</title>
    </head>
    <body>
        <h1>Distributed Systems Class Clicker</h1>
        <%
            DSClickerModel ipm = new DSClickerModel();
            Map<String, Integer> results = (Map)request.getAttribute("resultsMap");
            
            if (results.size() != 0) {
        %>
        <p>The results from the survey are as follows: </p>
        <p>
            <% for (Map.Entry<String, Integer> entry: results.entrySet()){ %>
            <%= entry.getKey() %> : <%= entry.getValue() %> <br>
            <% } %>
        </p>
        <p>These results have now been cleared.<p>
        <% } else { %>
        <p>There are currently no results.</p>
        <% } %>
    </body>
</html>

