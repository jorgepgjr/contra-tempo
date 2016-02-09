<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<title>home</title>

<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />
<link href="css/login.css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery-1.11.3.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>

</head>
<body>
	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="home">Super sistema</a>
			</div>
			<div>
				<ul class="nav navbar-nav">
					<li><a href="home">Inclusão</a></li>
					<li class="active"><a href="lista">Lista</a></li>
					<li><a href="about">About</a></li>
					<li><a href="http://www.pudim.com.br">Pudim</a></li>
				</ul>
			</div>
		</div>
	</nav>
	 <h1>Itens Salvos No Banco</h1>
	 <h4>Numero de registros: ${registros.size()} </h4>
	 <form class="form-horizontal" role="form" action="limpar">
	 	<button type="submit"  class="btn btn-primary">Limpar dados</button>
	 </form>
	 	 
	 <spring:message var="registros"></spring:message>
	 <ul class="list-group">
		 <c:forEach items="${registros}" var="registro" varStatus="loopStatus">
			  <li class="list-group-item">
			  	Nome:  <c:out value="${registro.username}"/>   Email:  <c:out value="${registro.email}"/>
			  </li>
		 </c:forEach>
	</ul>
</body>
</html>