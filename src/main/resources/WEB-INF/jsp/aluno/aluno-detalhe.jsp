<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<link href="../../../bootstrap/css/bootstrap.min.css" rel="stylesheet" />
<link href="../../../css/home.css" rel="stylesheet" />
<form:form id="aluno-detalhe-form" methodParam="PUT">
	<div class="row">
		<div class="form-group col-sm-2">
			<label for="foto">Matricula: ${clienteDetalhe.id} </label>
			<div>
				<img id="foto" src="${clienteDetalhe.fotoUrl}" class="img-rounded"
					alt="Sem Foto" width="150" height="150" name="fotoUrl">
			</div>
		</div>
		<div class="form-group col-sm-10 pre-scrollable">
			<table class="table table-striped" id="table-aluno">
				<thead>
					<tr>
						<th data-field="nome">Nome</th>
						<th data-field="inicio">Inicio</th>
						<th data-field="fim">Fim</th>
						<th data-field="fim">Valor</th>
						<th data-field="acao">A��o</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${clienteDetalhe.matriculas}" var="matricula"
						varStatus="loopStatus">
						<form:form>
							<tr data-href='${matricula.id}' />
							<input type="hidden" value="${matricula.id}" id="matricula" />
							<td><c:out value="${matricula.turma.nome}" /></td>
							<td><input type="date" name="inicio" id="inicio"
								tabindex="1" class="form-control" placeholder="dataNasc"
								value="<fmt:formatDate pattern='yyyy-MM-dd' value='${matricula.dtInicio.time}' />" />
							</td>
							<td><input type="date" name="dtFim" id="dtFim"
								tabindex="1" class="form-control" placeholder="fim"
								value="<fmt:formatDate pattern='yyyy-MM-dd' value='${matricula.dtFim.time}' />" />
							</td>	
							<td>
								<input type="number" value="${matricula.valor}">
<%-- 								<fmt:formatNumber value="${matricula.valor}" type="currency" /> --%>
							</td>
							<td><input type="submit" value="Atualizar" /></td>
						</form:form>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<div class="form-group col-sm-3">
		<label for="nome">Nome</label> <input type="text" name="nome"
			id="nome" tabindex="1" class="form-control" placeholder="Nome"
			value="${clienteDetalhe.nome}" required>
	</div>

	<div class="form-group col-sm-3">
		<label for="telefone">Telefone</label> <input type="tel"
			name="telefone" id="telefone" tabindex="1" class="form-control"
			placeholder="Telefone" title="(99) 12345-1234"
			pattern="\([0-9]{2}\) [0-9]{4,6}-[0-9]{3,4}$"
			value="${clienteDetalhe.telefone}" required>
	</div>
	<div class="form-group col-sm-3">
		<label for="email">E-mail</label> <input type="email" name="email"
			id="email" tabindex="1" class="form-control" placeholder="E-mail"
			value="${clienteDetalhe.email}">
	</div>
	<div class="form-group col-sm-3">
		<label for="rg">RG</label> <input type="text" name="rg" id="rg"
			tabindex="1" class="form-control" placeholder="RG"
			value="${clienteDetalhe.rg}">
	</div>
	<div class="form-group col-sm-6">
		<label for="endereco">Endere�o</label> <input type="text"
			name="endereco" id="endereco" tabindex="1" class="form-control"
			placeholder="Endereco" value="${clienteDetalhe.endereco}">
	</div>
	<div class="form-group col-sm-3">
		<label for="profissao">Profissao</label> <input type="text"
			name="profissao" id="profissao" tabindex="1" class="form-control"
			placeholder="Profiss�o" value="${clienteDetalhe.profissao}">
	</div>
	<div class="form-group col-sm-3">
		<label for="profissao">Como nos conheceu?</label> <input type="text"
			name="comoConheceu" id="comoConheceu" tabindex="1"
			class="form-control" placeholder="Como Nos Conheceu?"
			value="${clienteDetalhe.comoConheceu}">
	</div>
	<div class="form-group col-sm-3	">
		<label for="dataNasc">Data de Nascimento</label> <input type="date"
			name="dataNasc" id="dataNasc" tabindex="1" class="form-control"
			placeholder="dataNasc"
			value="<fmt:formatDate pattern='yyyy-MM-dd' value='${clienteDetalhe.dataNasc.time}' />" />
	</div>

	<div class="form-group col-sm-3	">
		<input type="submit" value="Atualizar">
	</div>
</form:form>
<script type="text/javascript" src="../../../js/aluno-detalhe.js"></script>