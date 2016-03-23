<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<table class="table table-striped" id="table-aluno">
	<thead>
		<tr>
			<th data-field="matricula">Matricula</th>
			<th data-field="nome">Nome</th>
			<th data-field="fotoUrl">Foto</th>
			<th data-field="turmas">Turmas</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${clientes}" var="cliente" varStatus="loopStatus">
			<tr class="" data-href='${cliente.id}'>
				<td><c:out value="${cliente.id}" /></td>
				<td><c:out value="${cliente.nome}" /></td>
				<td><img src="${cliente.fotoUrl}" class="img-rounded"
					alt="Sem Imagem" width="50" height="50"></td>
				<td><c:forEach items="${cliente.matriculas}" var="matricula"
						varStatus="loopStatus">
							<c:out value="${matricula.turma.nome}" /> |	Inc: <fmt:formatDate
								pattern="dd/MM/yyy" value="${matricula.dtInicio.time}" /> Fim: <fmt:formatDate
								pattern="dd/MM/yyy" value="${matricula.dtFim.time}" />									
									| <fmt:formatNumber value="${matricula.valor}" type="currency" />
						<c:if test="${!matricula.pago}">
							<input class="btn btn-pagar" type="submit" value="Pagar" id="${matricula.id}"/>
						</c:if>
						<c:if test="${!loopStatus.last}">
								<hr>
							</c:if>
					</c:forEach>
				<td>
			</tr>
		</c:forEach>
	</tbody>
</table>