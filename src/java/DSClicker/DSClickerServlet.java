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
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "DSClickerServlet",
        urlPatterns = {"/Login", "/selection", "/submit", "/getResults", "/tutor","/updateAvailability"})
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
            request.setAttribute("notification", "fabvdg");
            RequestDispatcher view = request.getRequestDispatcher(nextView);
            view.forward(request, response);
        }
        
        if (requestSource.equals("/selection")){
            nextView = "Selection.jsp";
            request.setAttribute("username", username);
            if (!DSClickerModel.students.containsKey(username.toLowerCase())){
                nextView = "Login.jsp";
                request.setAttribute("notification", "Invalid Username or Passwords");
            }
            RequestDispatcher view = request.getRequestDispatcher(nextView);
            view.forward(request, response);
        }
        
        if (requestSource.equals("/tutor")){
            nextView = "TutorHome.jsp";
            System.out.println("NAME IS :" + username);
            username = username.toLowerCase();
            Student student = dscModel.students.get(username);
            System.out.println(student.name);
            request.setAttribute("student", student);
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
            String weekday = request.getParameter("weekday");
            String month = request.getParameter("month");
            String dayOfMonth = request.getParameter("dayofmonth");
            String year = request.getParameter("year");
            String startTime = request.getParameter("starttime");
            String endTime = request.getParameter("endtime");
            String fullTime = weekday + ", " + month + " " + dayOfMonth + " " + year + ". " + startTime + " - " + endTime;
            System.out.println("dsiufhdsaiufdhsaiufdha" + userName + className);
            Student student = dscModel.students.get(userName.toLowerCase());
            request.setAttribute("student", student);
            student.updateAvailability(className, fullTime);
            RequestDispatcher view = request.getRequestDispatcher(nextView);
            view.forward(request, response);
        }
        
        
    }

}
