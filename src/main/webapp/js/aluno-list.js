$(document).ready(function() {
	
	function imageFormatter(value, row) {
		return '<img src="'
				+ value
				+ '" class="img-rounded" alt="Cinque Terre" width="50" height="50" />';
	};
	
	function carregaTabela(value) {
		$('#table-aluno').bootstrapTable({
			data : value
		})
	};
	
	$(".clickable-row").click(function() {
		$.ajax({
			type : "GET",
			url : "cliente/"+$(this).data("href"),
			success : function(data) {
				$("#detalhe-aluno").empty();
				$("#detalhe-aluno").html(data);
			}
		});
    });	
	$("#search-form").submit(function(event) {
		event.preventDefault();
		var formData = $("#search-form").serialize();
		$.ajax({
			type : "GET",
			url : "cliente/search",
			data : formData,
			success : function(data) {
				$("#tabela-alunos").empty();
				$("#tabela-alunos").html(data);
			}
		});
	});
});

//$("#search-form").submit(function(event) {
//debugger;
//event.preventDefault();
//var formData = $("#search-form").serialize();
//$.ajax({
//	type : "GET",
//	url : "cliente/search",
//	data : formData,
//	success : carregaTabela
//}).done(function(response) {
//	$('#table-aluno').bootstrapTable({
//		data : response
//	});
//
//});
//});
