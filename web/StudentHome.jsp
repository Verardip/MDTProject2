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
            </table>-->
            <input type="hidden" name="username" value="<%= student.name %>" />
            
            <!--    Try inputting the Time Range in a fancy format here.
                    Documentation: https://jonthornton.github.io/Datepair.js/ -->
            <p id="basicExample">
                <label for="date_input">Date</label>
                    <input type="date" name="date" min="2017-04-01" max="2017-05-31" id="date_input"/>
                
                <label for="start_time">Time</label>
                    <input type="text" class="time start" name="start_time" id="start_time" /> to
                    <input type="text" class="time end" name="end_time" id="end_time" />
            </p>
            
            <script>
                var today = new Date();
                var dd = today.getDate()+1;
                var mm = today.getMonth()+1; //January is 0!
                var yyyy = today.getFullYear();
                if(dd<10) 
                {
                    dd='0'+dd
                } 

                if(mm<10) 
                {
                    mm='0'+mm
                } 

                
                var date = yyyy+'-'+mm+'-'+dd;
                document.getElementById("date_input").value = date;
                
                document.getElementById("start_time").value = "1:00PM";
                document.getElementById("end_time").value = "2:00PM";
    
                // initialize input widgets first
                $('#basicExample .time').timepicker({
                    'showDuration': true,
                    'timeFormat': 'g:ia'
                });

                // initialize datepair
                var basicExampleEl = document.getElementById('basicExample');
                var datepair = new Datepair(basicExampleEl);
            </script>
            
            <script>
<<<<<<< Updated upstream
                // Simple method to select first radio button.
=======
                // Simple utility to check first radio button.
>>>>>>> Stashed changes
                var allRadioButtons = document.getElementsByName("As");
                allRadioButtons[0].checked = true;
                
                
            </script>
            
            
            <input type="submit" value="Submit" />
        </form>

    </body>
</html>
