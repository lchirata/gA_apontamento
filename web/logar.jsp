
<%@page import="model.UsuarioModel"%>
<%@page import="controller.UsuarioController"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="dao.AutenticaDao"%>
<%@page import="java.sql.Connection"%>
<%@page import="factory.ConnectionFactory"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html style="text-align: center;">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="imagem/favicon.ico" />
        <title>JSP Page</title>
    </head>
    
    <body>


<%

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
%>    



<form class="form" action="logar.jsp" method="post">
    <br>
    <br>
    <h1>BASE 実績</h1>

    <div class="form-group">
        <input name="usuario" type="text" class="form-control"
               id="exampleInputEmail1" aria-describedby="emailHelp"
               placeholder=" usuario ">
    </div>

    <div class="form-group">
        <input name="senha" type="password" class="form-control"
               id="exampleInputEmail1" aria-describedby="emailHelp"
               placeholder=" senha ">
    </div>
    <br>
    <button type="submit" class="btn btn-primary">ログイン</button>
    <br>
</form>


    <br>
<a href="admin.jsp">管理</a>

    </body>
</html>







