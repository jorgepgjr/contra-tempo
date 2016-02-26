<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />
<link href="bootstrap/css/bootstrap-select.min.css" rel="stylesheet" />
<link href="css/home.css" rel="stylesheet" />


<div class="row well">
		<div class="col-sm-4" >
			Nome:
			<c:out value="${turma.nome}"></c:out>
		</div>

		<div class="col-sm-4">
			Professor:
			<c:out value="${turma.professor.nome}"></c:out>
		</div>
		<div class="col-sm-4">
			Modalidades:
			<c:forEach items="${turma.modalidades}" var="modalidade" varStatus="loopStatus">
				<li class="list-group-item">
					<c:out value="${modalidade.nome}" />
				</li>
			</c:forEach>
		</div>
		<div class="col-sm-4">
			Nivel: <c:out value="${turma.nivel}"></c:out>			
		</div>
		<div class="col-sm-4">		
			Horário: <fmt:formatDate pattern="EEEE" value="${turma.diaEHora.time}" /> <fmt:formatDate pattern="HH:MM" value="${turma.diaEHora.time}" />			
		</div>
		<div class="col-sm-12">
			Alunos:
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
						<c:forEach items="${alunos}" var="cliente" varStatus="loopStatus">
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
