<!--
# Alunos: Jonatha Cardoso e Márcio Landvoigt
-->

<%@page import="Banco.Usuario"%>
<%@page import="Banco.UsuarioLocalizador"%>

<%
    String login = null;
    String senha = null;
    
    if(request.getParameter("login") == null || request.getParameter("senha") == null)
    {
        response.sendRedirect( "Acesso.jsp?M=3" );
    }
    else
    {
        login = request.getParameter("login").trim();
        senha = request.getParameter("senha");
        
        if(login.isEmpty() || senha.isEmpty())
        {
            response.sendRedirect( "Acesso.jsp?M=1" );
            session.removeAttribute( "Usuario" );
        }
        else
        {
            Usuario usuario = null;
                    
            try {
                usuario = UsuarioLocalizador.buscaUsuarioLogin( login, senha );

                if(usuario != null)
                {
                    session.setAttribute( "Usuario", usuario );
                    response.sendRedirect( "Menu.jsp?L=1" );
                }
                else
                {
                    session.removeAttribute( "Usuario" );
                    response.sendRedirect( "Acesso.jsp?M=2" );
                }
            } catch( Exception e ) {
                session.removeAttribute( "Usuario" );
                response.sendRedirect( "Acesso.jsp?M=2" );
            }
        }
    }
    
%>