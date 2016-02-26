<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />
<link rel="stylesheet"
	href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.10.0/bootstrap-table.min.css">
<link href="css/home.css" rel="stylesheet" />

<div class="row well">
	<div class="col-sm-12">
		<div class="form-group">
			<form class="navbar-form" role="search" id="search-form">
				<div class="input-group">
					<input type="text" name="search" id="search" tabindex="1"
						class="form-control"
						placeholder="Nome do Aluno ou Numero de matricula..." value="">
					<span class="input-group-addon"> <span
						class="glyphicon glyphicon-search"></span>
					</span>
				</div>
			</form>
		</div>
		<div class="col-sm-12">
			<div class="input-group" id="tabela-alunos">
				<table class="table table-striped" id="table-aluno">
					<thead>
						<tr>
							<th data-field="matricula">Matricula</th>
							<th data-field="nome">Nome</th>
							<th data-field="telefone">Telefone</th>
							<th data-field="email">Email</th>
							<th data-field="fotoUrl">Foto</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${clientes}" var="cliente"
							varStatus="loopStatus">
							<tr>
								<td><c:out value="${cliente.matricula}" /></td>
								<td><c:out value="${cliente.nome}" /></td>
								<td><c:out value="${cliente.telefone}" /></td>
								<td><c:out value="${cliente.email}" /></td>
								<td><img src="https://goo.gl/IweKcl" class="img-rounded"
									alt="Cinque Terre" width="50" height="50"></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript" src="js/aluno-list.js"></script>
<script type="text/javascript"
	src="https://rawgit.com/wenzhixin/bootstrap-table/master/dist/bootstrap-table.min.js"></script>