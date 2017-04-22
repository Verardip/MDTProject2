/* 
 * @author Paul Verardi
 *
 * This is a short example of MVC.
 * The welcome-file in the deployment descriptor (web.xml) points
 * to this servlet.  So it is also the starting place for the web
 * application.
 *
 * The servlet is acting as the controller.
 * There are three views - prompt.jsp and submit.jsp and getResults.jsp.
 * It decides between the three by determining first which server path was called
 * and then if there is a search parameter(Selected Radio Button)
 * The model is provided by DSClickerModel.
 */
package DSClicker;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "DSClickerServlet",
        urlPatterns = {"/Login", "/selection", "/submit", "/getResults", "/tutor","/updateAvailability", "/requestTutoring"})
public class DSClickerServlet extends HttpServlet {

    DSClickerModel dscModel = null;  // The "business model" for this app
    boolean initAlready = false;
    // Initiate this servlet by instantiating the model that it will use.
    @Override
    public void init() {
        dscModel = new DSClickerModel();
        dscModel.populateStudentMap();
    }

    
    // This servlet will reply to HTTP GET requests via this doGet method
    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        // determine which answer the user inputted
        String username = request.getParameter("username");

        
        // determine what type of device our user is
        String ua = request.getHeader("User-Agent");
        
        //finds the servlet path to determine which path was actually requested
        String requestSource = request.getServletPath();
   
        
        boolean mobile;
        // prepare the appropriate DOCTYPE for the view pages
        if (ua != null && ((ua.indexOf("Android") != -1) || (ua.indexOf("iPhone") != -1))) {
            mobile = true;
            /*
             * This is the latest XHTML Mobile doctype. To see the difference it
             * makes, comment it out so that a default desktop doctype is used
             * and view on an Android or iPhone.
             */
            request.setAttribute("doctype", "<!DOCTYPE html PUBLIC \"-//WAPFORUM//DTD XHTML Mobile 1.2//EN\" \"http://www.openmobilealliance.org/tech/DTD/xhtml-mobile12.dtd\">");
        } else {
            mobile = false;
            request.setAttribute("doctype", "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">");
        }

        String nextView;

        if (requestSource.equals("/Login")){
            nextView = "Login.jsp";
            System.out.println("Test");
            RequestDispatcher view = request.getRequestDispatcher(nextView);
            view.forward(request, response);
        }
        
        if (requestSource.equals("/selection")){
            nextView = "Selection.jsp";
            request.setAttribute("username", username);
            RequestDispatcher view = request.getRequestDispatcher(nextView);
            view.forward(request, response);
        }
        
        if (requestSource.equals("/tutor")){
            
            
            if(request.getParameter("intent").equals("I want to tutor!"))
            {
                System.out.println("Wants to tutor.");
                
                nextView = "TutorHome.jsp";
                System.out.println("NAME IS :" + username);
                username = username.toLowerCase();
                Student student = dscModel.students.get(username);
                System.out.println(student.name);
                request.setAttribute("student", student);
                RequestDispatcher view = request.getRequestDispatcher(nextView);
                view.forward(request, response);
            }
            else if (request.getParameter("intent").equals("I need tutoring!"))
            {
                System.out.println("Needs tutoring.");
                
                nextView = "StudentHome.jsp";
                System.out.println("NAME IS :" + username);
                username = username.toLowerCase();
                Student student = dscModel.students.get(username);
                System.out.println(student.name);
                request.setAttribute("student", student);
                RequestDispatcher view = request.getRequestDispatcher(nextView);
                view.forward(request, response);
            }    
        } 
        
        if (requestSource.equals("/requestTutoring"))
        {
            System.out.println("Someone requested tutoring.");
            
            nextView = "StudentSelectTutor.jsp";
            String subject = request.getParameter("subject");
            Map<String, ArrayList<Student>> availableTutors = dscModel.getAvailableStudents(subject);
            System.out.println(availableTutors.toString());
            
            request.setAttribute("username", username);

            request.setAttribute("subject", subject);
            request.setAttribute("availableTutors", availableTutors.get(subject));
            RequestDispatcher view = request.getRequestDispatcher(nextView);
            view.forward(request, response);
        }
    }
    
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
          // get the search parameter if it exists

        
        String requestSource = request.getServletPath();
        // determine what type of device our user is
        String ua = request.getHeader("User-Agent");

        boolean mobile;
        // prepare the appropriate DOCTYPE for the view pages
        if (ua != null && ((ua.indexOf("Android") != -1) || (ua.indexOf("iPhone") != -1))) {
            mobile = true;
            /*
             * This is the latest XHTML Mobile doctype. To see the difference it
             * makes, comment it out so that a default desktop doctype is used
             * and view on an Android or iPhone.
             */
            request.setAttribute("doctype", "<!DOCTYPE html PUBLIC \"-//WAPFORUM//DTD XHTML Mobile 1.2//EN\" \"http://www.openmobilealliance.org/tech/DTD/xhtml-mobile12.dtd\">");
        } else {
            mobile = false;
            request.setAttribute("doctype", "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">");
        }

        String nextView;
        
        if (requestSource.equals("/updateAvailability")){
            nextView = "TutorHome.jsp";
            String userName = request.getParameter("username");
            String className = request.getParameter("As");
            String startTime = request.getParameter("start_time");
            String endTime = request.getParameter("end_time");
            
            String date = request.getParameter("date");
            String fullTime = generateDateString(date, startTime, endTime);
            System.out.println(fullTime);
            
            
            System.out.println("Updated availability for " + userName + " and " + className);
            Student student = dscModel.students.get(userName.toLowerCase());
            request.setAttribute("student", student);
            student.updateAvailability(className, fullTime);
            RequestDispatcher view = request.getRequestDispatcher(nextView);
            view.forward(request, response);
        }
        else if (requestSource.equals("/bookTutoring"))
        {
            nextView = "TutorBookedSuccess.jsp";
            

            // 
            RequestDispatcher view = request.getRequestDispatcher(nextView);
            view.forward(request, response);
        }
        
        
    }
    
    /**
     * Private helper method to generate a date String in the form of "Wednesday, April 25 2017. 1:00 PM - 2:00 PM"
     * @param date //  2017-04-23
     * @param start_time // 1:00pm
     * @param end_time // 2:00pm
     * @return 
     */
    private static String generateDateString(String dateString, String start_time, String end_time)
    {
        StringBuilder sb = new StringBuilder();
        
        try {
            
            SimpleDateFormat parser = new SimpleDateFormat("yyyy-MM-dd");
            Date date = parser.parse(dateString);
            
            SimpleDateFormat formatter = new SimpleDateFormat("EEEE, MMMM dd YYYY. ");
            String formattedDate = formatter.format(date);
            
            String startTimeNumeric = start_time.substring(0, start_time.length()-2);
            String startTimeM = start_time.substring(start_time.length()-2).toUpperCase();
            
            String endTimeNumeric = end_time.substring(0, end_time.length()-2);
            String endTimeM = end_time.substring(end_time.length()-2).toUpperCase();

            sb.append(formattedDate);
            sb.append(startTimeNumeric);
            sb.append(" ");
            sb.append(startTimeM);
            sb.append(" - ");
            sb.append(endTimeNumeric);
            sb.append(" ");
            sb.append(endTimeM);
            
        } 
        catch (ParseException ex) 
        {
            Logger.getLogger(DSClickerServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return sb.toString();
    }

}
