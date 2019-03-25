package connection;

import java.sql.Connection;
import java.sql.SQLException;

public class TestConnection {

	public static void main(String[] args) {
		Connection con = new ConnectionFactory().getConnection();
		System.out.println("Conectou ao Banco: " + con);
		
		try {
			con.close();
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
