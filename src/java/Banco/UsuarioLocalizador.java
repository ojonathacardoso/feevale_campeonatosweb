//
// Alunos: Jonatha Cardoso e Márcio Landvoigt
//

package Banco;

import Controle.Conexao;
import Controle.MyException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UsuarioLocalizador 
{
    public static Usuario buscaUsuarioId( Integer id ) throws MyException
    {
        String sql = " SELECT * FROM usuarios WHERE id = ? ";
        Conexao conexao = Conexao.getInstance();
        
        Usuario usuario = new Usuario();
        
        try {
            
            PreparedStatement statement = conexao.prepareStatement( sql.toString() );
            statement.setInt( 1, id );
            ResultSet resultado = statement.executeQuery();
            
            if( resultado.next() )
            { 
                usuario.setId( resultado.getInt( "id" ) ); 
                
                usuario.setLogin( resultado.getString("login" ) ); 
                usuario.setNome( resultado.getString( "nome" ) ); 
                usuario.setSenha(resultado.getString( "senha" ) ); 
            }

            return usuario;
        } catch ( Exception e ) {
            return usuario;
        } 
    }
    
    public static Usuario buscaUsuarioLogin( String login, String senha ) throws MyException
    {
        String sql = " SELECT * FROM usuarios WHERE login = ? AND senha = ? ";
        Conexao conexao = Conexao.getInstance();
        
        try {
            
            PreparedStatement statement = conexao.prepareStatement( sql.toString() );
            statement.setString(1, login );
            statement.setString(2, senha );
            ResultSet resultado = statement.executeQuery();
            
            if( resultado.next() )
            {                
                Usuario usuario = new Usuario();
                
                usuario.setId( resultado.getInt( "id" ) ); 
                
                usuario.setLogin( resultado.getString("login" ) ); 
                usuario.setNome( resultado.getString( "nome" ) ); 
                usuario.setSenha(resultado.getString( "senha" ) );
                
                return usuario;
            }
            else
            {
                return null;
            }
        } catch ( Exception e ) {
            throw new MyException(e);
        } 
    }
    
}
