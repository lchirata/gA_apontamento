<%-- 
    Document   : setarusu
    Created on : 18/04/2020, 14:57:14
    Author     : laris
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        
        
        <button type="submit" class="btn btn-primary">Apontamento realizado com sucesso!</button>

        <%

            String usuario = ((String) session.getAttribute("usunome"));
            String senha = ((String) session.getAttribute("ususenha"));
            
            out.print("apontamento realizado com sucesso!!");

            response.sendRedirect("listagem.jsp");


        %>        
    </body>
</html>
