<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<script type="text/javascript" src="js/jquery.mask.min.js"></script>
<script type="text/javascript" src="js/aluno/aluno-cadastro.js"></script>

<div class="well">
	<h3 class="text-center">Cadastro de Novo Aluno</h3>
	<form:form id="register-form" action="cliente" method="POST"
		role="form" style="display: block;" modelAttribute="cliente">

		<div class="row">
			<div class="form-group col-sm-12">
				<label for="nome">Nome</label>
				<div class="input-group">
					<input type="text" name="nome" id="nome" tabindex="1"
						class="form-control" placeholder="Nome completo" value="" required>
					<span class="input-group-addon"> <span
						class="glyphicon glyphicon-asterisk"></span>
					</span>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="form-group col-sm-8">
				<label for="endereco">Endereço</label> <input type="text"
					name="endereco" id="endereco" tabindex="1" class="form-control"
					placeholder="Endereço" value="">
			</div>
			<div class="form-group col-sm-4">
				<label for="cidade">Cidade</label> <input type="text" name="cidade"
					id="cidade" tabindex="1" class="form-control" placeholder="Cidade"
					value="Santos">
			</div>
		</div>

		<div class="row">
			<div class="form-group col-sm-4">
				<label for="profissao">Profissão</label> <input type="text"
					name="profissao" id="profissao" tabindex="1" class="form-control"
					placeholder="Ex: Desenvolvedor, Médico" value="">
			</div>
			<div class="form-group col-sm-4">
				<label for="dataNasc">Data de Nascimento</label> <input type="date"
					name="dataNasc" id="dataNasc" tabindex="1" class="form-control"
					placeholder="dataNasc" value="">
			</div>
			<div class="form-group col-sm-4">
				<label for="telefone">Telefone</label>
				<div class="input-group">
					<input type="tel" title="(99) 12345-1234" pattern="\([0-9]{2}\) [0-9]{4,6}-[0-9]{3,4}$" name="telefone" id="telefone" tabindex="1"
						class="form-control" placeholder="Telefone" value="" required>
					<span class="input-group-addon"> <span
						class="glyphicon glyphicon-asterisk"></span>
					</span>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="form-group col-sm-6">
				<label for="email">E-mail</label> <input type="email" name="email"
					id="email" tabindex="1" class="form-control" placeholder="E-mail"
					value="">
			</div>
			<div class="form-group col-sm-6">
				<label for="rg">RG</label> <input type="text" name="rg" id="rg"
					tabindex="1" class="form-control" placeholder="Ex: 32.914.787-x" value="">
			</div>
		</div>

		<div class="form-group">
			<label for="comoConheceu">Como Nos Conheceu</label> <input
				type="text" name="comoConheceu" id="comoConheceu" tabindex="1"
				class="form-control" placeholder="Ex: Facebook, Site, Amigos..."
				value="">
		</div>
		<div class="form-group">
			<label for="sel1">Turmas</label> <select name="turmas"
				class="selectpicker" id="sel1" multiple title="Escolha as turmas">
				<c:forEach items="${turmas}" var="turma" varStatus="loopStatus">
					<option value="${turma.id}"><c:out value="${turma.nome}" /></option>
				</c:forEach>
			</select>
		</div>

		<div>
			<strong><span class="glyphicon glyphicon-asterisk"></span>Campos
				Obrigatórios</strong>
		</div>

		<div class="form-group">
			<div class="row">
				<div class="col-sm-6 col-sm-offset-3">
					<input type="submit" name="register-submit" id="register-submit"
						tabindex="4" class="form-control btn btn-register" value="Salvar">
				</div>
			</div>
		</div>
	</form:form>
</div>