<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

<%
    String user = "root";
    String password = "admin";
    String dataBaseUrl = "jdbc:mysql://127.0.0.1:3306/pro";

    Connection con = null;
    PreparedStatement st;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection(dataBaseUrl, user, password);
        
        out.print("<p style='color: green'>Banco conectado!</p>");
        
        if ("POST".equals(request.getMethod())) {
            String usuario = request.getParameter("Usuario");
            String CPF = request.getParameter("CPF");
            String dataNasc = request.getParameter("dataNasc");
            String email = request.getParameter("Email");
            String senha = request.getParameter("password");
            
            if (usuario != null && CPF != null && dataNasc != null && email != null) {
                String insertDB = "INSERT INTO usuarios (usuario, cpf, dataNasc, email) VALUES (?,?,?,?,?)";
                
                st = con.prepareStatement(insertDB);
                st.setString(1, usuario);
                st.setString(2, CPF);
                st.setString(3, dataNasc);
                st.setString(4, email);
                st.setString(5, senha);
                
                st.executeUpdate();
                
                out.print("<p style='color: green'>Dados para " + usuario +  " adicionados</p>");
                st.close();
    }
   }
        
        
    } catch (Exception x){
        out.print("<p style='color: red'>" + x.getMessage() + "</p>");
    }

%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TCCPRO - Login</title>
    <link rel="stylesheet" href="CSS/style.css">
</head>
<body>
    <div class="Titulo2">
        <h1>TCC Pro</h1>
    </div>
    
        
        
        <form method="POST" id="RegisterButton">
           <div class="registro">
                <input type="text" name="Usuario" class="Usuario" placeholder="Usuario" required>
                <input type="text" name="CPF" class="CPF" placeholder="CPF" required>
                <input type="text" name="dataNasc" class="dataNasc" placeholder="Data de Nascimento" required>
                <input type="text" name="Email" class="Email" placeholder="Gmail" required>
                <input type="password" name="password" class="password" placeholder="Senha" required>
                <input type="password" name="password2" class="password2" placeholder="Repita a Senha" required>

                <button type="submit"><strong>Registro</strong></button>
            </div>
        </form>
</body>
</html>
</html>
