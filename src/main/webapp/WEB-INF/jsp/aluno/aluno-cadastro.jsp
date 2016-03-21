<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<div class="well">
	<h4 class="text-center">Cadastro de Novo Aluno</h4>
	<form:form id="register-form" action="cliente" method="POST"
		role="form" style="display: block;" modelAttribute="cliente">
		<div class="form-group">
			<label for="nome">Nome</label>
			<div class="input-group">
				<input type="text" name="nome" id="nome" tabindex="1"
					class="form-control" placeholder="Nome" value="" required>
				<span class="input-group-addon"> <span
					class="glyphicon glyphicon-asterisk"></span>
				</span>
			</div>
		</div>
		<div class="form-group">
			<div class="input-group">
				<input type="tel" name="telefone" id="telefone" tabindex="1"
					class="form-control" placeholder="Telefone" value="" required>
				<span class="input-group-addon"> <span
					class="glyphicon glyphicon-asterisk"></span>
				</span>
			</div>
		</div>
		<div class="form-group">
			<input type="email" name="email" id="email" tabindex="1"
				class="form-control" placeholder="E-mail" value="">
		</div>
		<div class="form-group">
			<input type="text" name="rg" id="rg" tabindex="1"
				class="form-control" placeholder="RG" value="">
		</div>
		<div class="form-group">
			<input type="text" name="endereco" id="endereco" tabindex="1"
				class="form-control" placeholder="Endereco" value="">
		</div>
		<div class="form-group">
			<input type="text" name="profissao" id="profissao" tabindex="1"
				class="form-control" placeholder="Profissão" value="">
		</div>
		<div class="form-group">
			<input type="text" name="comoConheceu" id="comoConheceu" tabindex="1"
				class="form-control" placeholder="Como Nos Conheceu?" value="">
		</div>
		<div class="form-group">

			<input type="date" name="dataNasc" id="dataNasc" tabindex="1"
				class="form-control" placeholder="dataNasc" value="">
		</div>
		<div class="form-group">
			<label for="sel1">Trumas</label> <select name="turmas"
				class="selectpicker" id="sel1" multiple title="Escolha as turmas">
				<c:forEach items="${turmas}" var="turma" varStatus="loopStatus">
					<option value="${turma.id}"><c:out value="${turma.nome}" /></option>
				</c:forEach>
			</select>
		</div>
		<div class="form-group">
			<div class="row">
				<div class="col-sm-6 col-sm-offset-3">
					<input type="submit" name="register-submit" id="register-submit"
						tabindex="4" class="form-control btn btn-register" value="Salvar">
				</div>
			</div>
		</div>
		<div>
			<strong><span class="glyphicon glyphicon-asterisk"></span>Campos
				Obrigatórios</strong>
		</div>
	</form:form>
</div>