//
// Alunos: Jonatha Cardoso e Márcio Landvoigt
//

function mascaraData(data, componente)
{
    var mydata = ''; 
    mydata = mydata + data; 
    if (mydata.length == 2){ 
        mydata = mydata + '/'; 
        componente.value = mydata; 
    } 
    if (mydata.length == 5){ 
        mydata = mydata + '/'; 
        componente.value = mydata; 
    }
} 

function apenasNumeros(e)
{
    var tecla=(window.event)?event.keyCode:e.which;   
    if((tecla>47 && tecla<58))
        return true;
    else
    {
    	if (tecla==8)
            return true;
	else
            return false;
    }
}

function apenasDecimal(e,texto)
{
    var tecla=(window.event)?event.keyCode:e.which; 
    if((tecla>46 && tecla<58))
    {
        return true;
    }
    else
    {
        if(tecla == 46)
        {
            if(texto.indexOf(".") != -1)
                return false;
            else
                return true;
        }
    	else if (tecla==8)
            return true;
	else
            return false;
    }
}

function validarFormulario(form)
{
    if( form.nome.value == "" )
    {
        alert("O campo Nome esta em branco!");
        form.nome.focus();
        return false;
    }
    
    if( form.nome.value.length < 5 || form.nome.value.length > 100 )
    {
        alert("O campo Nome deve ter entre 5 e 100 caracteres!");
        form.nome.focus();
        return false;
    }
    
    if( form.edicao.value == "" )
    {
        alert("O campo Edicao esta em branco!");
        form.edicao.focus();
        return false;
    }
    
    if( form.edicao.value.length < 4 || form.edicao.value.length > 10 )
    {
        alert("O campo Edicao deve ter entre 4 e 10 caracteres!");
        form.edicao.focus();
        return false;
    }
    
    if( form.patrocinador.value == "" )
    {
        alert("O campo Patrocinador esta em branco!");
        form.patrocinador.focus();
        return false;
    }
    
    if( form.patrocinador.value.length < 0 || form.edicao.value.length > 50 )
    {
        alert("O campo Patrocinador deve ter ate 50 caracteres!");
        form.patrocinador.focus();
        return false;
    }
    
    if( form.campeao.value == "" )
    {
        alert("O campo Campeao esta em branco!");
        form.campeao.focus();
        return false;
    }
    
    if( form.campeao.value.length < 4 || form.campeao.value.length > 50 )
    {
        alert("O campo Campeao deve ter entre 4 e 50 caracteres!");
        form.campeao.focus();
        return false;
    }
    
    if( form.viceCampeao.value == "" )
    {
        alert("O campo Vice-campeao esta em branco!");
        form.viceCampeao.focus();
        return false;
    }
    
    if( form.viceCampeao.value.length < 4 || form.viceCampeao.value.length > 50 )
    {
        alert("O campo Vice-campeao deve ter entre 4 e 50 caracteres!");
        form.viceCampeao.focus();
        return false;
    }
    
    if( form.qtdeParticipantes.value == "" )
    {
        alert("O campo Qtde. de participantes esta em branco!");
        form.qtdeParticipantes.focus();
        return false;
    }
    
    if( form.qtdeParticipantes.value < 2 || form.qtdeParticipantes.value > 200 )
    {
        alert("A qtde. de participantes deve ser entre 2 e 200!");
        form.qtdeParticipantes.focus();
        return false;
    }
    
    if( form.qtdeFases.value != "" )
    {
        if( form.qtdeFases.value < 1 || form.qtdeFases.value > 10 )
        {
            alert("A qtde. de fases deve ser entre 1 e 10!");
            form.qtdeFases.focus();
            return false;
        }
    }
    
    if( form.qtdePartidas.value != "" )
    {
        if( form.qtdePartidas.value < 1 || form.qtdePartidas.value > 1000 )
        {
            alert("A qtde. de partidas deve ser entre 1 e 1000!");
            form.qtdePartidas.focus();
            return false;
        }
    }
    
    if( form.qtdeGols.value != "" )
    {
        if( form.qtdeGols.value < 0 || form.qtdeGols.value > 10000 )
        {
            alert("A qtde. de partidas deve ser de ate 10000!");
            form.qtdeGols.focus();
            return false;
        }
    }
    
    if( form.mediaPublico.value != "" )
    {
        if( form.mediaPublico.value < 0 || form.mediaPublico.value > 100000 )
        {
            alert("A media de publico deve ser de ate 10000!");
            form.mediaPublico.focus();
            return false;
        }
    }

    if ( form.pontosCorridos.value == "" )
    {
        alert("Informe a opcao sobre Pontos Corridos");
        return false;
    }
    
    if ( form.turnoReturno.value == "")
    {
        alert("Informe a opcao sobre Turno e Returno");
        return false;
    }
    
    if ( form.formulaFraga.value == "" )
    {
        alert("Informe a opcao sobre Formula Fraga");
        return false;
    }
    
    if ( form.faseGrupos.value == "" )
    {
        alert("Informe a opcao sobre Fase de Grupos");
        return false;
    }
    
    if ( form.eliminatorias.value == "" )
    {
        alert("Informe a opcao sobre Eliminatorias");
        return false;
    }

    if( form.mediaGols.value != "" )
    {
        if( form.mediaGols.value < 0 || form.mediaGols.value > 20 )
        {
            alert("A media de gols deve ser de ate 20!");
            form.mediaGols.focus();
            return false;
        }
    }
    
    if( form.mediaRenda.value != "" )
    {
        if( form.mediaRenda.value < 0 || form.mediaRenda.value > 1000000 )
        {
            alert("A media de renda deve ser de ate 1000000!");
            form.mediaRenda.focus();
            return false;
        }
    }

    if ( verificaData(form.dataInicial.value) == false )
    {
        alert("Informe uma Data inicial valida ");
        form.dataInicial.focus();
        return false;
    }
    
    if ( verificaData(form.dataFinal.value) == false )
    {
        alert("Informe uma Data final valida ");
        form.dataFinal.focus();
        return false;
    }
}

function verificaData(data)
{ 
    if (data == "") { 
        return false;
    }
    
    if (data.length != 10) { 
        return false;
    }
    
    dia = (data.substring(0,2)); 
    mes = (data.substring(3,5)); 
    ano = (data.substring(6,10)); 

    if ((dia < 01)||(dia < 01 || dia > 30) && (  mes == 04 || mes == 06 || mes == 09 || mes == 11 ) || dia > 31) { 
        return false;
    } 

    if (mes < 01 || mes > 12 ) { 
        return false;
    } 

    if (mes == 2 && ( dia < 01 || dia > 29 || ( dia > 28 && (parseInt(ano / 4) != ano / 4)))) { 
        return false; 
    } 
    
    if (ano < 1900 || ano > 2050) {
        return false;
    }

    return true;
} 