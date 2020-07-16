<%@page import="controller.ChamadoController"%>
<%@page import="controller.ApontamentoController"%>
<%@page import="model.ApontamentoModel"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="factory.ConnectionFactory"%>
<%@page import="model.ChamadoModel"%>
<%@page import="dao.ChamadoDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="shortcut icon" href="imagem/favicon.ico" />
<link href="css/style.css" rel="stylesheet">

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h2>Administrar chamados </h2>
        
        <br><br>
        <a href="logar.jsp">Sair</a>

    </body>  



    <form>

        <%
            String cha = request.getParameter("chamado");
            String descricao = request.getParameter("descricao");
            String detalhamento = request.getParameter("detalhamento");
            String quandousar = request.getParameter("quandousar");

            if (cha != null ) {
                ChamadoDao chamadod = new ChamadoDao();
                ChamadoModel chamadom = new ChamadoModel();

                chamadom.setChamado(cha);
                chamadom.setDescricao(descricao);
                chamadom.setDetalhamento(detalhamento);
                chamadom.setQuandousar(quandousar);

                ChamadoModel cham = chamadod.adiciona(chamadom);
                System.out.print(cham);

            }
        %>

        <h3> Incluir novo chamado </h3>
        <div class="form-group">

            <div>        
                <input name="chamado" type="text" class="form-control"
                       id="exampleInputEmail1" aria-describedby="emailHelp"
                       placeholder="chamado">
            </div>

            <div class="form-group">
                <input name="descricao" type="text" class="form-control"
                       id="exampleInputEmail1" aria-describedby="emailHelp"
                       placeholder="descricao">
            </div>
            <div class="form-group">
                <input name="detalhamento" type="text" class="form-control"
                       id="exampleInputPassword1" placeholder="detalhamento">
            </div>
            <div class="form-group">
                <input name="quandousar" type="text" class="form-control"
                       id="exampleInputPassword1" placeholder="quando usar">
            </div>
            
            <button type="submit" class="btn btn-primary">incluir</button>

        </div>        
    </form>

    <form>   
        <h3> Excluir chamado </h3>
        <div class="form-group">

            <div>        
                <input name="chamadoex" type="text" class="form-control"
                       id="exampleInputEmail1" aria-describedby="emailHelp"
                       placeholder="chamado">
            </div>
            <%
                String chaex = request.getParameter("chamadoex");

                if (chaex != null) {
                    ChamadoDao chamadodex = new ChamadoDao();
                    ChamadoModel chamadomex = new ChamadoModel();

                    chamadomex.setChamado(chaex);

                    ChamadoModel cham = chamadodex.exclui(chamadomex);
                    System.out.print(chaex);

                }
            %>
            
            <button type="submit" class="btn btn-primary">excluir</button>
        </div>     
    </form>


    <br>
    <br>

    <table border="1">
        <tr>
            <td>chamado</td>
            <td>descrição</td>
            <td>detalhamento</td>
            <td>quando usar</td>
            <%
                ChamadoDao chamadodao = new ChamadoDao();
                ChamadoModel chamado = new ChamadoModel();

                ChamadoModel ch = chamadodao.query(chamado);
                Connection connection = new ConnectionFactory().getConnection();

                String sql = "SELECT * FROM chamado;";

                PreparedStatement stmtz = connection.prepareStatement(sql);
                ResultSet rs = stmtz.executeQuery(sql);

                while (rs.next()) {
                    out.println("<tr>");
                    out.println("<td>" + rs.getString(1));
                    out.println("<td>" + rs.getString(2));
                    out.println("<td>" + rs.getString(3));
                    out.println("<td>" + rs.getString(4));
                    out.println("<tr>");

                }

                rs.close();
                stmtz.close();
                connection.close();
            %>
    </table>


    <br>
    <br>


    <h3> Gerar Excel </h3>


    <form>
        <p1></p1>

    </div>
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

<table border="1">
    <tr>
        <td>chamado</td>
        <td>data</td>
        <td>tempo</td>
        <td>chamado</td>
        <td>descricao</td>
        <td>detalhamento</td>
    </tr>
    <p1></p1>

    <%
        String dataini = (String) request.getParameter("dataini");
        String datafim = (String) request.getParameter("datafim");

        if (dataini != null || datafim != null) {
            ApontamentoModel apquery = new ApontamentoModel();
            ApontamentoController qpcontrolquery = new ApontamentoController();
            apquery = qpcontrolquery.query(apquery);

            Connection connectionn = new ConnectionFactory().getConnection();

            String sqln = "SELECT apontamento.chamado, usuarios.nome, apontamento.data, apontamento.tempo, apontamento.descricao, apontamento.detalhamento from apontamento, usuarios where data >=  '" + dataini + "' and  data  <= '" + datafim + "' order by nome ASC, data;";
            

            out.print("Periodo selecionado de : " + dataini + " até " + datafim);
            out.print("  ");

            PreparedStatement stmt = connectionn.prepareStatement(sqln);
            ResultSet rsn = stmt.executeQuery(sqln);

            while (rsn.next()) {
                out.println("<tr>");
                out.println("<td>" + rsn.getString(1));
                out.println("<td>" + rsn.getString(2));
                out.println("<td>" + rsn.getString(3));
                out.println("<td>" + rsn.getString(4));
                out.println("<td>" + rsn.getString(5));
                out.println("<td>" + rsn.getString(6));
                out.println("<tr>");
            }


            rsn.close();
            stmt.close();
            connectionn.close();
        }

    %>

    

</table>
    
        <%
        String sqlz = "INSERT INTO apontamento_chamado(cod_ap_chamado, chamado, id_apontamento) VALUES(?,?,?)";
        %>

</html>