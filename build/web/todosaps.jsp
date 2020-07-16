<%@page import="dao.ApontamentoDao"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="factory.ConnectionFactory"%>
<%@page import="controller.ApontamentoController"%>
<%@page import="model.ApontamentoModel"%>
<%@include file="validarusuario.jsp"%>
<link href="css/style.css" rel="stylesheet">
<link rel="shortcut icon" href="imagem/favicon.ico" />

<br><br><br>


<p1></p1>

<table border="1">
    <tr>
        <td>usuario</td>
        <td>data</td>
        <td>tempo</td>
        <td>chamado</td>
        <td>descricao</td>
        <td>detalhamento</td>
    </tr>
    <p1></p1>

 
    <a href="listagem.jsp">Voltar</a>

    <br> 
    <br> 

</p1><p1>___________________Filtrar por apontamentos passados _________________________</p1>

<form>
    <p1></p1>
    <br>
    <br>

    DATA INICIO <div class="form-group">
        <input name="dataini" type="date" class="form-control"
               id="exampleInputEmail1" aria-describedby="emailHelp"
               placeholder="YYYY-MM-DD">
    </div>

    <br>

    DATA FIM  <div class="form-group">
        <input name="datafim" type="date" class="form-control"
               id="exampleInputEmail1" aria-describedby="emailHelp"
               placeholder="YYYY-MM-DD">
    </div>

    <br>
        <button id="filtrar" type="submit" class="btn btn-primary">filtrar</button>

    <br>
    <br>
</form>

<%    


    String usuario = ((String) session.getAttribute("usunome"));
    String dataini = (String)request.getParameter("dataini");
    String datafim = (String) request.getParameter("datafim");
    

    if (dataini != null || datafim != null) {
//        ApontamentoModel apquery = new ApontamentoModel();
//        ApontamentoController qpcontrolquery = new ApontamentoController();
//        apquery = qpcontrolquery.query(apquery);

        ApontamentoDao apontamentoDAO = new ApontamentoDao();
        ApontamentoModel apontamento = new ApontamentoModel();
        UsuarioModel usuariol = new UsuarioModel();

        ApontamentoModel ap = apontamentoDAO.query(apontamento);

        Connection connection = new ConnectionFactory().getConnection();

//        String sql = "SELECT * FROM apontamento where  data >= '" + dataini + "'  and  data  <= '" + datafim + "' order by data;";
      String sql = "SELECT * FROM apontamento where usuario = '"+ usuario +"' and data >= '"+ dataini +"' and data <= '"+ datafim +"';";
                   // SELECT * FROM apontamento where usuario = '"lhirata"' and data >= '2020-06-01'  and  data  <= '2020-06-30' order by data;
        
       out.print("Periodo selecionado de : " + dataini + " até " + datafim );
       out.print("  ");
        
        PreparedStatement stmt = connection.prepareStatement(sql);
        ResultSet rs = stmt.executeQuery(sql);

        while (rs.next()) {
            out.println("<tr>");
            out.println("<td>" + rs.getString(1));
            out.println("<td>" + rs.getString(2));
            out.println("<td>" + rs.getString(3));
            out.println("<td>" + rs.getString(4));
            out.println("<td>" + rs.getString(5));
            out.println("<td>" + rs.getString(6));
            out.println("<tr>");
        }

        rs.close();
        stmt.close();
        connection.close();
    } 


%>





</table>


<form class="form" action="listagem.jsp" method="post">


    <br>
    <br>

