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
					<li id="menu-professor"><a href="professor">Professor</a></li>
					<li id="menu-evento"><a href="#">Evento</a></li>
					<li id="menu-relatorio"><a href="#">Relatório</a></li>
					<li id="menu-about"><a href="#">About</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<div class="container" id="panel-body">
		<div class="row">
<!-- 			<div class="alert alert-success"> -->
<!-- 				<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a> -->
<!-- 				<strong>Success!</strong> Indicates a successful or positive action. -->
<!-- 			</div> -->
			<div class="col-sm-8">
				<jsp:include page="aluno/aluno-cadastro.jsp" />
			</div>
			<!-- 				Aniversariantes -->
			<div class="col-sm-4 well">
				<h3 class="text-center">
				Aniversariantes da Semana
<!-- 					Aniversariantes do Mês de -->
<%-- 					<fmt:formatDate pattern="MMMM" value="${now}" /> --%>
				</h3>
				<div class="input-group" id="tabela-alunos">
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
		</div>

		<div class="row">
			<div class="col-sm-12">
				<div class="well">
					<h3 class="text-center">Pagamentos em Aberto</h3>
					<div class="input-group" id="tabela-alunos">
						<jsp:include page="home/home-matriculas.jsp" />
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript" src="js/home.js"></script>
</html>