<!--
# Alunos: Jonatha Cardoso e Márcio Landvoigt
-->

<%@page import="Banco.Campeonato"%>
<%@page import="Banco.CampeonatoLocalizador"%>

<%

    Campeonato campeonato = CampeonatoLocalizador.buscaCampeonatoId( Integer.parseInt(request.getParameter("C")) );
            
    if(campeonato != null)
    {
        session.setAttribute("Campeonato", campeonato);
        
        response.sendRedirect( "CampeonatoLista.jsp" );
        return;
    }
    else
    {
        response.sendRedirect( "Menu.jsp?M=3" );
        return;
    }
    
%>