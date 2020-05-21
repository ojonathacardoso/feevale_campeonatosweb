//
// Alunos: Jonatha Cardoso e Márcio Landvoigt
//

package Banco;

import Controle.Conexao;
import Controle.MyException;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class UsuarioPersistor
{    
    public static Boolean insereUsuario(Usuario usuario) throws MyException
    {
        StringBuilder sql = new StringBuilder( 500 );
        sql.append( " INSERT INTO usuarios ( " );
        sql.append( " login, nome, senha " ); 
        sql.append( " ) VALUES " );
        sql.append( " ( ?,?,? ) " );

        Conexao conexao = Conexao.getInstance();
        PreparedStatement statement = conexao.prepareStatement( sql.toString() );

        try {
            statement.setString( 1, usuario.getLogin());
            statement.setString( 2, usuario.getNome());
            statement.setString( 3, usuario.getSenha());

            statement.execute();

            return true;
        } catch (SQLException e){
            throw new MyException( e );
        }
        
    }
    
    public static Boolean alteraUsuario(Usuario usuario) throws MyException
    {
        StringBuilder sql = new StringBuilder( 500 );
        
        sql.append( " UPDATE campeonatos SET " );
        sql.append( " login = ?, " ); 
        sql.append( " nome = ?, " ); 
        sql.append( " senha = ?, " ); 
        sql.append( " WHERE id = ? " );

        Conexao conexao = Conexao.getInstance();
        PreparedStatement statement = conexao.prepareStatement( sql.toString() );
        
        try {
            statement.setString( 1, usuario.getLogin());
            statement.setString( 2, usuario.getNome());
            statement.setString( 3, usuario.getSenha());
            
            statement.setInt(4, usuario.getId() );

            statement.execute();
            
            return true;
        } catch (SQLException e){
            throw new MyException( e );
        }
    }
    
    public static Boolean excluiUsuario(Usuario usuario) throws MyException
    {
        StringBuilder sql = new StringBuilder( 50 );
        sql.append( "DELETE FROM usuarios WHERE id = ?" ); 

        Conexao conexao = Conexao.getInstance();
        PreparedStatement statement = conexao.prepareStatement( sql.toString() );

        try {
            statement.setInt( 1, usuario.getId() );

            statement.execute();

            return true;
        } catch (SQLException e){
            throw new MyException( e );
        }
    }
    
}
