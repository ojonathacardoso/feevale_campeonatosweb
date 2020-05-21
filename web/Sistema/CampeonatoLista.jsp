<!--
# Alunos: Jonatha Cardoso e Márcio Landvoigt
-->

<%@page import="Banco.Usuario"%>
<%@page import="Banco.Campeonato"%>
<%@page import="Banco.CampeonatoLocalizador"%>
<%@page import="Tela.Utilidades"%>

<html>
    <head>
        <title>Listar campeonatos :: Sistema de campeonatos</title> 
        <%
            Usuario usuario = (Usuario) session.getAttribute( "Usuario" );            
            
            Campeonato campeonatoAtual = (Campeonato) session.getAttribute( "Campeonato" );
            
            Campeonato campeonatoNovo = null;
            
            if( usuario == null )
            {
                response.sendRedirect( "Acesso.jsp?M=3" );
                return;
            }
            else
            {
                if(campeonatoAtual == null)
                {
                    if(request.getParameter("Lista") != null)
                    {
                        String opcao = request.getParameter("Lista");

                        if(opcao.equals(new String("1")))
                        {
                            campeonatoNovo = CampeonatoLocalizador.buscaCampeonatoPrimeiro();
                        }
                        else if(opcao.equals(new String("U")))
                        {
                            campeonatoNovo = CampeonatoLocalizador.buscaCampeonatoUltimo();
                        }
                        else
                        {
                            campeonatoNovo = CampeonatoLocalizador.buscaCampeonatoPrimeiro();
                        }
                    }
                    else
                    {
                        campeonatoNovo = CampeonatoLocalizador.buscaCampeonatoPrimeiro();   
                    }
                }
                else
                {
                    if(request.getParameter("Lista") != null)
                    {
                        String opcao = request.getParameter("Lista");
                        
                        if(opcao.equals(new String("1")))
                        {
                            campeonatoNovo = CampeonatoLocalizador.buscaCampeonatoPrimeiro();
                        }
                        else if(opcao.equals(new String("U")))
                        {
                            campeonatoNovo = CampeonatoLocalizador.buscaCampeonatoUltimo();
                        }
                        else if(opcao.equals(new String("A")))
                        {
                            campeonatoNovo = CampeonatoLocalizador.buscaCampeonatoAnterior( campeonatoAtual.getId() );
                        }
                        else if(opcao.equals(new String("P")))
                        {
                            campeonatoNovo = CampeonatoLocalizador.buscaCampeonatoProximo( campeonatoAtual.getId() );
                        }
                    }
                }
                
                if(campeonatoNovo == null)
                {
                    if(campeonatoAtual == null)
                    {
                        if( request.getParameter("Lista").equals(new String("P")) )
                            campeonatoAtual = CampeonatoLocalizador.buscaCampeonatoUltimo();
                        else
                            campeonatoAtual = CampeonatoLocalizador.buscaCampeonatoPrimeiro();

                        if(campeonatoAtual == null)
                        {
                            response.sendRedirect( "Menu.jsp?M=1" );
                            return;
                        }
                    }
                }
                else
                {
                    campeonatoAtual = campeonatoNovo;
                }
            }
            
            session.setAttribute("Campeonato", campeonatoAtual);
            
            if( request.getParameter( "M" ) != null )
            {
                int mensagem = Integer.parseInt( request.getParameter("M") );

                switch(mensagem){
                    case 1:
                        %> <script>alert("Campeonato não existente!");</script> <%
                        break;
                    case 2:
                        %> <script>alert("Não foi possível excluir o campeonato!");</script> <%
                        break;
                    case 3:
                        %> <script>alert("Campeonato excluído com sucesso!");</script> <%
                        break;
                    case 4:
                        %> <script>alert("Campeonato alterado com sucesso!");</script> <%
                        break;
                }
            }
        %>
        
        <script language="javascript">
            function confirmaExclusao()
            {
                var confirma = confirm("Você deseja excluir o campeonato <%=campeonatoAtual.getId()%>?");
                
                if(confirma)
                    location.href='CampeonatoExclusao.jsp';
            }            
        </script>
        
    </head>

    <body style="font-family: Arial;">
    <center>
        <br>
        <h1>Sistema de campeonatos</h1>

        <input type="button" value="Editar" onclick="location.href='CampeonatoEdicao.jsp?C=<%=campeonatoAtual.getId()%>';" style="width: 100px;" />
        &nbsp;&nbsp;
        <input type="button" value="Excluir" onclick="confirmaExclusao();" style="width: 100px;" />

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

                    <input type="radio" name="pontosCorridos" <%=sim%> value="1" disabled>Sim
                    <input type="radio" name="pontosCorridos" <%=nao%> value="0" disabled>Não
                </td>
            </tr>
            <tr>
                <td>
                    Nome:
                </td>
                <td>
                    <input type="text" name="nome" style="width: 230px; color: black;" value="<%=campeonatoAtual.getNome()%>" disabled>
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

                    <input type="radio" name="turnoReturno" <%=sim%> value="1" disabled>Sim
                    <input type="radio" name="turnoReturno" <%=nao%> value="0" disabled>Não
                </td>
            </tr>
            <tr>
                <td>
                    Edição:
                </td>
                <td>
                    <input type="text" name="edicao" style="width: 100px; color: black;" value="<%=campeonatoAtual.getEdicao()%>" disabled>
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

                    <input type="radio" name="formulaFraga" <%=sim%> value="1" disabled>Sim
                    <input type="radio" name="formulaFraga" <%=nao%> value="0" disabled>Não
                </td>
            </tr>
            <tr>
                <td>
                    Patrocinador:
                </td>
                <td>
                    <input type="text" name="patrocinador" style="width: 230px; color: black;" value="<%=campeonatoAtual.getPatrocinador()%>" disabled>
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

                    <input type="radio" name="faseGrupos" <%=sim%> value="1" disabled>Sim
                    <input type="radio" name="faseGrupos" <%=nao%> value="0" disabled>Não
                </td>
            </tr>
            <tr>
                <td>
                    Campeão:
                </td>
                <td>
                    <input type="text" name="campeao" style="width: 200px; color: black;" value="<%=campeonatoAtual.getCampeao()%>" disabled>
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

                    <input type="radio" name="eliminatorias" <%=sim%> value="1" disabled>Sim
                    <input type="radio" name="eliminatorias" <%=nao%> value="0" disabled>Não
                </td>
            </tr>
            <tr>
                <td>
                    Vice-campeão:
                </td>
                <td>
                    <input type="text" name="viceCampeao" style="width: 200px; color: black;" value="<%=campeonatoAtual.getViceCampeao()%>" disabled>
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

                    <input type="text" name="mediaGols" style="width: 70px; color: black;" value="<%=mediaGols%>" disabled>
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

                    <input type="text" name="qtdeParticipantes" style="width: 60px; color: black;" value="<%=qtdeParticipantes%>" disabled>
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

                    <input type="text" name="mediaRenda" style="width: 100px; color: black;" value="<%=mediaRenda%>" disabled>
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

                    <input type="text" name="qtdeFases" style="width: 60px; color: black;" value="<%=qtdeFases%>" disabled>
                </td>
                <td>
                    Data inicial:
                </td>
                <td>
                    <input type="text" name="dataInicial" style="width: 90px; color: black;" value="<%=Utilidades.exibirData(campeonatoAtual.getDataInicio())%>" disabled>
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

                    <input type="text" name="qtdePartidas" style="width: 60px; color: black;" value="<%=qtdePartidas%>" disabled>
                </td>
                <td>
                    Data final:
                </td>
                <td>
                    <input type="text" name="dataFinal" style="width: 90px; color: black;" value="<%=Utilidades.exibirData(campeonatoAtual.getDataFinal())%>" disabled>
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

                    <input type="text" name="qtdeGols" style="width: 60px; color: black;" value="<%=qtdeGols%>" disabled>
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

                    <input type="text" name="mediaPublico" style="width: 100px; color: black;" value="<%=mediaPublico%>" disabled>
                </td>
            </tr>
        </table>

        <br><br>

        <input type="button" value="Primeiro" onclick="location.href='CampeonatoLista.jsp?Lista=1';" style="width: 100px;" />
        &nbsp;&nbsp;
        <input type="button" value="Anterior" onclick="location.href='CampeonatoLista.jsp?Lista=A';" style="width: 100px;" />
        &nbsp;&nbsp;
        <input type="button" value="Próximo" onclick="location.href='CampeonatoLista.jsp?Lista=P';" style="width: 100px;" />
        &nbsp;&nbsp;
        <input type="button" value="Último" onclick="location.href='CampeonatoLista.jsp?Lista=U';" style="width: 100px;" />

        <br><br>

        <input type="button" value="Voltar" onclick="location.href='Menu.jsp';" style="width: 100px;" />

    </center>
    </body>
  
</html>