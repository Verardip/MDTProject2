package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class Login_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("    <head>\r\n");
      out.write("        <title>MDTutor login</title>\r\n");
      out.write("        <meta charset=\"UTF-8\">\r\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n");
      out.write("        \r\n");
      out.write("        <!-- Style sheets for styling are imported via CDN. \r\n");
      out.write("             I used the popular Skeleton.css framework available via http://getskeleton.com/\r\n");
      out.write("             This makes things look a bit nicer without adding much complexity.-->\r\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"https://cdnjs.cloudflare.com/ajax/libs/normalize/6.0.0/normalize.min.css\">\r\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"https://cdnjs.cloudflare.com/ajax/libs/skeleton/2.0.4/skeleton.css\">\r\n");
      out.write("        <link href=\"https://fonts.googleapis.com/css?family=Source+Sans+Pro:200,200i,300,300i,400,400i,600,600i,700,700i,900,900i\" rel=\"stylesheet\">\r\n");
      out.write("\r\n");
      out.write("        \r\n");
      out.write("        <style>\r\n");
      out.write("            * \r\n");
      out.write("            {\r\n");
      out.write("                font-family: 'Source Sans Pro', sans-serif;\r\n");
      out.write("                font-weight: 300;\r\n");
      out.write("                font-size: large;\r\n");
      out.write("            }\r\n");
      out.write("            \r\n");
      out.write("            .container { margin-top: 50px; }\r\n");
      out.write("        </style>\r\n");
      out.write("        \r\n");
      out.write("        \r\n");
      out.write("        \r\n");
      out.write("    </head>\r\n");
      out.write("    <body>\r\n");
      out.write("        <div class=\"container\">\r\n");
      out.write("            <h2>Please login!</h2>\r\n");
      out.write("            <form action=\"selection\" method=\"GET\">\r\n");
      out.write("                <label for=\"username\">Username:</label>\r\n");
      out.write("                <input type=\"text\" class=\"u-full-width\" name=\"username\" value=\"\" placeholder=\"Your name!\" /><br>\r\n");
      out.write("                <label for=\"letter\">Password:</label>\r\n");
      out.write("                <input type=\"password\" class=\"u-full-width\" name=\"password\" value=\"\" placeholder=\"Your password!\" /><br><br>\r\n");
      out.write("                <input type=\"submit\" class=\"button-primary u-full-width\" value=\"Login\" />\r\n");
      out.write("            </form>\r\n");
      out.write("        </div>\r\n");
      out.write("    </body>\r\n");
      out.write("    \r\n");
      out.write("    \r\n");
      out.write("    \r\n");
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
