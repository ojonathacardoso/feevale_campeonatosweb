<!--
# Alunos: Jonatha Cardoso e Márcio Landvoigt
-->

<%@page import="Banco.Campeonato"%>
<%@page import="Banco.CampeonatoPersistor"%>
<%@page import="Tela.Utilidades"%>

<%    
    if(request.getParameter("nome") == null)
    {
        response.sendRedirect( "CampeonatoLista.jsp?M=1" );
        return;  
    }
    else
    {
        Campeonato campeonatoSalvar = new Campeonato();
        
        campeonatoSalvar.setNome( Utilidades.limparPrepararTexto( request.getParameter("nome") ) );
        campeonatoSalvar.setEdicao( Utilidades.limparPrepararTexto( request.getParameter("edicao") ) );
        campeonatoSalvar.setPatrocinador( Utilidades.limparPrepararTexto( request.getParameter("patrocinador") ) );
        campeonatoSalvar.setCampeao( Utilidades.limparPrepararTexto( request.getParameter("campeao") ) );
        campeonatoSalvar.setViceCampeao( Utilidades.limparPrepararTexto( request.getParameter("viceCampeao") ) );
        
        campeonatoSalvar.setQtdeParticipantes( Utilidades.limparPrepararNumero( request.getParameter("qtdeParticipantes") ) );
        campeonatoSalvar.setQtdeFases( Utilidades.limparPrepararNumero( request.getParameter("qtdeFases") ) );
        campeonatoSalvar.setQtdePartidas( Utilidades.limparPrepararNumero( request.getParameter("qtdePartidas") ) );
        campeonatoSalvar.setQtdeGols( Utilidades.limparPrepararNumero( request.getParameter("qtdeGols") ) );
        campeonatoSalvar.setMediaPublico( Utilidades.limparPrepararNumero( request.getParameter("mediaPublico") ) );
        
        campeonatoSalvar.setPontosCorridos( Utilidades.limparPrepararBooleano(request.getParameter("pontosCorridos") ) );
        campeonatoSalvar.setTurnoReturno( Utilidades.limparPrepararBooleano(request.getParameter("turnoReturno") ) );
        campeonatoSalvar.setFormulaFraga( Utilidades.limparPrepararBooleano(request.getParameter("formulaFraga") ) );
        campeonatoSalvar.setFaseGrupos( Utilidades.limparPrepararBooleano(request.getParameter("faseGrupos") ) );
        campeonatoSalvar.setEliminatorias( Utilidades.limparPrepararBooleano(request.getParameter("eliminatorias") ) );
        
        campeonatoSalvar.setMediaGols( Utilidades.limparPrepararDecimal(request.getParameter("mediaGols") ) );
        campeonatoSalvar.setMediaRenda( Utilidades.limparPrepararDecimal(request.getParameter("mediaRenda") ) );
        
        campeonatoSalvar.setDataInicio( Utilidades.limparPrepararData(request.getParameter("dataInicial") ) );
        campeonatoSalvar.setDataFinal( Utilidades.limparPrepararData(request.getParameter("dataFinal") ) );
        
        // Sem código, é inclusão
        if(request.getParameter("codigo") == null)
        {
            CampeonatoPersistor.insereCampeonato(campeonatoSalvar);
            
            session.setAttribute("Campeonato", null);
            
            response.sendRedirect( "Menu.jsp?M=2" );
            return;            
        }
        // Com código, é edição
        else
        {
            campeonatoSalvar.setId( Utilidades.limparPrepararNumero(request.getParameter("codigo")) );
            
            CampeonatoPersistor.alteraCampeonato(campeonatoSalvar);
            
            session.setAttribute("Campeonato", campeonatoSalvar);
            
            response.sendRedirect( "CampeonatoLista.jsp?M=4" );
            return;
        }
        
    }
        
%>