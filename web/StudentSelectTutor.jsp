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
        <form action="bookTutoring" method="POST">
            <%
                String className = (String)request.getAttribute("subject");
                String username = (String)request.getAttribute("username");
                ArrayList<Student> availableTutors = (ArrayList<Student>) request.getAttribute("availableTutors");
                //Map<String, ArrayList<Student>> availableTutors = (Map<String, ArrayList<Student>>)request.getAttribute("MapsOfStudents");
                Student tutor;
                for (int i = 0; i < availableTutors.size(); i++){
                    tutor = availableTutors.get(i);
                    if (tutor.tutorAvailability.containsKey(className)){
                        ArrayList<String> times = tutor.tutorAvailability.get(className);
                        for (int j = 0; j < times.size(); j++){
                            String rowItem = tutor.name + ": " + times.get(j);
                            %><input type="radio" name="tutorChoice" value="<%=rowItem%>"><%=rowItem%><br>
                        <% }%>
                                <%
                        }
                    }
             %>
            <input type="hidden" name="className" value="<%= className %>" />
            <input type="hidden" name="username" value="<%= username %>" />
            
         
            <input type="submit" value="Submit" />
        </form>
        <br><br><br>

        <p>None of these times work for you? Select a time that does!</p>
        <form action="requestTutorTime" method="POST">
            
            <!--    Try inputting the Time Range in a fancy format here.
                    Documentation: https://jonthornton.github.io/Datepair.js/ -->
            <p id="basicExample">
                <label for="date_input">Date</label>
                    <input type="date" name="date" min="2017-04-01" max="2017-05-31" id="date_input"/>
                
                <label for="start_time">Time</label>
                    <input type="text" class="time start" name="start_time" id="start_time" /> to
                    <input type="text" class="time end" name="end_time" id="end_time" />
            </p>
                        <input type="hidden" name="className" value="<%= className %>" />
            <input type="hidden" name="username" value="<%= username %>" />
            
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
                var allRadioButtons = document.getElementsByName("tutorChoice");
                allRadioButtons[0].checked = true;
                
                
            </script>
            
            
            <input type="submit" value="Submit" />
        </form>

    </body>
</html>
