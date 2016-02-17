<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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
			<c:forEach items="${clientes}" var="cliente" varStatus="loopStatus">
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