package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import model.UsuarioModel;
import controller.UsuarioController;
import java.sql.DriverManager;
import dao.AutenticaDao;
import java.sql.Connection;
import factory.ConnectionFactory;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.PreparedStatement;

public final class logar_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html style=\"text-align: center;\">\n");
      out.write("\n");
      out.write("    <head>\n");
      out.write("        <meta charset=\"UTF-8\">\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <link rel=\"shortcut icon\" href=\"imagem/favicon.ico\" />\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("    </head>\n");
      out.write("    \n");
      out.write("    <body>\n");
      out.write("\n");
      out.write("\n");


    String usuario = (String) request.getParameter("usuario");
    String senha = (String) request.getParameter("senha");
    
     String nome = request.getParameter("nome");
    if (usuario != null && senha != null) {

        AutenticaDao autenticaDao = new AutenticaDao();
        UsuarioModel autenticaModel = new UsuarioModel();
        
        autenticaModel.setUsuario(usuario);
        autenticaModel.setSenha(senha);

        boolean usu = autenticaDao.autentica(autenticaModel);
        if (usu) {
            System.out.print("logado com sucesso");
        } else {
            System.out.print("ususario ou senha incorretos");
        }
 
        if (usu) {

            HttpSession sessaoUsuario = request.getSession();
            sessaoUsuario.setAttribute("usuario", autenticaModel);
            sessaoUsuario.setAttribute("usunome", usuario);
            sessaoUsuario.setAttribute("senha", autenticaModel);
            sessaoUsuario.setAttribute("ususenha", senha);
            sessaoUsuario.setMaxInactiveInterval(100);
            response.sendRedirect("listagem.jsp");
            
            
        }
    }

      out.write("    \n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<form class=\"form\" action=\"logar.jsp\" method=\"post\">\n");
      out.write("    <br>\n");
      out.write("    <br>\n");
      out.write("    <h1>BASE 実績</h1>\n");
      out.write("\n");
      out.write("    <div class=\"form-group\">\n");
      out.write("        <input name=\"usuario\" type=\"text\" class=\"form-control\"\n");
      out.write("               id=\"exampleInputEmail1\" aria-describedby=\"emailHelp\"\n");
      out.write("               placeholder=\" usuario \">\n");
      out.write("    </div>\n");
      out.write("\n");
      out.write("    <div class=\"form-group\">\n");
      out.write("        <input name=\"senha\" type=\"password\" class=\"form-control\"\n");
      out.write("               id=\"exampleInputEmail1\" aria-describedby=\"emailHelp\"\n");
      out.write("               placeholder=\" senha \">\n");
      out.write("    </div>\n");
      out.write("    <br>\n");
      out.write("    <button type=\"submit\" class=\"btn btn-primary\">ログイン</button>\n");
      out.write("    <br>\n");
      out.write("</form>\n");
      out.write("\n");
      out.write("\n");
      out.write("    <br>\n");
      out.write("<a href=\"admin.jsp\">管理</a>\n");
      out.write("\n");
      out.write("    </body>\n");
      out.write("</html>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
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
