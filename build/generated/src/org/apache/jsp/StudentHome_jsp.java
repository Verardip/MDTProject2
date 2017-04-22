package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import DSClicker.Student;

public final class StudentHome_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("    <head>\r\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("        <title>MDTutor homepage</title>\r\n");
      out.write("        \r\n");
      out.write("        <!-- Includes for external JS -->\r\n");
      out.write("        <script src=\"https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js\"></script>\r\n");
      out.write("        <script src=\"https://cdnjs.cloudflare.com/ajax/libs/jquery-timepicker/1.10.0/jquery.timepicker.min.js\"></script>\r\n");
      out.write("        <script src=\"https://cdnjs.cloudflare.com/ajax/libs/datepair.js/0.4.15/datepair.min.js\"></script>\r\n");
      out.write("        \r\n");
      out.write("        <!-- Includes for external CSS -->\r\n");
      out.write("        <link href=\"https://cdnjs.cloudflare.com/ajax/libs/jquery-timepicker/1.10.0/jquery.timepicker.min.css\" rel=\"stylesheet\" type=\"text/css\" />\r\n");
      out.write("        \r\n");
      out.write("    </head>\r\n");
      out.write("    \r\n");
      out.write("    <body>\r\n");
      out.write("        <table>\r\n");
      out.write("            ");

                Student student = (Student) request.getAttribute("student");
                Map<String, ArrayList<String>> scheduledAppointments = student.studentScheduledAppointments;
            
      out.write("\r\n");
      out.write("                <th>Classes</th>\r\n");
      out.write("                <th>Scheduled Appointments</th> \r\n");
      out.write("            </tr>\r\n");
      out.write("            ");
for (Map.Entry<String, ArrayList<String>> entry : scheduledAppointments.entrySet()) {
                    String key = entry.getKey();
                    ArrayList<String> times = entry.getValue();
                    for (int i = 0; i < times.size(); i++) {
      out.write("\r\n");
      out.write("            <tr>\r\n");
      out.write("                <td>");
      out.print(key);
      out.write("</td>\r\n");
      out.write("                <td>");
      out.print(times.get(i));
      out.write("</td>\r\n");
      out.write("            </tr>\r\n");
      out.write("            ");

                    }
                }
            
      out.write("\r\n");
      out.write("        </table>\r\n");
      out.write("        <br><br>\r\n");
      out.write("        <p>Need more tutoring?</p>\r\n");
      out.write("        <form action=\"requestTutoring\" method=\"POST\">\r\n");
      out.write("            ");

                ArrayList<String> currentClasses = student.currentClasses;
                for (int i = 0; i < currentClasses.size(); i++) {
            
      out.write("\r\n");
      out.write("            <input type=\"radio\" name=\"As\" value=\"");
      out.print(currentClasses.get(i));
      out.write('"');
      out.write('>');
      out.print(currentClasses.get(i).replace("_", " "));
      out.write("<br>\r\n");
      out.write("            ");
 }
      out.write("\r\n");
      out.write("\r\n");
      out.write("            <br>\r\n");
      out.write("            </table>-->\r\n");
      out.write("            <input type=\"hidden\" name=\"username\" value=\"");
      out.print( student.name );
      out.write("\" />\r\n");
      out.write("            \r\n");
      out.write("            <!--    Try inputting the Time Range in a fancy format here.\r\n");
      out.write("                    Documentation: https://jonthornton.github.io/Datepair.js/ -->\r\n");
      out.write("            <p id=\"basicExample\">\r\n");
      out.write("                <label for=\"date_input\">Date</label>\r\n");
      out.write("                    <input type=\"date\" name=\"date\" min=\"2017-04-01\" max=\"2017-05-31\" id=\"date_input\"/>\r\n");
      out.write("                \r\n");
      out.write("                <label for=\"start_time\">Time</label>\r\n");
      out.write("                    <input type=\"text\" class=\"time start\" name=\"start_time\" id=\"start_time\" /> to\r\n");
      out.write("                    <input type=\"text\" class=\"time end\" name=\"end_time\" id=\"end_time\" />\r\n");
      out.write("            </p>\r\n");
      out.write("            \r\n");
      out.write("            <script>\r\n");
      out.write("                var today = new Date();\r\n");
      out.write("                var dd = today.getDate()+1;\r\n");
      out.write("                var mm = today.getMonth()+1; //January is 0!\r\n");
      out.write("                var yyyy = today.getFullYear();\r\n");
      out.write("                if(dd<10) \r\n");
      out.write("                {\r\n");
      out.write("                    dd='0'+dd\r\n");
      out.write("                } \r\n");
      out.write("\r\n");
      out.write("                if(mm<10) \r\n");
      out.write("                {\r\n");
      out.write("                    mm='0'+mm\r\n");
      out.write("                } \r\n");
      out.write("\r\n");
      out.write("                \r\n");
      out.write("                var date = yyyy+'-'+mm+'-'+dd;\r\n");
      out.write("                document.getElementById(\"date_input\").value = date;\r\n");
      out.write("                \r\n");
      out.write("                document.getElementById(\"start_time\").value = \"1:00PM\";\r\n");
      out.write("                document.getElementById(\"end_time\").value = \"2:00PM\";\r\n");
      out.write("    \r\n");
      out.write("                // initialize input widgets first\r\n");
      out.write("                $('#basicExample .time').timepicker({\r\n");
      out.write("                    'showDuration': true,\r\n");
      out.write("                    'timeFormat': 'g:ia'\r\n");
      out.write("                });\r\n");
      out.write("\r\n");
      out.write("                // initialize datepair\r\n");
      out.write("                var basicExampleEl = document.getElementById('basicExample');\r\n");
      out.write("                var datepair = new Datepair(basicExampleEl);\r\n");
      out.write("            </script>\r\n");
      out.write("            \r\n");
      out.write("            <script>\r\n");
      out.write("<<<<<<< Updated upstream\r\n");
      out.write("                // Simple method to select first radio button.\r\n");
      out.write("=======\r\n");
      out.write("                // Simple utility to check first radio button.\r\n");
      out.write(">>>>>>> Stashed changes\r\n");
      out.write("                var allRadioButtons = document.getElementsByName(\"As\");\r\n");
      out.write("                allRadioButtons[0].checked = true;\r\n");
      out.write("                \r\n");
      out.write("                \r\n");
      out.write("            </script>\r\n");
      out.write("            \r\n");
      out.write("            \r\n");
      out.write("            <input type=\"submit\" value=\"Submit\" />\r\n");
      out.write("        </form>\r\n");
      out.write("\r\n");
      out.write("    </body>\r\n");
      out.write("</html>\r\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
