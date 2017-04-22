<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DSClicker.Student"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MDTutor homepage</title>
        
        <!-- Includes for external JS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-timepicker/1.10.0/jquery.timepicker.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/datepair.js/0.4.15/datepair.min.js"></script>
        
        <!-- Includes for external CSS -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/jquery-timepicker/1.10.0/jquery.timepicker.min.css" rel="stylesheet" type="text/css" />
        
    </head>
    
    <body>
        <table>
            <%
                Student student = (Student) request.getAttribute("student");
                Map<String, ArrayList<String>> scheduledAppointments = student.studentScheduledAppointments;
            %>
                <th>Classes</th>
                <th>Scheduled Appointments</th> 
            </tr>
            <%for (Map.Entry<String, ArrayList<String>> entry : scheduledAppointments.entrySet()) {
                    String key = entry.getKey();
                    ArrayList<String> times = entry.getValue();
                    for (int i = 0; i < times.size(); i++) {%>
            <tr>
                <td><%=key%></td>
                <td><%=times.get(i)%></td>
            </tr>
            <%
                    }
                }
            %>
        </table>
        <br><br>
        <p>Need more tutoring?</p>
        <form action="requestTutoring" method="POST">
            <%
                ArrayList<String> currentClasses = student.currentClasses;
                for (int i = 0; i < currentClasses.size(); i++) {
            %>
            <input type="radio" name="As" value="<%=currentClasses.get(i)%>"><%=currentClasses.get(i).replace("_", " ")%><br>
            <% }%>

            <br>
            </table>
            <input type="hidden" name="username" value="<%= student.name %>" />
            
         
            <input type="submit" value="Submit" />
        </form>

    </body>
</html>
