$(document).ready(function() {
	function carregaTabela(value) {
		$('#table-professor').bootstrapTable({
			data : value
		})
	};
	$("#search-form").submit(function(event) {
		event.preventDefault();
		var formData = $("#search-form").serialize();
		$.ajax({
			type : "GET",
			url : "professor/search",
			data : formData,
			success : function(data) {
				$("#tabela-professores").empty();
				$("#tabela-professores").html(data);
			}
		});
	});
});