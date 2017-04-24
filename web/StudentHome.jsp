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
            
            

            
            
            .container { margin-top: 50px; }
        </style>
        
        
    </head>
    
    <body>
        <div class="container">

            <h2>Welcome, Student!</h2>
    <%
        Student student = (Student) request.getAttribute("student");
        Map<String, ArrayList<String>> scheduledAppointments = student.studentScheduledAppointments;
        if (!scheduledAppointments.isEmpty()){
    %>            
            <h4>Your booked appointments.</h4>
            <table>
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
            <% } else { %>
            <h4>Your booked appointments.</h4>
            <h5>You have no booked appointments.</h5>
            <% } %>
            
            <h4>Need more tutoring?</h4>
            <form action="requestTutoring" method="GET">
                <p>Choose your class:</p>
                <%
                    ArrayList<String> currentClasses = student.currentClasses;
                    for (int i = 0; i < currentClasses.size(); i++) {
                %>
                <input type="radio" name="subject" value="<%=currentClasses.get(i)%>"><span class="radioText"><%=currentClasses.get(i).replace("_", " ")%></span><br>
                <% }%>

                <br>
                </table>
                <input type="hidden" name="username" value="<%= student.name %>" />


                <input type="submit" class="button-primary" value="Submit" />
            </form>

        </div>
    </body>
</html>
