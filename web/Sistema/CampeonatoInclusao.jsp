<!--
# Alunos: Jonatha Cardoso e Márcio Landvoigt
-->

<%@page import="Banco.Usuario"%>
<%@page import="Banco.Campeonato"%>
<%@page import="Banco.CampeonatoLocalizador"%>
<%@page import="Tela.Utilidades"%>

<html>
    <head>
        <title>Novo campeonato :: Sistema de campeonatos</title> 
        
        <script src="../Utilidades/Funcoes.js"></script>

        <%
            Usuario usuario = (Usuario) session.getAttribute( "Usuario" );
            
            if( usuario == null )
            {
                response.sendRedirect( "Acesso.jsp?M=3" );
                return;
            }
            
        %>
        
    </head>

    <body style="font-family: Arial;">
    <center>
        <form action="CampeonatoSalvar.jsp" method="post" id="campeonato">
            <br>
            <h1>Sistema de campeonatos</h1>
                        
            <input type="submit" value="Salvar" onclick="return validarFormulario(document.getElementById('campeonato'));" style="width: 100px;" />
            &nbsp;&nbsp;
            <input type="button" value="Cancelar" onclick="location.href='Menu.jsp'" style="width: 100px;" />
            
            <br><br>
            
            <table style="font-size: 10pt; font-weight: bold;">
                <tr>
                    <td width="170">
                    </td>
                    <td width="250">
                    </td>
                    <td width="170">
                        Foi em pontos corridos?
                    </td>
                    <td width="150">
                        <input type="radio" name="pontosCorridos" value="1">Sim
                        <input type="radio" name="pontosCorridos" value="0">Não
                    </td>
                </tr>
                <tr>
                    <td>
                        Nome:
                    </td>
                    <td>
                        <input type="text" name="nome" style="width: 230px; color: black;">
                    </td>
                    <td>
                        Foi em turno e returno?
                    </td>
                    <td>
                        <input type="radio" name="turnoReturno" value="1">Sim
                        <input type="radio" name="turnoReturno" value="0">Não
                    </td>
                </tr>
                <tr>
                    <td>
                        Edição:
                    </td>
                    <td>
                        <input type="text" name="edicao" style="width: 100px; color: black;">
                    </td>
                    <td>
                        Foi na Fórmula Fraga?
                    </td>
                    <td>                        
                        <input type="radio" name="formulaFraga" value="1">Sim
                        <input type="radio" name="formulaFraga" value="0">Não
                    </td>
                </tr>
                <tr>
                    <td>
                        Patrocinador:
                    </td>
                    <td>
                        <input type="text" name="patrocinador" style="width: 230px; color: black;">
                    </td>
                    <td>
                        Teve fase de grupos?
                    </td>
                    <td>                        
                        <input type="radio" name="faseGrupos" value="1">Sim
                        <input type="radio" name="faseGrupos" value="0">Não
                    </td>
                </tr>
                <tr>
                    <td>
                        Campeão:
                    </td>
                    <td>
                        <input type="text" name="campeao" style="width: 200px; color: black;">
                    </td>
                    <td>
                        Teve eliminatórias?
                    </td>
                    <td>
                        <input type="radio" name="eliminatorias" value="1">Sim
                        <input type="radio" name="eliminatorias" value="0">Não
                    </td>
                </tr>
                <tr>
                    <td>
                        Vice-campeão:
                    </td>
                    <td>
                        <input type="text" name="viceCampeao" style="width: 200px; color: black;">
                    </td>
                    <td>
                        Média de gols:
                    </td>
                    <td>
                        <input type="text" name="mediaGols" style="width: 70px; color: black;" onkeypress='return apenasDecimal(event,this.value)'>
                    </td>
                </tr>
                <tr>
                    <td>
                        Qtde. de participantes:
                    </td>
                    <td>
                        <input type="text" name="qtdeParticipantes" style="width: 60px; color: black;" onkeypress='return apenasNumeros(event)'>
                    </td>
                    <td>
                        Média de renda:
                    </td>
                    <td>
                        <input type="text" name="mediaRenda" style="width: 100px; color: black;" onkeypress='return apenasDecimal(event,this.value)'>
                    </td>
                </tr>
                <tr>
                    <td>
                        Qtde. de fases:
                    </td>
                    <td>
                        <input type="text" name="qtdeFases" style="width: 60px; color: black;" onkeypress='return apenasNumeros(event)'>
                    </td>
                    <td>
                        Data inicial:
                    </td>
                    <td>
                        <input type="text" name="dataInicial" id="dataInicial" style="width: 90px; color: black;" onKeyPress='return apenasNumeros(event)' onKeyDown="mascaraData(this.value, this);" maxlength="10">
                        &nbsp;
                        <input type="button" value="Limpar" onClick="document.getElementById('dataInicial').value='';">
                    </td>
                </tr>
                <tr>
                    <td>
                        Qtde. de partidas:
                    </td>
                    <td>
                        <input type="text" name="qtdePartidas" style="width: 60px; color: black;" onkeypress='return apenasNumeros(event)'>
                    </td>
                    <td>
                        Data final:
                    </td>
                    <td>
                        <input type="text" name="dataFinal" id="dataFinal" style="width: 90px; color: black;" onKeyPress='return apenasNumeros(event)' onKeyDown="mascaraData(this.value, this);" maxlength="10">
                        &nbsp;
                        <input type="button" value="Limpar" onClick="document.getElementById('dataFinal').value='';">
                    </td>
                </tr>
                <tr>
                    <td>
                        Qtde. de gols:
                    </td>
                    <td>
                        <input type="text" name="qtdeGols" style="width: 60px; color: black;" onkeypress='return apenasNumeros(event)'>
                    </td>
                </tr>
                <tr>
                    <td>
                        Média de público:
                    </td>
                    <td>
                        <input type="text" name="mediaPublico" style="width: 100px; color: black;" onkeypress='return apenasNumeros(event)'>
                    </td>
                </tr>
            </table>            
        </form>
    </center>
    </body>
  
</html>