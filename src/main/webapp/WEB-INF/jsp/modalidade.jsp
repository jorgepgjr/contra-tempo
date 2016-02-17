<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />
	 <h1>Modalidades Salvos No Banco</h1>
	 <h4>Numero de modalidades: ${modalidades.size()} </h4>
	 <div class="row">
			<div class="col-lg-12">
				<form:form id="register-form" action="cliente" method="POST" role="form"
					style="display: block;" modelAttribute="cliente">
					<div class="form-group">
						<input type="text" name="nome" id="nome" tabindex="1"
							class="form-control" placeholder="Novo Estilo" value="">
					</div>
					<input type="submit" name="register-submit" id="register-submit"
									tabindex="4" class="form-control btn btn-register"
									value="Salvar">
				</form:form>
			</div>
		</div>
	 <form class="form-horizontal" role="form" action="limpar">
	 	<button type="submit"  class="btn btn-primary">Limpar dados</button>
	 </form>
	 	 
	 <spring:message var="modalidades"></spring:message>
	 <ul class="list-group">
		 <c:forEach items="${modalidades}" var="modalidade" varStatus="loopStatus">
			  <li class="list-group-item">
			  	<c:out value="${modalidade.nome}"/>
			  </li>
		 </c:forEach>
	</ul>