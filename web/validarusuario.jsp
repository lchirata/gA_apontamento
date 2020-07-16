<%@page import="model.UsuarioModel"%>
<%
    UsuarioModel usulogado = null;
    if (session.getAttribute("usuario") != null) {
        usulogado = (UsuarioModel) session.getAttribute("usuario");
    } else {
        response.sendRedirect("logar.jsp");
    }

%>


