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
	$("#turma-form").submit(function(event) {
		event.preventDefault();
		var formData = $("#turma-form").serialize();
		$.ajax({
			type : "POST",
			url : "turma",
			data : formData
		}).done(function(response) {
			carregaTela(response);
		});
	});
	$(".turmaBtn").click(function(event) {
		event.preventDefault();		
		$.ajax({
			type : "GET",
			url : "turma/"+this.id
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
		//Prepara os selects e clockpicker
		$('.selectpicker').selectpicker("refresh");
 		$('.clockpicker').clockpicker();
});