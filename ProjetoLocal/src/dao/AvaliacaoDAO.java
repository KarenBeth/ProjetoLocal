package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import connection.ConnectionFactory;
import model.Avaliacao;

public class AvaliacaoDAO {

	public Avaliacao loadAvaliacao(int id) {
		Avaliacao avaliacao = new Avaliacao();
		Connection conn = new ConnectionFactory().getConnection();
		
		String sqlComand = "SELECT nota, dt_avaliacao, comentario FROM avaliacao WHERE avaliacao.id = ?";
		
		try(PreparedStatement stm = conn.prepareStatement(sqlComand)){
			
			stm.setInt(1,id);
			ResultSet rs = stm.executeQuery();
			
			if(rs.next()) {
				avaliacao.setNota(rs.getDouble("Nota"));
				avaliacao.setDataAvaliacao(rs.getDate("dt_avaliacao"));
				avaliacao.setComentarios(rs.getString("Comentario"));
			} 
		
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return avaliacao;
	}
}
