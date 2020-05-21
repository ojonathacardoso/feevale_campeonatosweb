//
// Alunos: Jonatha Cardoso e Márcio Landvoigt
//

package Tela;

import Controle.MyException;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;
import javax.swing.AbstractButton;
import javax.swing.ButtonGroup;

public class Utilidades
{   
    public static String exibirData(Timestamp dataAntiga) throws MyException
    {
        try
        {
            SimpleDateFormat formatoAntigo = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S");
            Date dataNova = formatoAntigo.parse( dataAntiga.toString() );
            SimpleDateFormat formatoNovo = new SimpleDateFormat("dd/MM/YYYY");
            
            return (formatoNovo.format(dataNova));
        } catch (Exception e) {
            throw new MyException(e);
        }

    }
    
    public static Boolean obterRadioButtonSelecionado(ButtonGroup radios)
    {
        for (Enumeration<AbstractButton> botoes = radios.getElements(); botoes.hasMoreElements();)
        {
            AbstractButton botao = botoes.nextElement();

            if (botao.isSelected())
            {
                if(botao.getText().equals( "Sim" ))
                    return true;
                else if (botao.getText().equals( "Não" ))
                    return false;
            }
        }

        return null;
    }
    
    public static String limparPrepararTexto(String texto)
    {
        return texto.trim().toUpperCase();
    }
    
    public static Integer limparPrepararNumero(String texto)
    {
        if(texto.trim().length() > 0)
        {
            return Integer.parseInt(texto.trim());
        }
        else
        {
            return -1; // Indicativo de campo vazio 
        }
        
    }
    
    public static Boolean limparPrepararBooleano(String texto)
    {
        if(texto.equals(new String("1")))
        {
            return true;
        }
        else
        {
            return false;
        }
    }
    
    public static Double limparPrepararDecimal(String texto)
    {
        if(texto.trim().length() > 0)
        {
            return Double.parseDouble(texto.trim());
        }
        else
        {
            return -1.0; // Indicativo de campo vazio
        }
    }
    
    public static Timestamp limparPrepararData(String texto) throws MyException
    {
        try{
            DateFormat formato = new SimpleDateFormat("dd/MM/yyyy");
            Date data = formato.parse(texto);
            long time = data.getTime();
            
            return new Timestamp(time);
        } catch(Exception e) {
            throw new MyException(e);
        }        
    }
    
}
