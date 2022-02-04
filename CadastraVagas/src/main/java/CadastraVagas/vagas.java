package CadastraVagas;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Connection;

public class vagas {
	//Banco de dados Necessario para a criação da aplicação
	// create table vaga(
	// idVaga int primary key not null auto_increment,
	// aberta tinyint default 1 ,
	// descricao varchar(45) not null,
	// req_obrigatorio varchar(45) not null,
	// req_desejavel varchar(45),
	// remuneracao float not null,
	// beneficio varchar(45) not null,
	// local_ varchar(45) not null
	// )auto_increment=1000;

	
	//As variaveis são privadas para usuarios não terem acesso, então toda vez que for acessada criara um novo objeto
	private String desc_c;
	private String reqOb_c;
	private String reqDes_c;
	private double remuneracao_c;
	private String beneficio_c;
	private String local_c;
	private Integer idVaga_c;
	private Integer aberta_c;

	public Integer getIdVaga_c() {
		return idVaga_c;
	}

	public void setIdVaga_c(Integer idVaga_c) {
		this.idVaga_c = idVaga_c;
	}

	public Integer getAberta_c() {
		return aberta_c;
	}

	public void setAberta_c(Integer aberta_c) {
		this.aberta_c = aberta_c;
	}

	public String getDesc_c() {
		return desc_c;
	}

	public void setDesc_c(String desc_c) {
		this.desc_c = desc_c;
	}

	public String getReqOb_c() {
		return reqOb_c;
	}

	public void setReqOb_c(String reqOb_c) {
		this.reqOb_c = reqOb_c;
	}

	public String getReqDes_c() {
		return reqDes_c;
	}

	public void setReqDes_c(String reqDes_c) {
		this.reqDes_c = reqDes_c;
	}

	public double getRemuneracao_c() {
		return remuneracao_c;
	}

	public void setRemuneracao_c(double remuneracao_c) {
		this.remuneracao_c = remuneracao_c;
	}

	public String getBeneficio_c() {
		return beneficio_c;
	}

	public void setBeneficio_c(String beneficio_c) {
		this.beneficio_c = beneficio_c;
	}

	public String getLocal_c() {
		return local_c;
	}

	public void setLocal_c(String local_c) {
		this.local_c = local_c;
	}

	public class ConectaBd {
		public String usuario = "root";
		public String senha = "admin";

		public Connection Conectar() throws Exception {
			Class.forName("com.mysql.cj.jdbc.Driver");
			String url = "jdbc:mysql://localhost/bdvagas";
			java.sql.Connection conn = DriverManager.getConnection(url, usuario, senha);
			return conn;
		}

	}

	public void GravarVagas() {

		try {

			// conecta com BD
			ConectaBd cbd = new ConectaBd();
			Connection conn = cbd.Conectar();

			String Sql = "insert into "
					+ "vaga(descricao, req_obrigatorio, req_desejavel, remuneracao, beneficio, local_) "
					+ "values(?,?,?,?,?,?)";
			PreparedStatement comando = (PreparedStatement) conn.prepareStatement(Sql);
			// inclusão modo objeto PreparedStatement
			comando.setString(1, desc_c);
			comando.setString(2, reqOb_c);
			comando.setString(3, reqDes_c);
			comando.setDouble(4, remuneracao_c);
			comando.setString(5, beneficio_c);
			comando.setString(6, local_c);

			// Executa a conexão com o BD, faz o update, e depois fecha
			comando.execute();
			comando.close();
			conn.close();
		} catch (Exception e) {
			System.out.println("Erro na Gravação");
			System.out.println(e.getMessage());
		}

	}

	public void AlterarVagas() {
		try {
			// conecta com BD usando um novo objeto como conexão
			ConectaBD cbd = new ConectaBD();
			Connection conn = cbd.Conectar();
			
			String Sql = "update vaga set descricao = ?," + "req_obrigatorio = ?," + "req_desejavel = ?,"
					+ "remuneracao = ?," + "aberta = ?," + "beneficio = ?," + "local_ = ? "
					+ " where idVaga = ?";
			
			PreparedStatement comando = (PreparedStatement) conn.prepareStatement(Sql);
			comando.setString(1, desc_c);
			comando.setString(2, reqOb_c);
			comando.setString(3, reqDes_c);
			comando.setDouble(4, remuneracao_c);
			comando.setInt(5, aberta_c);
			comando.setString(6, beneficio_c);
			comando.setString(7, local_c);
			comando.setInt(8, idVaga_c);
			
			// Executa a conexão com o BD, faz o update, e depois fecha

			comando.execute();
			comando.close();
			conn.close();
		} catch (Exception e) {
			System.out.println("Erro na Alteracao");
			System.out.println(e.getMessage());
		}
	}

	public void ExcluirVagas() {
		try {

			// conecta com BD usando um novo objeto como conexão
			ConectaBd cbd = new ConectaBd();
			Connection conn = cbd.Conectar();

			String Sql = "delete from vaga where idVaga = " + idVaga_c;
			PreparedStatement comando = (PreparedStatement) conn.prepareStatement(Sql);

			// Executa a conexão com o BD, faz o update, e depois fecha
			comando.execute();
			comando.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("Erro na exclusão");
			System.out.println(e.getMessage());
		}

	}

}
