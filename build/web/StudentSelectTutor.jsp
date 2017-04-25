<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DSClicker.Student"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
        <%String username = (String)request.getAttribute("username"); %>
        <div class="container">
            
            <form action="Home" method="GET">
                <input type="hidden" name="username" value="<%= username %>" />
                <input type="submit" style="float: right;" class="button" value="Home" name="Home"/><br>
            </form>
            <h2>Book your Tutor</h2>
            
            <h4>Choose available tutors</h4>
            <form action="bookTutoring" method="POST">
                <%
                    String className = (String)request.getAttribute("subject");
                    ArrayList<Student> availableTutors = (ArrayList<Student>) request.getAttribute("availableTutors");
//                    String disabled = "disabled";
//                    
//                    // It gotta be bigger than 1.
//                    if (availableTutors.size() > 1)
//                        disabled = ""+availableTutors.size();
//                    
                    //Map<String, ArrayList<Student>> availableTutors = (Map<String, ArrayList<Student>>)request.getAttribute("MapsOfStudents");
                    Student tutor;
                    for (int i = 0; i < availableTutors.size(); i++){
                        tutor = availableTutors.get(i);
                        if (tutor.tutorAvailability.containsKey(className)){
                            ArrayList<String> times = tutor.tutorAvailability.get(className);
                            for (int j = 0; j < times.size(); j++){
                                String rowItem = tutor.name + ": " + times.get(j);
                                %>
                                <input type="radio" name="tutorChoice" value="<%=rowItem%>"><span class="radioText"><%=rowItem%></span><br>
                            <% }%>
                                    <%
                            }
                        }
                 %>
                <input type="hidden" name="className" value="<%= className %>" />
                <input type="hidden" name="username" value="<%= username %>" />


                <input type="submit" value="Submit" />
            </form>

            <h4>Choose another time.</h4>
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
        </div>

    </body>
</html>
