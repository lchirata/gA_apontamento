package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import model.UsuarioModel;
import model.ChamadoModel;
import dao.ChamadoDao;
import dao.ApontamentoDao;
import factory.ConnectionFactory;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.DriverManager;
import java.sql.Connection;
import controller.ApontamentoController;
import model.ApontamentoModel;
import model.UsuarioModel;

public final class listagem_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(1);
    _jspx_dependants.add("/validarusuario.jsp");
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
      out.write('\n');

    UsuarioModel usulogado = null;
    if (session.getAttribute("usuario") != null) {
        usulogado = (UsuarioModel) session.getAttribute("usuario");
    } else {
        response.sendRedirect("logar.jsp");
    }


      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<meta charset=\"UTF-8\">\n");
      out.write("<link rel=\"shortcut icon\" href=\"imagem/favicon.ico\" />\n");
      out.write("\n");
      out.write("\n");
      out.write("<a href=\"logar.jsp\">Sair</a>\n");
      out.write("\n");
      out.write("<body style=\"text-align: center\">\n");
      out.write("    <br>\n");
      out.write("    <h2> Bem vinda ao sistema de apontamento gA!!! ");
 
      out.write(" </h2>\n");
      out.write("\n");
      out.write("    <br>\n");
      out.write("    <br>\n");
      out.write("    <br>\n");
      out.write("    <br>    \n");
      out.write("</h3>Chamados </h3>   \n");
      out.write("\n");
      out.write("<br>\n");
      out.write("<br>    \n");
      out.write("<table border=\"1\" width=80% height=30% ALIGN=center>\n");
      out.write("    <tr>\n");
      out.write("        <td>chamado</td>\n");
      out.write("        <td>descricao</td>\n");
      out.write("        <td>detalhamento</td>\n");
      out.write("        <td>quando usar</td>\n");
      out.write("\n");
      out.write("        ");
            
            ChamadoDao chamadodao = new ChamadoDao();
            ChamadoModel chamadoz = new ChamadoModel();

            ChamadoModel ch = chamadodao.query(chamadoz);
            Connection connectionz = new ConnectionFactory().getConnection();

            String sqlz = "SELECT * FROM chamado;";

            PreparedStatement stmtz = connectionz.prepareStatement(sqlz);
            ResultSet rsz = stmtz.executeQuery(sqlz);

            while (rsz.next()) {
                out.println("<tr>");
                out.println("<td>" + rsz.getString(1));
                out.println("<td>" + rsz.getString(2));
                out.println("<td>" + rsz.getString(3));
                out.println("<td>" + rsz.getString(4));
                out.println("<tr>");

            }

            rsz.close();
            stmtz.close();
            connectionz.close();
        
      out.write("\n");
      out.write("</table>\n");
      out.write("\n");
      out.write("</tr>\n");
      out.write("</table>\n");
      out.write("\n");
      out.write("\n");

    String usuario = ((String) session.getAttribute("usunome"));
    String data = request.getParameter("data");
    String tempo = request.getParameter("tempo");
    String chamado = request.getParameter("chamado");
    String descricao = request.getParameter("descricao");
    String detalhamento = request.getParameter("detalhamento");

    if (usuario != null && data != null && tempo != null && chamado != null) {

        ApontamentoDao apontamentoDAO = new ApontamentoDao();
        ApontamentoModel apontamento = new ApontamentoModel();
        UsuarioModel usuarioad = new UsuarioModel();

        usuarioad.setUsuario(usuario);
        apontamento.setData(data);
        apontamento.setTempo(tempo);
        apontamento.setChamado(chamado);
        apontamento.setDescricao(descricao);
        apontamento.setDetalhamento(detalhamento);
        
        

        ApontamentoModel ap = apontamentoDAO.adiciona(apontamento, usuarioad);
    }


      out.write("\n");
      out.write("</body>\n");
      out.write("\n");
      out.write("\n");
      out.write("<form class=\"form\" action=\"listagem.jsp\" method=\"post\" >\n");
      out.write("    <br>\n");
      out.write("    <br>\n");
      out.write("\n");
      out.write("</p1><p1>___________________Novo Apontamento______________________________</p1>\n");
      out.write("<br>\n");
      out.write("<br>\n");
      out.write("<div class=\"form-group\">\n");
      out.write("\n");
      out.write("\n");
      out.write("    <div class=\"form-group\" >\n");
      out.write("        <input name=\"data\" type=\"date\" class=\"form-control\"\n");
      out.write("               id=\"exampleInputEmail1\" aria-describedby=\"emailHelp\"\n");
      out.write("               placeholder=\"YYYY-MM-DD\">\n");
      out.write("    </div>\n");
      out.write("    <div class=\"form-group\">\n");
      out.write("        <input name=\"tempo\" type=\"text\" class=\"form-control\"\n");
      out.write("               id=\"exampleInputPassword1\" placeholder=\"tempo\">\n");
      out.write("    </div>\n");
      out.write("    <div class=\"form-group\">\n");
      out.write("        <input name=\"chamado\" type=\"text\" class=\"form-control\"\n");
      out.write("               id=\"exampleInputPassword1\" placeholder=\"chamado\">\n");
      out.write("    </div>\n");
      out.write("    <div class=\"form-group\">\n");
      out.write("        <input name=\"descricao\" type=\"text\" class=\"form-control\"\n");
      out.write("               id=\"exampleInputPassword1\" placeholder=\"descricao\">\n");
      out.write("    </div>\n");
      out.write("</div>\n");
      out.write("<div class=\"form-group\">\n");
      out.write("    <input name=\"detalhamento\" type=\"text\" class=\"form-control\"\n");
      out.write("           id=\"exampleInputPassword1\" placeholder=\"detalhamento\">\n");
      out.write("</div>\n");
      out.write("<br>\n");
      out.write("<button type=\"submit\" class=\"btn btn-primary\">apontar</button>\n");
      out.write("\n");
      out.write("</form>\n");
      out.write("<br>\n");
      out.write("\n");
      out.write("\n");
      out.write("<p1></p1>\n");
      out.write("\n");
      out.write("<table border=\"1\" ALIGN=center >\n");
      out.write("    <tr>\n");
      out.write("\n");
      out.write("        <!--<td>id</td>-->\n");
      out.write("        <td>data</td>\n");
      out.write("        <td>tempo</td>\n");
      out.write("        <td>chamado</td>\n");
      out.write("        <td>descricao</td>\n");
      out.write("        <td>detalhamento</td>\n");
      out.write("    </tr>\n");
      out.write("    <p1></p1>\n");
      out.write("    <br>\n");
      out.write("    <br>\n");
      out.write("\n");
      out.write("</p1><p1>___________________Apontamentos Deste Mês_________________________</p1>\n");
      out.write("<p1></p1>\n");
      out.write("<br>\n");
      out.write("<br>\n");
      out.write("<a href=\"todosaps.jsp\"> <<<     Apontamentos anteriores</a>\n");
      out.write("<br>\n");
      out.write("<br>\n");
      out.write("<br>\n");
      out.write("<br>\n");
      out.write("\n");
    UsuarioModel usuarioad = (UsuarioModel) session.getAttribute("usuario");

    ApontamentoDao apontamentoDAO = new ApontamentoDao();
    ApontamentoModel apontamento = new ApontamentoModel();
    UsuarioModel usuariol = new UsuarioModel();

    ApontamentoModel ap = apontamentoDAO.query(apontamento);

    Connection connection = new ConnectionFactory().getConnection();

    String sql = "SELECT * FROM apontamento where usuario like '" + usuario + "'" + " and MONTH(data) =  MONTH(CURRENT_DATE()) order by data;";

// insert  into abeam.apontamento_chamado (cod_ap_chamado, chamado, id_apontamento) values (2, '1', 2);
    PreparedStatement stmt = connection.prepareStatement(sql);
    ResultSet rs = stmt.executeQuery(sql);

    while (rs.next()) {
        out.println("<tr>");
        out.println("<td>" + rs.getString(1));
        out.println("<td>" + rs.getString(3));
        out.println("<td>" + rs.getString(4));
        out.println("<td>" + rs.getString(5));
        out.println("<td>" + rs.getString(6));
        out.println("<td>" + rs.getString(7));
        out.println("<tr>");
    }
    rs.close();
    stmt.close();
    connection.close();


      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("</table>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<form class=\"form\" action=\"listagem.jsp\" method=\"post\">\n");
      out.write("\n");
      out.write("    <br>\n");
      out.write("    <br>\n");
      out.write("    <br>\n");
      out.write("    <br>\n");
      out.write("\n");
      out.write("\n");
      out.write("    <p1>___________________Excluir Apontamento_______________________________</p1>\n");
      out.write("    <br>\n");
      out.write("    <br>\n");
      out.write("    <br>\n");
      out.write("    <br>\n");
      out.write("\n");
      out.write("    ");
//        
        String usuarioex = request.getParameter("usuarioex");
        String datax = request.getParameter("data");

        if (datax
                != null) {
            ApontamentoDao apontamentoDAOex = new ApontamentoDao();
            ApontamentoModel apontamentoex = new ApontamentoModel();
            UsuarioModel usuarioexx = new UsuarioModel();

            usuarioexx.setUsuario(usuarioex);
            apontamentoex.setData(datax);

            ApontamentoModel ex = apontamentoDAOex.exclui(apontamentoex, usuarioexx);

            response.sendRedirect("listagem.jsp");
        }

    
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("    <form class=\"form\" action=\"listagem.jsp\" method=\"post\">\n");
      out.write("\n");
      out.write("        <div class=\"form-group\">\n");
      out.write("            <input name=\"usuarioex\" type=\"text\" class=\"form-control\"\n");
      out.write("                   id=\"exampleInputEmail1\" aria-describedby=\"emailHelp\"\n");
      out.write("                   placeholder=\"usuario\">\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("        <div class=\"form-group\">\n");
      out.write("            <input name=\"data\" type=\"date\" class=\"form-control\"\n");
      out.write("                   id=\"exampleInputEmail1\" aria-describedby=\"emailHelp\"\n");
      out.write("                   placeholder=\"YYYY-MM-DD\">\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("        <button type=\"submit\" class=\"btn btn-primary\">excluir</button>\n");
      out.write("\n");
      out.write("    </form>\n");
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
