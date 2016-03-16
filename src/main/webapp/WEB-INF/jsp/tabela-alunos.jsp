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
						<c:forEach items="${clientes}" var="cliente"
							varStatus="loopStatus">
							<tr class="clickable-row" data-href='${cliente.matricula}'>
								<td><c:out value="${cliente.matricula}" /></td>
								<td><c:out value="${cliente.nome}" /></td>
								<td><img src="https://goo.gl/IweKcl" class="img-rounded"
									alt="Cinque Terre" width="50" height="50"></td>
								<td>
								<c:forEach items="${cliente.matriculas}" var="matricula" varStatus="loopStatus">
									<c:out value="${matricula.turma.nome}" /> |	Inc: <fmt:formatDate pattern="dd/MM/yyy" value="${matricula.dtInicio.time}" /> Fim: <fmt:formatDate pattern="dd/MM/yyy" value="${matricula.dtFim.time}" />									
									| <fmt:formatNumber value="${matricula.valor}" type="currency"/>
									<br/>
								</c:forEach>
								<td>
							</tr>
						</c:forEach>
					</tbody>
				</table>	
<script type="text/javascript" src="js/aluno-list.js"></script>