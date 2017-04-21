<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DSClicker.Student"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MDTutor homepage</title>
    </head>
    <body>
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
        <br><br><br>
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
        <br><br>
        <p>Add more available times</p>
        <form action="updateAvailability" method="POST">
            <%
                ArrayList<String> earnedAs = student.classesEarnedA;
                for (int i = 0; i < earnedAs.size(); i++) {
            %>
            <input type="radio" name="As" value="<%=earnedAs.get(i)%>"><%=earnedAs.get(i)%><br>
            <% }%>

            <br>
            <table>
                <tr>
                    <th><label for="weekday">Weekday</label></th>
                    <th><label for="weekday">Month</label></th>
                    <th><label for="weekday">Day of Month</label></th>
                    <th><label for="weekday">Year</label></th>
                    <th><label for="weekday">Start time</label></th>
                    <th><label for="weekday">End time</label></th>
                </tr>
                <tr>
                    <td><input type="text" name="weekday" value="" /></td>
                    <td><input type="text" name="month" value="" /></td>
                    <td><input type="text" name="dayofmonth" value="" /></td>
                    <td><input type="text" name="year" value="" /></td>
                    <td><input type="text" name="starttime" value="" /></td>
                    <td><input type="text" name="endtime" value="" /></td>
                </tr>

            </table>
            <input type="hidden" name="username" value="<%= student.name %>" />
            <input type="submit" value="Submit" />
        </form>

    </body>
</html>
