$(document).ready(function() {
	
//	function imageFormatter(value, row) {
//		return '<img src="'
//				+ value
//				+ '" class="img-rounded" alt="Sem Imagem" width="50" height="50" />';
//	};

// Controla os click da tabela
	$(".clickable-row").click(function () {
		$("#detalhe-aluno").slideUp(300);
		$.ajax({
			type: "GET",
			url: "cliente/" + $(this).data("href"),
			success: function (data) {
// 			$("#detalhe-aluno").empty();
				$("#detalhe-aluno").html(data);
				$("#detalhe-aluno").slideDown(300);

			}
		});
	});

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