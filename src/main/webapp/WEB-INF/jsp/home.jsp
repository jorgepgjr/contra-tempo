<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Studio Contra-Tempo Dança e Bem estar</title>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />
<link href="bootstrap/css/bootstrap-select.min.css" rel="stylesheet" />
<link href="css/home.css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery-2.2.0.min.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="bootstrap/js/bootstrap-select.min.js"></script>
</head>
<jsp:useBean id="now" class="java.util.Date" />
<body>
	<nav class="navbar navbar-default navbar-fixed-top" id="navigation">
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
					<li class="active" id="menu-aluno"><a href="aluno">Aluno</a></li>
					<li id="menu-turma"><a href="turma">Turma</a></li>
					<li id="menu-professor"><a href="#">Professor</a></li>
					<li id="menu-evento"><a href="#">Evento</a></li>
					<li id="menu-relatorio"><a href="#">Relatório</a></li>
					<li id="menu-about"><a href="about">About</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<div class="container" id="panel-body">
		<form:form id="register-form" action="cliente" method="POST"
			role="form" style="display: block;" modelAttribute="cliente">
			<div class="row">
				<div class="col-sm-4 well">
					<div class="well well-sm">
						<strong><span class="glyphicon glyphicon-asterisk"></span>Campos
							Obrigatório</strong>
					</div>
					<div class="form-group">
						<label for="nome">Nome</label>
						<div class="input-group">
							<input type="text" name="nome" id="nome" tabindex="1"
								class="form-control" placeholder="Nome" value="" required>
							<span class="input-group-addon"> <span
								class="glyphicon glyphicon-asterisk"></span>
							</span>
						</div>
					</div>
					<div class="form-group">
						<div class="input-group">
							<input type="tel" name="telefone" id="telefone" tabindex="1"
								class="form-control" placeholder="Telefone" value="" required>
							<span class="input-group-addon"> <span
								class="glyphicon glyphicon-asterisk"></span>
							</span>
						</div>
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
						<input type="text" name="profissao" id="profissao" tabindex="1"
							class="form-control" placeholder="Profissão" value="">
					</div>
					<div class="form-group">
						<input type="text" name="comoConheceu" id="comoConheceu"
							tabindex="1" class="form-control"
							placeholder="Como Nos Conheceu?" value="">
					</div>
					<div class="form-group">

						<input type="date" name="dataNasc" id="dataNasc" tabindex="1"
							class="form-control" placeholder="dataNasc" value="">
					</div>
					<div class="form-group">
						<label for="sel1">Trumas</label> <select name="turmas"
							class="selectpicker" id="sel1" multiple title="Escolha as turmas">
							<c:forEach items="${turmas}" var="turma" varStatus="loopStatus">
								<option value="${turma.id}"><c:out
										value="${turma.nome}" /></option>
							</c:forEach>
						</select>
					</div>
					<!-- 					<div class="form-group"> -->
					<%-- 						<form:select multiple="true" path="modalidades" items="${modalidades}" itemLabel="nome" itemValue="id" /> --%>
					<!-- 					</div> -->
					<div class="form-group">
						<div class="row">
							<div class="col-sm-6 col-sm-offset-3">
								<input type="submit" name="register-submit" id="register-submit"
									tabindex="4" class="form-control btn btn-register"
									value="Salvar">
							</div>
						</div>
					</div>
				</div>
<!-- 				Aniversáriantes -->
				<div class="col-sm-3 well">
					<div class="input-group" id="tabela-alunos">
						<label>Aniversariantes do Mês de <fmt:formatDate
								pattern="MMMM" value="${now}" /></label>
						<c:forEach items="${aniversariantes}" var="aniversariante"
							varStatus="loopStatus">
							<li class="list-group-item"><img
								src="${aniversariante.fotoUrl}" class="img-rounded"
								alt="Cinque Terre" width="50" height="50"> <c:out
									value="${aniversariante.nome}" /> <fmt:formatDate
									pattern="dd/MM/yyy" value="${aniversariante.dataNasc.time}" />
							</li>
							<br />
						</c:forEach>
					</div>
				</div>
				<div class="col-sm-6 well">
					<label>Pagamentos em aberto</label>
					<div class="input-group" id="tabela-alunos">
						<jsp:include page="tabela-alunos.jsp" />
					</div>
				</div>
			</div>
		</form:form>
	</div>
</body>
<script type="text/javascript">
	$("#register-form").submit(function(event) {
		event.preventDefault();
		var formData = $("#register-form").serialize();
		$.ajax({
			type : "POST",
			url : "cliente",
			data : formData
		}).done(function(response) {
			carregaTela(response);
		});
	});
	function carregaTela(tela, id) {
		$("#panel-body").empty();
		$("#panel-body").html(tela);
		if (id != null) {
			$(".active").removeClass("active");
			$('#' + id).addClass("active");
		}
	}

	$("#menu-turma").click(function() {
		$.ajax({
			type : "GET",
			url : "turma",
			success : function(data) {
				carregaTela(data, 'menu-turma');
			}
		});
		return false; // stop the browser following the link
	});

	$("#menu-aluno").click(function() {
		$.ajax({
			type : "GET",
			url : "cliente",
			success : function(data) {
				carregaTela(data, 'menu-aluno');
			}
		});
		return false; // stop the browser following the link
	});

	$("#menu-turma").click(function() {
		$.ajax({
			type : "GET",
			url : "turma",
			success : function(data) {
				carregaTela(data, 'menu-turma');
			}
		});
		return false; // stop the browser following the link
	});
</script>
</html>