$(document).ready(function() {
	$("#modalidade-form").submit(function(event) {
		event.preventDefault();
		var formData = $("#modalidade-form").serialize();
		$.ajax({
			type : "POST",
			url : "modalidade",
			data : formData
		}).done(function(response) {
			carregaTela(response);
		});
	});
	function carregaTela(tela, id) {
		$("#panel-body").empty();
		$("#panel-body").html(tela);
		if (id != null) {
			$(".active").removeClass("active");
			$('#' + id).addClass("active");
		}
	}
	// A $( document ).ready() block.
		//Prepara os selects
		$('.selectpicker').selectpicker("refresh");
 		$('.clockpicker').clockpicker();
});