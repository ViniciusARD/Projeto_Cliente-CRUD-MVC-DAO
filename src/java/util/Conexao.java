package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * Classe responsável por fornecer uma conexão com o banco de dados.
 */
public class Conexao {

    public static Connection getConexao() throws ClassNotFoundException, SQLException {

        // Carrega o driver JDBC
        Class.forName("com.mysql.jdbc.Driver");
        // Estabelece a conexão com o banco de dados
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/proj_cliente_db","root", "");
        return con;
    }

}
