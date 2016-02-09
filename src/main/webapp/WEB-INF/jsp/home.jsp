<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Studio Contra-Tempo Dan�a e Bem estar</title>


<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.0.min.js"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>

<link href="css/home.css" rel="stylesheet" />
</head>
<body>
	<nav class="navbar navbar-default" id="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="home">Studio Contra-Tempo</a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
			<ul class="nav navbar-nav">
				<li class="active" id="menu-aluno"><a href="#">Aluno</a></li>
				<li id="menu-professor"><a href="#">Professor</a></li>
				<li id="menu-evento"><a href="#">Evento</a></li>
				<li id="menu-relatorio"><a href="#">Relat�rio</a></li>
				<li id="menu-about"><a href="about">About</a></li>
			</ul>
		</div>
		</div>
	</nav>
	<div class="panel-body" id="panel-body">
		<div class="row">
			<div class="col-lg-12">
				<form id="register-form" action="cliente" method="post" role="form"
					style="display: block;">
					<div class="form-group">
						<input type="text" name="nome" id="nome" tabindex="1"
							class="form-control" placeholder="Nome" value="">
					</div>
					<div class="form-group">
						<input type="email" name="email" id="email" tabindex="1"
							class="form-control" placeholder="E-mail" value="">
					</div>
					<div class="form-group">
						<input type="text" name="rg" id="rg" tabindex="1"
							class="form-control" placeholder="RG" value="">
					</div>
					<div class="form-group">
						<input type="text" name="endereco" id="endereco" tabindex="1"
							class="form-control" placeholder="Endereco" value="">
					</div>
					<div class="form-group">
						<input type="tel" name="telefone" id="telefone" tabindex="1"
							class="form-control" placeholder="Telefone" value="">
					</div>
					<div class="form-group">
						<input type="text" name="profissao" id="profissao" tabindex="1"
							class="form-control" placeholder="Profiss�o" value="">
					</div>
					<div class="form-group">
						<input type="text" name="comoConheceu" id="comoConheceu" tabindex="1"
							class="form-control" placeholder="Como Nos Conheceu?" value="">
					</div>
					<div class="form-group">
						<input type="date" name="dataNasc" id="dataNasc" tabindex="1"
							class="form-control" placeholder="dataNasc" value="">
					</div>

					<div class="form-group">
						<div class="row">
							<div class="col-sm-6 col-sm-offset-3">
								<input type="submit" name="register-submit" id="register-submit"
									tabindex="4" class="form-control btn btn-register"
									value="Salvar">
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>

<script type="text/javascript">	
</script>
</html>