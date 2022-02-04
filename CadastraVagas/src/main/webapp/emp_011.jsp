<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%-- Atraves dos imports esta pagina tem acesso aos metodos de vagas.java --%>
<%@ page import="CadastraVagas.vagas"%>
<%@ page import="java.text.DecimalFormat"%>

<%-- A captura é feita pelo request.getParameter, é criado um novo objeto
e os valores são colocados neste novo objeto, somente para apresentação,
e apos acionar o metodo GaravarVagas(), os dados são adicionados no banco de dados
 --%>
<%

DecimalFormat df = new DecimalFormat("#,##0.00");

String _desc = request.getParameter("desc"); 
String _reqOb = request.getParameter("reqOb"); 
String _reqDes = request.getParameter("reqDes");
Float _remuneracao = Float.parseFloat(request.getParameter("remuneracao"));
String _beneficio = request.getParameter("beneficio");
String _local = request.getParameter("local");

vagas Vagas = new vagas();

Vagas.setDesc_c(_desc);
Vagas.setReqOb_c(_reqOb);
Vagas.setReqDes_c(_reqDes);
Vagas.setBeneficio_c(_beneficio);
Vagas.setRemuneracao_c(_remuneracao);
Vagas.setLocal_c(_local);

Vagas.GravarVagas();
%> 

<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastro de Vagas</title>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
        integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

</head>

<body>

    <header>
        <div class="container" >
            <div class="row">
                <div class="col-md-12 col-sm-12 text-center mt-3 mb-3">
                    <span>
                        <h3>Sistema de cadastro de vagas</h3>
                    </span>
                </div>
                <div class="col-md-12 col-sm">
                    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                        <a class="navbar-brand" href="index.jsp">Home</a>
                        <button class="navbar-toggler" type="button" data-toggle="collapse"
                            data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                            aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>

                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav mr-auto">
                                <li class="nav-item active">
                                    <a class="nav-link" href="emp_010.jsp">Cadastrar</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="emp_020.jsp">Alteração/Exclusãoo</a>
                                </li>
                                <li class="nav-item dropdown">
                                    <form method="post" action="emp_030.jsp">
		                              		<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
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
        <div class="text-center mt-3 border border-black">
            <h4>Sistema de controle de vagas</h4>
            <h5>Inclusão</h5>

            <div class="container text-center border border-black">
                <div class="row justify-content-center">
                    <div class="col-md-5 col-sm-12 b">
                        <div class="mt-3">
                        
                        	<%-- O form com method get, ira receber as informações --%>
                            <form action="emp_011.jsp" method="get">
    
    
                                <div class="row mb-3">
                                    <div class="col-md-6">
                                        <span><strong>Descrição</strong></span>
                                    </div>
                                    <div class="col-md-6">
                                        <span class="text-primary"><strong><%=_desc%></strong></span>
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <div class="col-md-6">
                                        <span><strong>Requisitos Obrigatórios:</strong></span>
                                    </div>
                                    <div class="col-md-6">
                                        <span class="text-primary"><strong><%=_reqOb%></strong></span>
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <div class="col-md-6">
                                        <span><strong>Requisitos Desejáveis:</strong></span>
                                    </div>
                                    <div class="col-md-6">
                                        <span class="text-primary"><strong><%=_reqDes%></strong></span>
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <div class="col-md-6">
                                        <span><strong>Remuneração:</strong><span>
                                    </div>
                                    <div class="col-md-6">
                                        <span class="text-primary"><strong><%=df.format(_remuneracao)%></strong></span>
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <div class="col-md-6">
                                        <span><strong>Benefícios:</strong><span>
                                    </div>
                                    <div class="col-md-6">
                                        <span class="text-primary"><strong><%=_beneficio%></strong></span>
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <div class="col-md-6">
                                        <span><strong>Local de Trabalho:</strong><span>
                                    </div>
                                    <div class="col-md-6">
                                        <span class="text-primary"><strong><%=_local%></strong></span>
                                    </div>
                                </div>
                                
                                <div class="row mb-3">
                                    <div class="col-md-12">
                                        <span class="text-success "><strong>Vaga adicionada com sucesso!!!</strong><span>
                                    </div>
                                </div>

                                <div class="text-center">
                                	<a class="btn btn-outline-dark" href="emp_010.jsp">Voltar</a>                                
                                </div>
    
                                
                            </form>
                        </div>
                    </div>
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
        integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
        crossorigin="anonymous"></script>
</body>

</html>