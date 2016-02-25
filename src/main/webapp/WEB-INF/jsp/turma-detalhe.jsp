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
</div>
