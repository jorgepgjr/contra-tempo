$(document).ready(function() {
	
	$("#professor-detalhe-form").submit(function(event) {
		event.preventDefault();
		var formData = $("#professor-detalhe-form").serialize();
		$.ajax({
			type : "POST",
			url : "professor/"+$("#matricula").val(),
			data : formData,
//			contentType: "application/json",
			success : function(data) {
				alert("Atualizado com sucesso")
			}
		});
	});
});