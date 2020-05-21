<!--
# Alunos: Jonatha Cardoso e Márcio Landvoigt
-->

<%@page import="Banco.Usuario"%>

<html>
    <head>
        <title>Login :: Sistema de campeonatos</title> 

        <%
            Usuario usuario = (Usuario) session.getAttribute( "Usuario" );

            if( usuario == null )
            {
                response.sendRedirect( "Acesso.jsp?M=3" );
                return;
            }
            else
            {
                if(request.getParameter("L") != null)
                {
                    %> <script>alert("Bem-vindo ao sistema, <%=usuario.getNome()%>!");</script> <%
                }
            }
            
            session.setAttribute("Campeonato", null);
            
            if( request.getParameter( "M" ) != null )
            {
                int mensagem = Integer.parseInt( request.getParameter("M") );

                switch(mensagem){
                    case 1:
                        %> <script>alert("Nenhum campeonato cadastrado!");</script> <%
                        break;
                    case 2:
                        %> <script>alert("Campeonato inserido com sucesso!");</script> <%
                        break;
                    case 3:
                        %> <script>alert("Campeonato não existente!");</script> <%
                        break;
                }
            }
            
        %>

        <script language="javascript">
            function pesquisaCampeonato()
            {
                var id;
                do {
                    id = prompt("Informe o codigo do campeonato:");
                } while(isNaN(parseFloat(id)) || ! isFinite(id))
                
                location.href='CampeonatoPesquisa.jsp?C='+id;  
            }            
        </script>
        
    </head>

    <body style="font-family: Arial;">
        <center>
            <br>
            <h1>Sistema de campeonatos</h1>
            
            <br><br>
            
            <input type="button" value="Listar" onclick="location.href='CampeonatoLista.jsp';" style="width: 100px;" />
            &nbsp;&nbsp;
            <input type="button" value="Pesquisar" onclick="pesquisaCampeonato();" style="width: 100px;" />
            &nbsp;&nbsp;
            <input type="button" value="Incluir" onclick="location.href='CampeonatoInclusao.jsp';" style="width: 100px;" />
            
            <br><br>
            
            <input type="button" value="Sair" onclick="location.href='AcessoLogout.jsp';" style="width: 100px;" />
        </center>
    </body>
  
</html>