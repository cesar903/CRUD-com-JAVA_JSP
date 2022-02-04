<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.DecimalFormat"%>
<%@ page import="CadastraVagas.ConectaBD" %>
<%

int l = Integer.parseInt(request.getParameter("lista"));
String sql;
String titulo;
if(l == 1)
{
sql = "select * from vaga where aberta = 1";
titulo = "Lista de vagas de emprego em aberto";
}
else
{
if(l == 2)
{
sql = "select * from vaga where aberta = 0";
titulo = "Lista de vagas de emprego encerradas";
}
else
{
sql = "select * from vaga";
titulo = "Lista geral de vagas de emprego";
}
}

try {
ConectaBD cbd = new ConectaBD();
Connection conn = cbd.Conectar();
Statement st = conn.createStatement();
ResultSet rs = st.executeQuery(sql);
DecimalFormat df = new DecimalFormat("#,##0.00");

%>

<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
        integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

</head>

<body>

    <header>
        <div class="container">
            <div class="row">
                <div class="col-md-12 col-sm-12 text-center mt-3 mb-3">
                    <span><h3>Sistema de cadastro de vagas</h3></span>
                </div>
                <div class="col-md-12 col-sm">
                    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                        <a class="navbar-brand active" href="index.jsp">Home</a>
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                          <span class="navbar-toggler-icon"></span>
                        </button>
                      
                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                          <ul class="navbar-nav mr-auto">
                            <li class="nav-item">
                              <a class="nav-link" href="emp_010.jsp">Cadastrar</a>
                            </li>
                            <li class="nav-item">
                              <a class="nav-link " href="emp_020.jsp">Alteração/Exclusão</a>
                            </li>
                            <li class="nav-item dropdown">
                              <form method="post" action="emp_030.jsp">
		                              		<a class="nav-link dropdown-toggle active" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			                                Listar Vagas
			                                </a>
			               
			                              <div class="dropdown-menu" aria-labelledby="navbarDropdown">
			                                <button type="submit" class="dropdown-item" name="lista" value="1" method="post">Listar vagas abertas</button>
			                                <button type="submit"  class="dropdown-item" name="lista" value="2" method="post">Listar vagas encerradas</button>
			                                <button type="submit"  class="dropdown-item" name="lista" value="3" method="post">Lista geral de vagas</button>
			                              </div>
		                              </form>
                            </li>
                            
                          </ul>
                          <ul class="navbar-nav ml-auto">
                              <li class="nav-item">
                                <div class=" my-2 my-lg-0">
                                    <a class="nav-link" href="#">Login</a>
                                </li>
                              </li>
                          </ul>
                        </div>
                      </nav>
                </div>
            </div>
            
        </div>
    </header>
    
    <main>
      <div class="container">
        <div class="row">
          <div class="col-md-12 text-center mt-3">
            <h4>Sistema de controle de vagas</h4>
            <h5><%=titulo %></h5>            
          </div>
          <div class="col-md-12 mt-3">
            <table class="table">
              <thead>
                <tr>
                  <th scope="col">Id Vaga</th>
                  <th scope="col">Descricao</th>
                  <th scope="col">Requisitos Obrigatorios</th>
                  <th scope="col">Requisitos Desejaveis</th>
                  <th scope="col">Remuneração</th>
                  <th scope="col">Aberta</th>
                  <th scope="col">Beneficios</th>
                  <th scope="col">Local de Trabalho</th>
                  <th scope="col">Editar</th>
                  <th scope="col">Excluir</th>
                  
                  <%
					int alt = 0;
					while(rs.next())
					{
					if(alt == 0) {
				%>
				
				<%alt = 1;}
				else
				{
				%>
				<%alt = 0;}%>
                </tr>
              </thead>
             
                  
                  <form method="post" id="formulario" name="formulario" action="">
                  
                  	  <td><input type="hidden" name="idVaga" value="<%=rs.getInt("idVaga")%>"><%=rs.getInt("idVaga")%></td>
	                  <td><input type="hidden" name="desc" value="<%=rs.getString("descricao")%>"><%=rs.getString("descricao")%></td>
	                  <td><input type="hidden" name="reqOb" value="<%=rs.getString("req_obrigatorio")%>"><%=rs.getString("req_obrigatorio")%></td>
	                  <td><input type="hidden" name="reqDes" value="<%=rs.getString("req_desejavel")%>"><%=rs.getString("req_desejavel")%></td>
	                  <td><input type="hidden" name="remuneracao" value="<%=rs.getFloat("remuneracao")%>"><%=df.format(rs.getFloat("remuneracao"))%></td>
	                  <td><input type="hidden" name="aberta" value="<%=rs.getInt("aberta")%>"><%=rs.getInt("aberta")%></td>
	                  <td><input type="hidden" name="beneficio" value="<%=rs.getString("beneficio")%>"><%=rs.getString("beneficio")%></td>
	                  <td><input type="hidden" name="local_" value="<%=rs.getString("local_")%>"><%=rs.getString("local_")%></td>
	                  <td><input type="submit" class="btn btn-outline-success" formaction="emp_021.jsp" onclick="Editar()" value="Editar"></td>
	                  <td><input type="submit" class="btn btn-outline-danger" formaction="emp_022.jsp"  onclick="Apaga()" value="Excluir"></td>
	                 
	                  <script>
	                  
	                  	function Apaga(){
	                  		var resp = confirm("Deseja excluir esta vaga?");
	                  		
	                  		if(resp == true){
	                  		    document.getElementById("formulario").action = "emp_022.jsp";

	                  		}else{
	                  			event.preventDefault ();
	                  		}
	                  	}
	                  	
	                  	function Editar(){

	                  		var resp = confirm("Deseja Editar esta vaga?");
	   
	                  		if(resp == true){
	                  			document.getElementById("formulario").action = "emp_021.jsp";


	                  		}else{
	                  			event.preventDefault ();
	                  		}
	                  	}
	                 
	                  </script>
	                  
                  </form>
                  
                </tr>
                
                <%
				} // fecha while
				rs.close();
				st.close();
				conn.close();
				} // fecha try
				catch(Exception e)
				{
				out.println("Ocorreu uma exceção - " + e.getMessage());
				}
				%>
                
                
                
              </tbody>

            </table>
          </div>
        </div>
      </div>
      
    </main>
    
    
    
    




    <!-- Este arquivo javascript Ã© opcional-->
    <!-- jQuery first, then Popper.js, then Bootstrap JS tambem sÃ£o opcionais-->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
        integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
        integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</body>
</html>