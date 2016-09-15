<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<table class="table table-striped" id="table-professor">
	<thead>
		<tr>
			<th data-field="fotoUrl">Foto</th>
			<th data-field="nome">Nome</th>
			<th data-field="telefone">Telefone</th>
			<th data-field="ativo">Ativo</th>
			<th data-field="turmas">Turmas</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${professores}" var="professor"
			varStatus="loopStatus">
			<tr class="clickable-row" data-href='${professor.id}'>
				<td><img src="${professor.fotoUrl}" class="img-rounded"
					alt="Sem Imagem" width="50" height="50"></td>
				<td><c:out value="${professor.nome}" /></td>
				<td>${professor.telefone}/ ${professor.telefone2}</td>
				<c:choose>
					<c:when test="${professor.ativo}">
						<td><span class="glyphicon glyphicon-ok"></span></td>
					</c:when>
					<c:otherwise>
						<td><span class="glyphicon glyphicon-remove"></span></td>
					</c:otherwise>
				</c:choose>
				<td>sem turmas <%-- 				<c:forEach items="${professor.matriculas}" var="matricula" --%>
					<%-- 						varStatus="loopStatus"> --%> <%-- 						<c:out value="${matricula.turma.nome}" /> |	Inc: <fmt:formatDate --%>
					<%-- 							pattern="dd/MM/yyy" value="${matricula.dtInicio.time}" /> Fim: <fmt:formatDate --%>
					<%-- 							pattern="dd/MM/yyy" value="${matricula.dtFim.time}" />									 --%>
					<%-- 									| <fmt:formatNumber value="${matricula.valor}" type="currency" /> --%>
					<%-- 						<c:if test="${!loopStatus.last}"> --%> <!-- 							<hr> -->
					<%-- 						</c:if> --%> <%-- 					</c:forEach> --%>
				</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<script type="text/javascript">
	$(".clickable-row").click(function() {
		$("#detalhe-professor").slideUp(300);
		$.ajax({
			type : "GET",
			url : "professor/" + $(this).data("href"),
			success : function(data) {
				$("#detalhe-professor").html(data);
				$("#detalhe-professor").slideDown(300);

			}
		});
	});
</script>