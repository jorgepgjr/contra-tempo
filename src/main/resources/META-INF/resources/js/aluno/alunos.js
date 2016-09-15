$(document).ready(function() {
	
//	function imageFormatter(value, row) {
//		return '<img src="'
//				+ value
//				+ '" class="img-rounded" alt="Sem Imagem" width="50" height="50" />';
//	};
	
	function carregaTabela(value) {
		$('#table-aluno').bootstrapTable({
			data : value
		})
	};
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