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

	//Nao estou usando
//	$.fn.serializeObject = function()
//	{
//	   var o = {};
//	   var a = this.serializeArray();
//	   $.each(a, function() {
//	       if (o[this.name]) {
//	           if (!o[this.name].push) {
//	               o[this.name] = [o[this.name]];
//	           }
//	           o[this.name].push(this.value || '');
//	       } else {
//	           o[this.name] = this.value || '';
//	       }
//	   });
//	   return o;
//	};
});