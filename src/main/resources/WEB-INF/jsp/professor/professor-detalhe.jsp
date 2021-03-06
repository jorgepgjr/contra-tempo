<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<link href="../../../bootstrap/css/bootstrap.min.css" rel="stylesheet" />
<link href="../../../css/home.css" rel="stylesheet" />
<form:form id="professor-detalhe-form" methodParam="PUT">
	<div class="row">
		<div class="form-group col-sm-4">
			<div>
				<img id="foto" src="${professorDetalhe.fotoUrl}" class="img-rounded"
					alt="Sem Foto" width="150" height="150">
			</div>
		</div>
		<div class="form-group col-sm-6 pre-scrollable">
<%-- 			<input type="hidden" value="${professorDetalhe.id}" id="matricula" /> --%>
<%-- 			<input type="hidden" value="${professorDetalhe.fotoUrl}" name="fotoUrl" /> --%>
<%-- 			<c:forEach items="${professorDetalhe.matriculas}" var="matricula" --%>
<%-- 				varStatus="loopStatus"> --%>
<%-- 				<c:out value="${matricula.turma.nome}" /> |	Inc: <fmt:formatDate --%>
<%-- 					pattern="dd/MM/yyy" value="${matricula.dtInicio.time}" /> Fim: <fmt:formatDate --%>
<%-- 					pattern="dd/MM/yyy" value="${matricula.dtFim.time}" />									 --%>
<%-- 									| <fmt:formatNumber value="${matricula.valor}" type="currency" /> --%>
<!-- 				<br /> -->
<%-- 			</c:forEach> --%>
		</div>
	</div>
	<div class="form-group col-sm-3">
		<label for="nome">Nome</label> <input type="text" name="nome"
			id="nome" tabindex="1" class="form-control" placeholder="Nome"
			value="${professorDetalhe.nome}" required>
	</div>

	<div class="form-group col-sm-3">
		<label for="telefone">Telefone</label> <input type="tel"
			name="telefone" id="telefone" tabindex="1" class="form-control"
			placeholder="Telefone" title="(99) 12345-1234"
			pattern="\([0-9]{2}\) [0-9]{4,6}-[0-9]{3,4}$"
			value="${professorDetalhe.telefone}" required>
	</div>
<!-- 	<div class="form-group col-sm-3"> -->
<!-- 		<label for="email">E-mail</label> <input type="email" name="email" -->
<!-- 			id="email" tabindex="1" class="form-control" placeholder="E-mail" -->
<%-- 			value="${professorDetalhe.email}"> --%>
<!-- 	</div> -->
	<div class="form-group col-sm-3">
		<label for="rg">RG</label> <input type="text" name="rg" id="rg"
			tabindex="1" class="form-control" placeholder="RG"
			value="${professorDetalhe.rg}">
	</div>
	<div class="form-group col-sm-3">
		<label for="cpf">CPF</label> <input type="text" name="cpf" id="cpf"
			tabindex="1" class="form-control" placeholder="CPF"
			value="${professorDetalhe.cpf}">
	</div>
	<div class="form-group col-sm-6">
		<label for="endereco">Endere�o</label> <input type="text"
			name="endereco" id="endereco" tabindex="1" class="form-control"
			placeholder="Endereco" value="${professorDetalhe.endereco}">
	</div>
	<div class="form-group col-sm-3">
		<label for="dadoBanco">Dados Banc�rios</label>
		<input type="text" name="banco" id="banco" tabindex="1" class="form-control"
		placeholder="Banco" value="${professorDetalhe.banco}"> 
		<input type="text" name="agencia" id="agencia" tabindex="1" class="form-control"
		placeholder="Ag�ncia" value="${professorDetalhe.agencia}">
		<input type="text" name="contaCorrente" id="contaCorrente" tabindex="1" class="form-control"
		placeholder="Conta Corrente" value="${professorDetalhe.contaCorrente}">
	</div>
	<div class="form-group col-sm-3	">
		<label for="dataNasc">Data de Nascimento</label> <input type="date"
			name="dataNasc" id="dataNasc" tabindex="1" class="form-control"
			placeholder="dataNasc"
			value="<fmt:formatDate pattern='yyyy-MM-dd' value='${professorDetalhe.dataNasc.time}' />" />
	</div>

	<div class="form-group col-sm-3	">
		<input type="submit" value="Atualizar">
	</div>
</form:form>
<script type="text/javascript" src="../../../js/professor/professor-detalhe.js"></script>