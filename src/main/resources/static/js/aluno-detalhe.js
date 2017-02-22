$(document).ready(function() {
	
	$("#aluno-detalhe-form").submit(function(event) {
		event.preventDefault();
		var formData = $("#aluno-detalhe-form").serialize();
		$.ajax({
			type : "POST",
			url : "cliente/"+$("#matricula").val(),
			data : formData,
//			contentType: "application/json",
			success : function(data) {
				alert("Atualizado com sucesso")
			}
		});
	});
	
//	
//	$("#aluno-detalhe-form").submit(function(event) {
//		event.preventDefault();
//		var formData = $("#aluno-detalhe-form").serialize();
//		$.ajax({
//			type : "POST",
//			url : "cliente/"+$("#matricula").val(),
//			data : formData,
////			contentType: "application/json",
//			success : function(data) {
//				alert("Atualizado com sucesso")
//			}
//		});
//	});

});