package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import connection.ConnectionFactory;
import model.Professor;
import model.Usuario;

public class ProfessorDAO extends UsuarioDAO{

	/**
     * CRUD: Insere professor
     * @param conn: Connection
     */
	public void create(Professor professor) {
		Connection conn = new ConnectionFactory().getConnection();
		
		Usuario usuario = createUsuario(professor);
		
		String sqlComand = "INSERT INTO Professor (professor_id, administrador, matricula) VALUES (?, ?, ?)";
		
		try(PreparedStatement stm = conn.prepareStatement(sqlComand)){
			System.out.println(usuario.getId());
			stm.setInt(1, usuario.getId());
			stm.setInt(2, professor.getAdministrador());
			stm.setString(3, professor.getMatricula());
			
			stm.executeUpdate();
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	/**
     * CRUD: Carrega dados do professor
     * @param conn: Connection
     */
	
	public Professor load(Professor professor) {
		Connection conn = new ConnectionFactory().getConnection();
		
		String sqlComand = "SELECT professor.administrador, professor.matricula, usuario.id, usuario.nome, usuario.email, usuario.senha " + 
		           			"FROM Aluno as aluno " + 
		           			"INNER JOIN Usuario as usuario ON usuario.Id = aluno.aluno_id " + 
		           			"WHERE usuario.email = ?";
		
		try(PreparedStatement stm = conn.prepareStatement(sqlComand)){
			
			stm.setString(1, professor.getEmail());
			ResultSet rs = stm.executeQuery();
			
            if(rs.next()) {
            	professor.setId(rs.getInt("usuario.id"));
            	professor.setNome(rs.getString("usuario.nome"));
            	professor.setEmail(rs.getString("usuario.email"));
            	professor.setSenha(rs.getString("usuario.senha"));
            	professor.setAdministrador(rs.getInt("professor.administrador"));
            	professor.setMatricula(rs.getString("professor.matricula"));
            }
            
		}catch (SQLException e) {
			e.printStackTrace();
		}
		
		return professor;
	}
	 
	
	/*
	public Professor load(String email) {
		Professor professor = new Professor();
		Connection conn = new ConnectionFactory().getConnection();
		
		String sqlComand = "SELECT professor.administrador, professor.matricula, usuario.id, usuario.nome, usuario.email, usuario.senha " + 
		           			"FROM Aluno as aluno " + 
		           			"INNER JOIN Usuario as usuario ON usuario.Id = professor.professor_id " + 
		           			"WHERE usuario.email = ?";
		
		try(PreparedStatement stm = conn.prepareStatement(sqlComand)){
			
			stm.setString(1, professor.getEmail());
			ResultSet rs = stm.executeQuery();
			
            if(rs.next()) {
            	professor.setId(rs.getInt("usuario.id"));
            	professor.setNome(rs.getString("usuario.nome"));
            	professor.setEmail(rs.getString("usuario.email"));
            	professor.setSenha(rs.getString("usuario.senha"));
            	professor.setAdministrador(rs.getInt("professor.administrador"));
            	professor.setMatricula(rs.getString("professor.matricula"));
            }
            
		}catch (SQLException e) {
			e.printStackTrace();
		}
		
		return professor;
	}
	*/
	
	/**
     * CRUD: Atualiza dados do professor
     * @param conn: Connection
     */
	public void update(Professor professor) {
		Connection conn = new ConnectionFactory().getConnection();
		
		//Atualiza email e senha
		updateUsuario(professor);
		
		String sqlComand = "UPDATE Aluno SET administrador = ?, matricula = ? WHERE aluno_id = ?";
		
		try(PreparedStatement stm = conn.prepareStatement(sqlComand)){
			stm.setInt(1, professor.getAdministrador());
			stm.setString(2, professor.getMatricula());
			stm.setInt(2, professor.getId());
			
			stm.executeUpdate();            
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	/**
     * CRUD: Deleta professor
     * @param conn: Connection
     */
	
	public void delete(Professor professor) {
		Connection conn = new ConnectionFactory().getConnection();
		
		String sqlComand = "DELETE FROM Professor WHERE aluno_id = ?";
		try(PreparedStatement stm = conn.prepareStatement(sqlComand, Statement.RETURN_GENERATED_KEYS)){
			stm.setInt(1, professor.getId());
			stm.executeUpdate();
		}catch (SQLException e) {
			e.printStackTrace();
		}
		
		deleteUsuario(professor);
	}
	
}
