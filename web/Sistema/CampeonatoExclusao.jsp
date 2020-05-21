<!--
# Alunos: Jonatha Cardoso e Márcio Landvoigt
-->

<%@page import="Banco.Usuario"%>
<%@page import="Banco.Campeonato"%>
<%@page import="Banco.CampeonatoPersistor"%>
<%@page import="Banco.CampeonatoLocalizador"%>
        
<%
    Usuario usuario = (Usuario) session.getAttribute( "Usuario" );
    
    Campeonato campeonatoAtual = (Campeonato) session.getAttribute( "Campeonato" );

    if( usuario == null )
    {
        response.sendRedirect( "Acesso.jsp?M=3" );
        return;
    }
    else
    {
        if(campeonatoAtual == null)
        {
            response.sendRedirect( "CampeonatoLista.jsp?M=1" );
            return;  
        }
        else
        {
            if(CampeonatoPersistor.excluiCampeonato( campeonatoAtual ))
            {
                session.setAttribute("Campeonato", null);
                response.sendRedirect( "CampeonatoLista.jsp?M=3" );
            }
            else
            {
                response.sendRedirect( "CampeonatoLista.jsp?M=2" );
            }
            return;
        }
    }

%>