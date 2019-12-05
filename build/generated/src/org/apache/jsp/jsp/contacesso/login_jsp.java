package org.apache.jsp.jsp.contacesso;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class login_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(1);
    _jspx_dependants.add("/jsp/contacesso/../../inc/materalizeWebLogin.inc");
  }

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

      out.write('\n');
      out.write('\n');

    session.invalidate();

      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("\n");
      out.write("    <style> \n");
      out.write("        h2{\n");
      out.write("            text-align: center;\n");
      out.write("        } \n");
      out.write("        div.a{\n");
      out.write("            text-align: center;\n");
      out.write("        } \n");
      out.write("    </style>\n");
      out.write("\n");
      out.write("    ");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n");
      out.write("    <!-- Compiled and minified CSS -->\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"https://fonts.googleapis.com/icon?family=Material+Icons\">\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.5/css/materialize.css\">\r\n");
      out.write("    <!-- Compiled and minified JavaScript -->\r\n");
      out.write("    <script type=\"text/javascript\" src=\"https://code.jquery.com/jquery-2.2.2.js\"></script>\r\n");
      out.write("    <script src=\"https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.5/js/materialize.js\"></script>\r\n");
      out.write("</head>");
      out.write("\n");
      out.write("    <title>LOGIN - WTT</title>\n");
      out.write("    <body>\n");
      out.write("        <div class=\"container\"/>\n");
      out.write("        <h2>LOGIN</h2>\n");
      out.write("        <form name=\"FORMLOGIN\" action=\"menu.jsp\" method=\"post\">\n");
      out.write("            <div class=\"form-group row\">\n");
      out.write("                <label for=\"inputLogin\" class=\"col-sm-2 col-form-label\">Login</label>\n");
      out.write("                <div class=\"col-sm-10\">\n");
      out.write("                    <input type=\"text\" class=\"form-control\" id=\"inputLogin\" placeholder=\"Login\" name=\"inputLogin\">\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"form-group row\">\n");
      out.write("                <label for=\"inputSenha\" class=\"col-sm-2 col-form-label\">Senha</label>\n");
      out.write("                <div class=\"col-sm-10\">\n");
      out.write("                    <input type=\"password\" class=\"form-control\" id=\"inputSenha\" placeholder=\"Senha\" name=\"inputSenha\">\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("            <fieldset class=\"form-group\">\n");
      out.write("                <div class=\"row\">\n");
      out.write("                    <legend class=\"col-form-label col-sm-2 pt-0\">Permissão</legend>\n");
      out.write("                    <div class=\"col-sm-10\">\n");
      out.write("                        <div class=\"form-check\">\n");
      out.write("                            <input class=\"form-check-input\" type=\"radio\" name=\"gridRadios\" id=\"permFun\" value=\"F\" checked>\n");
      out.write("                            <label class=\"form-check-label\" for=\"permFun\">\n");
      out.write("                                Funcionario\n");
      out.write("                            </label>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"form-check\">\n");
      out.write("                            <input class=\"form-check-input\" type=\"radio\" name=\"gridRadios\" id=\"permCli\" value=\"C\">\n");
      out.write("                            <label class=\"form-check-label\" for=\"permCli\">\n");
      out.write("                                Cliente\n");
      out.write("                            </label>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </fieldset>\n");
      out.write("            <br>\n");
      out.write("            <br>\n");
      out.write("            <div class=\"form-group row\">\n");
      out.write("                <div class=\"col-sm-10\">\n");
      out.write("                    <div class=\"a\">\n");
      out.write("                        <button type=\"submit\" class=\"btn btn-primary\">Entrar</button>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </form>\n");
      out.write("    </div>\n");
      out.write("</body>\n");
      out.write("</html>\n");
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
