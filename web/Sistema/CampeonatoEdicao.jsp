<!--
# Alunos: Jonatha Cardoso e Márcio Landvoigt
-->

<%@page import="Banco.Usuario"%>
<%@page import="Banco.Campeonato"%>
<%@page import="Banco.CampeonatoLocalizador"%>
<%@page import="Tela.Utilidades"%>

<html>
    <head>
        <title>Editar campeonato :: Sistema de campeonatos</title> 
        
        <script src="../Utilidades/Funcoes.js"></script>

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
            }
            
        %>
        
    </head>

    <body style="font-family: Arial;">
    <center>
        <form action="CampeonatoSalvar.jsp?Acao=E" method="post" id="campeonato">
            <br>
            <h1>Sistema de campeonatos</h1>
                        
            <input type="submit" value="Salvar" onclick="return validarFormulario(document.getElementById('campeonato'));" style="width: 100px;" />
            &nbsp;&nbsp;
            <input type="button" value="Cancelar" onclick="location.href='CampeonatoLista.jsp'" style="width: 100px;" />
            
            <br><br>
            
            <table style="font-size: 10pt; font-weight: bold;">
                <tr>
                    <td width="170">
                        Código:
                    </td>
                    <td width="250">
                        <input type="text" name="codigo" style="width: 50px; color: black;" value="<%=campeonatoAtual.getId()%>" disabled>
                    </td>
                    <td width="170">
                        Foi em pontos corridos?
                    </td>
                    <td width="150">
                        <%
                            String sim = "";
                            String nao = "";                       
                        
                            if( campeonatoAtual.isPontosCorridos() )
                            {
                                sim = "checked";
                                nao = "";
                            }
                            else
                            {
                                sim = "";
                                nao = "checked";
                            }                            
                        %>

                        <input type="radio" name="pontosCorridos" <%=sim%> value="1">Sim
                        <input type="radio" name="pontosCorridos" <%=nao%> value="0">Não
                    </td>
                </tr>
                <tr>
                    <td>
                        Nome:
                    </td>
                    <td>
                        <input type="text" name="nome" style="width: 230px; color: black;" value="<%=campeonatoAtual.getNome()%>">
                    </td>
                    <td>
                        Foi em turno e returno?
                    </td>
                    <td>
                        <%
                            if( campeonatoAtual.isTurnoReturno())
                            {
                                sim = "checked";
                                nao = "";
                            }
                            else
                            {
                                sim = "";
                                nao = "checked";
                            }                            
                        %>
                        
                        <input type="radio" name="turnoReturno" <%=sim%> value="1">Sim
                        <input type="radio" name="turnoReturno" <%=nao%> value="0">Não
                    </td>
                </tr>
                <tr>
                    <td>
                        Edição:
                    </td>
                    <td>
                        <input type="text" name="edicao" style="width: 100px; color: black;" value="<%=campeonatoAtual.getEdicao()%>">
                    </td>
                    <td>
                        Foi na Fórmula Fraga?
                    </td>
                    <td>
                        <%
                            if( campeonatoAtual.isFormulaFraga())
                            {
                                sim = "checked";
                                nao = "";
                            }
                            else
                            {
                                sim = "";
                                nao = "checked";
                            }                            
                        %>
                        
                        <input type="radio" name="formulaFraga" <%=sim%> value="1">Sim
                        <input type="radio" name="formulaFraga" <%=nao%> value="0">Não
                    </td>
                </tr>
                <tr>
                    <td>
                        Patrocinador:
                    </td>
                    <td>
                        <input type="text" name="patrocinador" style="width: 230px; color: black;" value="<%=campeonatoAtual.getPatrocinador()%>">
                    </td>
                    <td>
                        Teve fase de grupos?
                    </td>
                    <td>
                        <%
                            if( campeonatoAtual.isFaseGrupos())
                            {
                                sim = "checked";
                                nao = "";
                            }
                            else
                            {
                                sim = "";
                                nao = "checked";
                            }                            
                        %>
                        
                        <input type="radio" name="faseGrupos" <%=sim%> value="1">Sim
                        <input type="radio" name="faseGrupos" <%=nao%> value="0">Não
                    </td>
                </tr>
                <tr>
                    <td>
                        Campeão:
                    </td>
                    <td>
                        <input type="text" name="campeao" style="width: 200px; color: black;" value="<%=campeonatoAtual.getCampeao()%>">
                    </td>
                    <td>
                        Teve eliminatórias?
                    </td>
                    <td>
                        <%
                            if( campeonatoAtual.isEliminatorias())
                            {
                                sim = "checked";
                                nao = "";
                            }
                            else
                            {
                                sim = "";
                                nao = "checked";
                            }                            
                        %>
                        
                        <input type="radio" name="eliminatorias" <%=sim%> value="1">Sim
                        <input type="radio" name="eliminatorias" <%=nao%> value="0">Não
                    </td>
                </tr>
                <tr>
                    <td>
                        Vice-campeão:
                    </td>
                    <td>
                        <input type="text" name="viceCampeao" style="width: 200px; color: black;" value="<%=campeonatoAtual.getViceCampeao()%>">
                    </td>
                    <td>
                        Média de gols:
                    </td>
                    <td>
                        <%
                            String mediaGols = "";
                        
                            if(campeonatoAtual.getMediaGols() == -1)
                                mediaGols = "";
                            else
                                mediaGols = campeonatoAtual.getMediaGols().toString();
                        %>
                        
                        <input type="text" name="mediaGols" style="width: 70px; color: black;" value="<%=mediaGols%>" onkeypress='return apenasDecimal(event,this.value)'>
                    </td>
                </tr>
                <tr>
                    <td>
                        Qtde. de participantes:
                    </td>
                    <td>
                        <%
                            String qtdeParticipantes = "";
                        
                            if(campeonatoAtual.getQtdeParticipantes() == -1)
                                qtdeParticipantes = "";
                            else
                                qtdeParticipantes = campeonatoAtual.getQtdeParticipantes().toString();
                        %>
                        
                        <input type="text" name="qtdeParticipantes" style="width: 60px; color: black;" value="<%=qtdeParticipantes%>" onkeypress='return apenasNumeros(event)'>
                    </td>
                    <td>
                        Média de renda:
                    </td>
                    <td>
                        <%
                            String mediaRenda = "";
                        
                            if(campeonatoAtual.getMediaRenda()== -1)
                                mediaRenda = "";
                            else
                                mediaRenda = campeonatoAtual.getMediaRenda().toString();
                        %>
                        
                        <input type="text" name="mediaRenda" style="width: 100px; color: black;" value="<%=mediaRenda%>" onkeypress='return apenasDecimal(event,this.value)'>
                    </td>
                </tr>
                <tr>
                    <td>
                        Qtde. de fases:
                    </td>
                    <td>
                        <%
                            String qtdeFases = "";
                        
                            if(campeonatoAtual.getQtdeFases()== -1)
                                qtdeFases = "";
                            else
                                qtdeFases = campeonatoAtual.getQtdeFases().toString();
                        %>
                        
                        <input type="text" name="qtdeFases" style="width: 60px; color: black;" value="<%=qtdeFases%>" onkeypress='return apenasNumeros(event)'>
                    </td>
                    <td>
                        Data inicial:
                    </td>
                    <td>
                        <input type="text" name="dataInicial" id="dataInicial" style="width: 90px; color: black;" onKeyPress='return apenasNumeros(event)' onKeyDown="mascaraData(this.value, this);" maxlength="10" value="<%=Utilidades.exibirData(campeonatoAtual.getDataInicio())%>">
                        &nbsp;
                        <input type="button" value="Limpar" onClick="document.getElementById('dataInicial').value='';">
                    </td>
                </tr>
                <tr>
                    <td>
                        Qtde. de partidas:
                    </td>
                    <td>
                        <%
                            String qtdePartidas = "";
                        
                            if(campeonatoAtual.getQtdePartidas() == -1)
                                qtdePartidas = "";
                            else
                                qtdePartidas = campeonatoAtual.getQtdePartidas().toString();
                        %>
                        
                        <input type="text" name="qtdePartidas" style="width: 60px; color: black;" value="<%=qtdePartidas%>" onkeypress='return apenasNumeros(event)'>
                    </td>
                    <td>
                        Data final:
                    </td>
                    <td>
                        <input type="text" name="dataFinal" id="dataFinal" style="width: 90px; color: black;" onKeyPress='return apenasNumeros(event)' onKeyDown="mascaraData(this.value, this);" maxlength="10" value="<%=Utilidades.exibirData(campeonatoAtual.getDataFinal())%>">
                        &nbsp;
                        <input type="button" value="Limpar" onClick="document.getElementById('dataFinal').value='';">
                    </td>
                </tr>
                <tr>
                    <td>
                        Qtde. de gols:
                    </td>
                    <td>
                        <%
                            String qtdeGols = "";
                        
                            if(campeonatoAtual.getQtdeGols()== -1)
                                qtdeGols = "";
                            else
                                qtdeGols = campeonatoAtual.getQtdeGols().toString();
                        %>
                        
                        <input type="text" name="qtdeGols" style="width: 60px; color: black;" value="<%=qtdeGols%>" onkeypress='return apenasNumeros(event)'>
                    </td>
                </tr>
                <tr>
                    <td>
                        Média de público:
                    </td>
                    <td>
                        <%
                            String mediaPublico = "";
                        
                            if(campeonatoAtual.getMediaPublico() == -1)
                                mediaPublico = "";
                            else
                                mediaPublico = campeonatoAtual.getMediaPublico().toString();
                        %>
                        
                        <input type="text" name="mediaPublico" style="width: 100px; color: black;" value="<%=mediaPublico%>" onkeypress='return apenasNumeros(event)'>
                    </td>
                </tr>
            </table>            
        </form>
    </center>
    </body>
  
</html>