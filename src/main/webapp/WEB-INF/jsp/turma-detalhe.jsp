<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />
<link href="bootstrap/css/bootstrap-select.min.css" rel="stylesheet" />
<link href="bootstrap/css/bootstrap-clockpicker.min.css"
	rel="stylesheet" />
<link href="css/home.css" rel="stylesheet" />

<div class="row well">
	<form action="">
		<div class="form-group col-sm-4">
			<label for="nome">Nome</label> <input type="text" name="nome"
				id="nome" tabindex="1" class="form-control" placeholder="Nome"
				value="${turma.nome}" required>
		</div>
		<div class="form-group col-sm-4">
			<label for="professor">Professor</label> <input type="text"
				name="professor" id="professor" tabindex="1" class="form-control"
				placeholder="Professor" value="${turma.professor.nome}" required>
		</div>
		<div class="form-group col-sm-4">
			<label for="modalidade">Modalidades</label>
			<ul id="modalidade">
				<c:if test="${turma.modalidades.size()==0}">		
		Sem Modalidades Cadastradas</c:if>
				<c:forEach items="${turma.modalidades}" var="modalidade"
					varStatus="loopStatus">
					<li class="list-group-item"><c:out value="${modalidade.nome}" />
					</li>
				</c:forEach>
			</ul>
		</div>
		<div class="form-group col-sm-4">
			<label for="nivel">Nível</label> <select name="nivel"
				class="form-group selectpicker" id="nivel" title="Nível">
				<option value="0">0 - Iniciantes</option>
				<option value="1">1 - Iniciados</option>
				<option value="2">2 - Intermediário</option>
			</select>
		</div>
		<div class="form-group col-sm-4">
			<label class="col-sm-4 control-label" for="dia">Horário:</label> <select
				name="dia" class="selectpicker col-sm-4" id="dia"
				title="Dia da Semana">
				<option value="2">Segunda</option>
				<option value="3">Terça</option>
				<option value="4">Quarta</option>
				<option value="5">Quinta</option>
				<option value="6">Sexta</option>
				<option value="7">Sábado</option>
				<option value="1">Domingo</option>
			</select>
			<div class="col-sm-4 input-group clockpicker" data-autoclose="true">
				<input type="text" class="form-control" value="19:00" name="horario">
				<span class="input-group-addon"> <span
					class="glyphicon glyphicon-time"></span>
				</span>
			</div>
		</div>
	</form>

</div>

<!-- 		Horário: -->
<%-- 		<fmt:formatDate pattern="EEEE" value="${turma.diaEHora.time}" /> --%>
<%-- 		<fmt:formatDate pattern="HH:mm" value="${turma.diaEHora.time}" /> --%>




<div class="row well">
	<div class="col-sm-12">
		<div class="input-group" id="tabela-alunos">
			<table class="table table-striped" id="table-aluno">
				<thead>
					<tr>
						<th data-field="matricula">Matricula</th>
						<th data-field="nome">Nome</th>
						<th data-field="telefone">Telefone</th>
						<th data-field="email">Email</th>
						<th data-field="inicio">Início</th>
						<th data-field="fim">Fim</th>
						<th data-field="pago">Pago</th>
						<th data-field="valor">Valor</th>
						<th data-field="fotoUrl">Foto</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${turma.matriculas}" var="matricula"
						varStatus="loopStatus">
						<tr>
							<td><c:out value="${matricula.cliente.id}" /></td>
							<td><c:out value="${matricula.cliente.nome}" /></td>
							<td><c:out value="${matricula.cliente.telefone}" /></td>
							<td><c:out value="${matricula.cliente.email}" /></td>
							<td><fmt:formatDate pattern="dd/MM/yyy"
									value="${matricula.dtInicio.time}" /></td>
							<td><fmt:formatDate pattern="dd/MM/yyy"
									value="${matricula.dtFim.time}" /></td>
							<c:choose>
								<c:when test="${matricula.pago}">
									<td><span class="glyphicon glyphicon-ok"></span></td>
								</c:when>
								<c:otherwise>
									<td><span class="glyphicon glyphicon-remove"></span></td>
								</c:otherwise>
							</c:choose>
							<td><c:out value="${matricula.valor}" /></td>
							<td><img src="${matricula.cliente.fotoUrl}" class="img-rounded"
								alt="Sem Imagem" width="50" height="50"></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>
<script type="text/javascript" src="js/turma/turma-detalhe.js"></script>