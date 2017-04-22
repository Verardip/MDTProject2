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
            <h2>Welcome, Tutor!</h2>
            
            <h4>Available for tutoring</h4>
            <table>
                <%
                    Student student = (Student) request.getAttribute("student");
                    Map<String, ArrayList<String>> availability = student.tutorAvailability;
                %>
                <tr>
                    <th>Classes</th>
                    <th>Available Times</th> 
                </tr>
                <%for (Map.Entry<String, ArrayList<String>> entry : availability.entrySet()) {
                        String key = entry.getKey();

                        System.out.println(key);
                        String keyForDisplay = key.replaceAll("_", " ");

                        ArrayList<String> times = entry.getValue();
                        for (int i = 0; i < times.size(); i++) {%>
                <tr>
                    <td><%=keyForDisplay%></td>
                    <td><%=times.get(i)%></td>
                </tr>
                <%
                        }
                    }
                %>
            </table>
            
            
            <h4>Booked for tutoring</h4>
            <table>
                <%
                    Map<String, ArrayList<String>> scheduledAppointments = student.tutorScheduledAppointments;
                %>
                <tr>
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
             
            <h4>Add more available times</h4>
            <form action="updateAvailability" method="POST">
                <%
                    ArrayList<String> earnedAs = student.classesEarnedA;
                    for (int i = 0; i < earnedAs.size(); i++) {
                %>
                <input type="radio" name="As" value="<%=earnedAs.get(i)%>"><span class="radioText"><%=earnedAs.get(i).replace("_", " ")%></span><br>
                <% }%>

                <br>
                </table>
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
                    // Simple utility to check first radio button.
                    var allRadioButtons = document.getElementsByName("As");
                    allRadioButtons[0].checked = true;


                </script>


                <input type="submit" class="button-primary" value="Submit" />
            </form>
        </div>
    </body>
</html>
