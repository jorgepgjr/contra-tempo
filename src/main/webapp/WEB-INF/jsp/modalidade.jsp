<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />
<link href="bootstrap/css/bootstrap-select.min.css" rel="stylesheet" />
<link href="bootstrap/css/bootstrap-clockpicker.min.css" rel="stylesheet" />
<link href="css/home.css" rel="stylesheet" />


<div class="row">
	<div class="col-sm-6 well">
		<h2>Turmas</h2>
		<c:forEach items="${turmas}" var="turma" varStatus="loopStatus">
			<button type="button" class="btn btn-default">
				<c:out value="${turma.nome}" />
			</button>
		</c:forEach>
		<form:form id="register-form" class="form-horizontal" action="turma"
			method="POST" role="form" modelAttribute="turma">
			<div class="form-group">
				<label class="control-label" for="nome">Nome:</label>
				<div class="input-group">
					<input type="text" name="nome" id="nome" tabindex="1"
						class="form-control" placeholder="Nome" value="" required>
					<span class="input-group-addon"> <span
						class="glyphicon glyphicon-asterisk"></span>
					</span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="sala">Sala:</label> 
				<select name="sala" class="selectpicker col-sm-8" id="sala"
					title="Sala">
					<option value="Sala 1">Sala 1</option>
					<option value="Sala 2">Sala 2</option>
				</select>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="nivel">Nível:</label> <select
					name="nivel" class="selectpicker col-sm-8" id="nivel"
					title="Nível">
					<option value="0">0 - Iniciantes</option>
					<option value="1">1 - Iniciados</option>
					<option value="2">2 - Intermediário</option>
				</select>
			</div>
			<div class="form-group">
				<div class="input-group clockpicker" data-autoclose="true">
					<input type="text" class="form-control" value="19:00"> <span
						class="input-group-addon"> <span
						class="glyphicon glyphicon-time"></span>
					</span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label" for="sel2">Professor</label> <select
					name="professores" class="selectpicker col-sm-8" id="sel2"
					title="Escolha o Professor">
					<c:forEach items="${professores}" var="professore"
						varStatus="loopStatus">
						<option value="${professore.id}"><c:out
								value="${professore.nome}" /></option>
					</c:forEach>
				</select>
			</div>
			<div class="form-group">
				<div class="col-sm-4">
					<label for="sel1">Modalidades</label>
				</div>
				<div class="col-sm-8">
					<select name="modalidades" class="selectpicker" id="sel1" multiple
						title="Escolha as modalidades">
						<c:forEach items="${modalidades}" var="modalidade"
							varStatus="loopStatus">
							<option value="${modalidade.id}"><c:out
									value="${modalidade.nome}" /></option>
						</c:forEach>
					</select>
				</div>
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
	<div class="col-sm-6 well">
		<h2>Modalidades</h2>
		<c:forEach items="${modalidades}" var="modalidade"
			varStatus="loopStatus">
			<li class="list-group-item"><c:out value="${modalidade.nome}" />
			</li>
		</c:forEach>
		<h4>Numero de modalidades: ${modalidades.size()}</h4>
		<form id="modalidade-form" action="modalidade" method="POST">
			<div class="form-group col-sm-6">
				<input type="text" name="nome" id="nome-modalidade" tabindex="1"
					class="form-control" placeholder="Nova Modalidade" value="">
			</div>
			<div class="form-group col-sm-6">
				<input type="submit" name="register-submit" id="register-submit"
					tabindex="4" class="form-control btn btn-register" value="Salvar">
			</div>
		</form>
	</div>
</div>
<script type="text/javascript" src="bootstrap/js/bootstrap-clockpicker.min.js"></script>
<script type="text/javascript"	src="js/modalidade.js"></script>