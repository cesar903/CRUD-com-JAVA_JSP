package CadastraVagas;

import java.sql.Connection;
import java.sql.DriverManager;

//Faz a conexão com o banco de dados
public class ConectaBD {
		public String usuario="root";
		public String senha="admin";
		
		public Connection Conectar() throws Exception{
			Class.forName("com.mysql.cj.jdbc.Driver");
			String url = "jdbc:mysql://localhost/bdvagas";
			java.sql.Connection conn = DriverManager.getConnection(url, usuario, senha);
			return conn;
		}
}
