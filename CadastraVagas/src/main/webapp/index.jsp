<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
                              <a class="nav-link" href="emp_020.jsp">Alteração/Exclusão</a>
                            </li>
	                            <li class="nav-item dropdown" >
	                            
	                              
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
    <div class="container mt-3 ">
      <div class="row justify-content-center">
        <div class="col-md-9 border border-5 border-black">

          <h2 class="mt-3 mb-3">Como Funciona:</h2>

          <div class="mb-3">
            <strong><h3>Cadastro:</h3></strong>
            <p>
               O cadastro de uma nova vaga pode ser realizado atraves do guia  <a href="emp_010.jsp">Cadastrar</a>.
              O nosso sistema de cadastro conta com uma pagina auto explicativa que te guiara facilmente para o cadastro da nova vaga.
            </p>
          </div>

          <div class="mb-3">
            <strong ><h3>Alterar ou Excluir:</h3></strong>
            <p>
               Para fazer a alteração ou a exclusão de uma vaga já publicada  , basta ir na aba de<a href="emp_020.jsp"> Alteração e Exclusão</a>.
              Nesta aba, você sera guiado em uma plataforma auto explicativa para a edição ou exclusão do documento.
            </p>
          </div>

          <div class="mb-3">
            <strong><h3>Listar Vagas</h3></strong>
            <p>
               Caso queira listar as vagas já adicionadas, o usuario pode optar entre 3 categorias de pesquisa, são elas:
            <p>
              <ul>
                <li>
                  <a>Listar Vagas Abertas.</a> 
                </li>

                <li>
                  <a>Listar Vagas Encerradas.</a>
                </li>

                <li>
                  <a>Listar Todas as Vagas.</a>
                </li>
              </ul>
            </p>
              <ul>
            </p>
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
        integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</body>
</html>