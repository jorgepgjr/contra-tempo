<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<link href="../../../bootstrap/css/bootstrap.min.css" rel="stylesheet" />
<link rel="stylesheet"
	href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.10.0/bootstrap-table.min.css">
<link href="../../../css/home.css" rel="stylesheet" />

<div class="row well">
	<div id="detalhe-professor">
	</div>
</div>

<div class="row well">
	<div class="col-sm-12">
		<div class="form-group">
			<form class="navbar-form" role="search" id="search-form">
				<div class="input-group">
					<input type="text" name="search" id="search" tabindex="1"
						class="form-control"
						placeholder="Nome do Professor..." value="">
					<span class="input-group-addon"> <span
						class="glyphicon glyphicon-search"></span>
					</span>
				</div>
			</form>
		</div>
		<div class="col-sm-12">
			<div class="input-group" id="tabela-professores">
			<jsp:include page="professor-tabela.jsp" />
			</div>
		</div>
	</div>
</div>
<script type="text/javascript"
	src="https://rawgit.com/wenzhixin/bootstrap-table/master/dist/bootstrap-table.min.js"></script>
	<script type="text/javascript" src="../../../js/professor/professores.js"></script>