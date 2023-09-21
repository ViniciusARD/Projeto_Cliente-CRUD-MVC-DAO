package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Cliente;
import util.Conexao;

/**
 * Classe responsável por realizar operações de acesso a dados relacionadas aos clientes.
 */
public class ClienteDAO {
    
    /**
    * Cadastra um novo cliente no banco de dados.
    */
    public void cadastrar(Cliente c) throws ClassNotFoundException, SQLException {
        Connection con = Conexao.getConexao();
        PreparedStatement comando = con.prepareStatement("INSERT INTO cliente (cpf, nome, idade, sexo, endereco, telefone, email, profissao, renda, estado_civil, nivel_educacional) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
        comando.setString(1, c.getCpf());
        comando.setString(2, c.getNome());
        comando.setInt(3, c.getIdade());
        comando.setString(4, c.getSexo());
        comando.setString(5, c.getEndereco());
        comando.setString(6, c.getTelefone());
        comando.setString(7, c.getEmail());
        comando.setString(8, c.getProfissao());
        comando.setDouble(9, c.getRenda());
        comando.setString(10, c.getEstadoCivil());
        comando.setString(11, c.getNivelEducacional());
        comando.execute();
        con.close();
    }
    
    /**
    * Deleta um cliente do banco de dados.
    */
    public void deletar(Cliente c) throws ClassNotFoundException, SQLException {
        Connection con = Conexao.getConexao();
        PreparedStatement comando = con.prepareStatement("delete from cliente where id = ?");
        comando.setInt(1, c.getId());
        comando.execute();
        con.close();
    }
    
    /**
    * Atualiza os dados de um cliente no banco de dados.
    */
    public void atualizar(Cliente c) throws ClassNotFoundException, SQLException {
        Connection con = Conexao.getConexao();
        PreparedStatement comando = con.prepareStatement("update cliente set cpf = ?, nome = ?, idade = ?, sexo = ?, endereco = ?, telefone = ?, email = ?, profissao = ?, renda = ?, estado_civil = ?, nivel_educacional = ? where id = ?");
        comando.setString(1, c.getCpf());
        comando.setString(2, c.getNome());
        comando.setInt(3, c.getIdade());
        comando.setString(4, c.getSexo());
        comando.setString(5, c.getEndereco());
        comando.setString(6, c.getTelefone());
        comando.setString(7, c.getEmail());
        comando.setString(8, c.getProfissao());
        comando.setDouble(9, c.getRenda());
        comando.setString(10, c.getEstadoCivil());
        comando.setString(11, c.getNivelEducacional());
        comando.setInt(12, c.getId());
        comando.execute();
        con.close();
    }
    
    /**
    * Consulta um cliente pelo seu ID no banco de dados.
    */
    public Cliente consultarById(Cliente c) throws ClassNotFoundException, SQLException {
        Connection con = Conexao.getConexao();
        PreparedStatement comando = con.prepareStatement("select * from cliente where id = ?");
        comando.setInt(1, c.getId());
        ResultSet rs = comando.executeQuery();
        Cliente cli = new Cliente();
        if (rs.next()){
            cli.setId(rs.getInt("id"));
            cli.setCpf(rs.getString("cpf"));
            cli.setNome(rs.getString("nome"));
            cli.setIdade(rs.getInt("idade"));
            cli.setSexo(rs.getString("sexo"));
            cli.setEndereco(rs.getString("endereco"));
            cli.setTelefone(rs.getString("telefone"));
            cli.setEmail(rs.getString("email"));
            cli.setProfissao(rs.getString("profissao"));
            cli.setRenda(rs.getDouble("renda"));
            cli.setEstadoCivil(rs.getString("estado_civil"));
            cli.setNivelEducacional(rs.getString("nivel_educacional"));
        }        
        return cli;
    }
    
    /**
    * Consulta todos os clientes cadastrados no banco de dados.
    */
    public List<Cliente> consultarTodos() throws ClassNotFoundException, SQLException {
        Connection con = Conexao.getConexao();
        PreparedStatement comando = con.prepareStatement("select * from cliente");
        ResultSet rs = comando.executeQuery();
        
        List<Cliente> lcli = new ArrayList<Cliente>();
        while(rs.next()){
            Cliente cli = new Cliente();
            cli.setId(rs.getInt("id"));
            cli.setCpf(rs.getString("cpf"));
            cli.setNome(rs.getString("nome"));
            cli.setIdade(rs.getInt("idade"));
            cli.setSexo(rs.getString("sexo"));
            cli.setEndereco(rs.getString("endereco"));
            cli.setTelefone(rs.getString("telefone"));
            cli.setEmail(rs.getString("email"));
            cli.setProfissao(rs.getString("profissao"));
            cli.setRenda(rs.getDouble("renda"));
            cli.setEstadoCivil(rs.getString("estado_civil"));
            cli.setNivelEducacional(rs.getString("nivel_educacional"));
            lcli.add(cli);
        }        
        return lcli;
    }
    
}
