<!--
# Alunos: Jonatha Cardoso e Márcio Landvoigt
-->

<%@page import="Banco.Usuario"%>

<html>
    <head>
        <title>Login :: Sistema de campeonatos</title> 
        
        <%
            Usuario usuario = (Usuario) session.getAttribute( "Usuario" );

            if( usuario != null )
            {
                response.sendRedirect( "Menu.jsp?L=1" );
                return;
            }
            
            if( request.getParameter( "M" ) != null )
            {
                int mensagem = Integer.parseInt(request.getParameter("M"));

                switch(mensagem){
                    case 1:
                        %> <script>alert("Você deve informar o usuário e a senha!");</script> <%
                        break;
                    case 2:
                        %> <script>alert("Usuário ou senha inválidos!");</script> <%
                        break;
                    case 3:
                        %> <script>alert("Efetue o login para acessar o sistema!");</script> <%
                        break;
                    case 4:
                        %> <script>alert("Logout efetuado com sucesso!");</script> <%
                        break;
                }
            }
        %>

    </head>

    <body style="font-family: Arial;">
        <center>
        <form action="AcessoLogin.jsp" method="post">
            <br>
            <h1>Sistema de campeonatos</h1>
            <br><br>
            <table style="font-size: 10pt;">
                <tr>
                    <td style="width: 75px;">Usuário:</td>
                    <td><input type="text" name="login" /></td>
                </tr>
                <tr>
                    <td>Senha:</td>
                    <td><input type="password" name="senha" /></td>
                </tr>
            </table>
            <br><br>
            <input type="submit" value="Login" style="width: 100px;" />
            &nbsp;&nbsp;
            <input type="reset" value="Limpar" style="width: 100px;" />
        </form>
        </center>
  </body>
  
</html>