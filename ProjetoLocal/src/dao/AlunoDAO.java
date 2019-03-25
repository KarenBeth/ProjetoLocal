package dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import connection.ConnectionFactory;
import model.Aluno;
import model.Usuario;

public class AlunoDAO extends UsuarioDAO {
	
	/**
     * CRUD: Insere aluno
     * @param conn: Connection
     */
	public void create(Aluno aluno) {
		Connection conn = new ConnectionFactory().getConnection();
		
		Usuario usuario = createUsuario(aluno);
		
		String sqlComand = "INSERT INTO Aluno (aluno_id, ra) VALUES (?, ?)";
		
		try(PreparedStatement stm = conn.prepareStatement(sqlComand)){
			System.out.println(usuario.getId());
			stm.setInt(1, usuario.getId());
			stm.setString(2, aluno.getRa());
			
			stm.executeUpdate();
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	/**
     * CRUD: Carrega dados do aluno
     * @param conn: Connection
     */
	public Aluno load(Aluno aluno) {
		Connection conn = new ConnectionFactory().getConnection();
		
		String sqlComand = "SELECT aluno.ra, usuario.id, usuario.nome, usuario.email, usuario.senha " + 
		           			"FROM Aluno as aluno " + 
		           			"INNER JOIN Usuario as usuario ON usuario.Id = aluno.aluno_id " + 
		           			"WHERE usuario.email = ?";
		
		try(PreparedStatement stm = conn.prepareStatement(sqlComand)){
			
			stm.setString(1, aluno.getEmail());
			ResultSet rs = stm.executeQuery();
			
            if(rs.next()) {
            	aluno.setId(rs.getInt("usuario.id"));
            	aluno.setNome(rs.getString("usuario.nome"));
            	aluno.setEmail(rs.getString("usuario.email"));
            	aluno.setSenha(rs.getString("usuario.senha"));
            	aluno.setRa(rs.getString("aluno.ra"));
            }
            
		}catch (SQLException e) {
			e.printStackTrace();
		}
		
		return aluno;
	}
	
	/**
     * CRUD: Atualiza dados do aluno
     * @param conn: Connection
     */
	public void update(Aluno aluno) {
		Connection conn = new ConnectionFactory().getConnection();
		
		//Atualiza email e senha
		updateUsuario(aluno);
		
		String sqlComand = "UPDATE Aluno SET ra = ? WHERE aluno_id = ?";
		
		try(PreparedStatement stm = conn.prepareStatement(sqlComand)){
			stm.setString(1, aluno.getRa());
			stm.setInt(2, aluno.getId());
			
			stm.executeUpdate();            
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	/**
     * CRUD: Deleta usuário
     * @param conn: Connection
     */
	public void delete(Aluno aluno) {
		Connection conn = new ConnectionFactory().getConnection();
		
		String sqlComand = "DELETE FROM Aluno WHERE aluno_id = ?";
		try(PreparedStatement stm = conn.prepareStatement(sqlComand, Statement.RETURN_GENERATED_KEYS)){
			stm.setInt(1, aluno.getId());
			stm.executeUpdate();
		}catch (SQLException e) {
			e.printStackTrace();
		}
		
		deleteUsuario(aluno);
	}

}
