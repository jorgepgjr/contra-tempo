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
				<!-- 				Aniversariantes -->
				<div class="col-sm-4 well">
						<div class="input-group" id="tabela-alunos">
							<label>Aniversariantes do Mês de <fmt:formatDate
									pattern="MMMM" value="${now}" /></label>
							<ul class="list-group">
								<c:forEach items="${aniversariantes}" var="aniversariante"
									varStatus="loopStatus">
									<li class="list-group-item"><img
										src="${aniversariante.fotoUrl}" class="img-rounded"
										alt="Imagem não encontrada" width="50" height="50"> <c:out
											value="${aniversariante.nome}" /> <fmt:formatDate
											pattern="dd/MM/yyy" value="${aniversariante.dataNasc.time}" />
									</li>
								</c:forEach>
							</ul>
						</div>
				</div>
				<div class="col-sm-4">
					<jsp:include page="aluno/aluno-cadastro.jsp" />
				</div>
<!-- 				Programação do dia -->
				<div class="col-sm-4">
					<div class="well">
						<label>Aulas de Hoje</label>
						<c:forEach items="${turmasDoDia}" var="turma"
									varStatus="loopStatus">
									<li class="list-group-item">
									<c:out value="${turma.nome}" /> - <fmt:formatDate pattern="HH:mm" value="${turma.horario.time}" /> | <c:out value="${turma.professor.nome}" /> - <c:out value="${turma.sala}" />  
									</li>
								</c:forEach>						
					</div>
				</div>
				<div class="col-sm-6">
					<div class="well">
						<label>Pagamentos em aberto</label>
						<div class="input-group" id="tabela-alunos">
							<jsp:include page="tabela-alunos.jsp" />
						</div>
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