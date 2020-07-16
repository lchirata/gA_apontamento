<%@page import="model.UsuarioModel"%>
<%@page import="model.ChamadoModel"%>
<%@page import="dao.ChamadoDao"%>
<%@page import="dao.ApontamentoDao"%>
<%@page import="factory.ConnectionFactory"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="controller.ApontamentoController"%>
<%@page import="model.ApontamentoModel"%>
<%@include file="validarusuario.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<link rel="shortcut icon" href="imagem/favicon.ico" />


<a href="logar.jsp">Sair</a>

<body style="text-align: center">
    <br>
    <h2> Bem vinda ao sistema de apontamento gA!!! <% %> </h2>

    <br>
    <br>
    <br>
    <br>    
</h3>Chamados </h3>   

<br>
<br>    
<table border="1" width=80% height=30% ALIGN=center>
    <tr>
        <td>chamado</td>
        <td>descricao</td>
        <td>detalhamento</td>
        <td>quando usar</td>

        <%            
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
        %>
</table>

</tr>
</table>


<%
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

%>
</body>


<form class="form" action="listagem.jsp" method="post" >
    <br>
    <br>

</p1><p1>___________________Novo Apontamento______________________________</p1>
<br>
<br>
<div class="form-group">


    <div class="form-group" >
        <input name="data" type="date" class="form-control"
               id="exampleInputEmail1" aria-describedby="emailHelp"
               placeholder="YYYY-MM-DD">
    </div>
    <div class="form-group">
        <input name="tempo" type="text" class="form-control"
               id="exampleInputPassword1" placeholder="tempo">
    </div>
    <div class="form-group">
        <input name="chamado" type="text" class="form-control"
               id="exampleInputPassword1" placeholder="chamado">
    </div>
    <div class="form-group">
        <input name="descricao" type="text" class="form-control"
               id="exampleInputPassword1" placeholder="descricao">
    </div>
</div>
<div class="form-group">
    <input name="detalhamento" type="text" class="form-control"
           id="exampleInputPassword1" placeholder="detalhamento">
</div>
<br>
<button type="submit" class="btn btn-primary">apontar</button>

</form>
<br>


<p1></p1>

<table border="1" ALIGN=center >
    <tr>

        <!--<td>id</td>-->
        <td>data</td>
        <td>tempo</td>
        <td>chamado</td>
        <td>descricao</td>
        <td>detalhamento</td>
    </tr>
    <p1></p1>
    <br>
    <br>

</p1><p1>___________________Apontamentos Deste Mês_________________________</p1>
<p1></p1>
<br>
<br>
<a href="todosaps.jsp"> <<<     Apontamentos anteriores</a>
<br>
<br>
<br>
<br>

<%    UsuarioModel usuarioad = (UsuarioModel) session.getAttribute("usuario");

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

%>


</table>




<form class="form" action="listagem.jsp" method="post">

    <br>
    <br>
    <br>
    <br>


    <p1>___________________Excluir Apontamento_______________________________</p1>
    <br>
    <br>
    <br>
    <br>

    <%//        
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

    %>


    <form class="form" action="listagem.jsp" method="post">

        <div class="form-group">
            <input name="usuarioex" type="text" class="form-control"
                   id="exampleInputEmail1" aria-describedby="emailHelp"
                   placeholder="usuario">
        </div>



        <div class="form-group">
            <input name="data" type="date" class="form-control"
                   id="exampleInputEmail1" aria-describedby="emailHelp"
                   placeholder="YYYY-MM-DD">
        </div>

        <button type="submit" class="btn btn-primary">excluir</button>

    </form>

