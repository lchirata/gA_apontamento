
<%@page import="model.ApontamentoModel"%>
<%@include file="validarusuario.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Meus apontamentos</h1>
    </body>
</html>


<%        

    ApontamentoModel apontamentoModel = (ApontamentoModel) session.getAttribute("usuario");
    //out.print("Bem vinda" + apontamentoModel.getUsuario() + "!!");
    
 

%>


<h1>Selecionar Operador</h1>

<jsp:include page ="menu.jsp"></jsp:include>

<div>
    <a href="listagem.jsp">Meus Apontamentos</a>
    <br>
    <a href="kaori.jsp">Kaori</a>
    <br>
    <a href="erick.jsp">Erick</a>
    <br>
    <a href="kaori.jsp">Kaori</a>
    <br>
    <a href="teste/excluir.jsp">Raphael</a>


</div>
