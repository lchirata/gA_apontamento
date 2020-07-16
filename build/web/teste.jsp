


    <%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="factory.ConnectionFactory"%>
<%@page import="model.ChamadoModel"%>
<%@page import="dao.ChamadoDao"%>


<select name="chamado">

    
<%    
        ChamadoDao chamadodaos = new ChamadoDao();
        ChamadoModel chamadozs = new ChamadoModel();

        ChamadoModel ch = chamadodaos.query(chamadozs);
        Connection connections = new ConnectionFactory().getConnection();
        


        String sqls = "SELECT * FROM chamados;";

        PreparedStatement stmts = connections.prepareStatement(sqls);
        ResultSet rss = stmts.executeQuery(sqls);
         
        while (rss.next()) {
            out.println("<option>" + rss.getString(1)); 
        }
        rss.close();
        stmts.close();
        connections.close();
%>
</option>
</select> <br>