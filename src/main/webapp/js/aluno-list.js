
function imageFormatter(value, row) {
		return '<img src="'+value+'" class="img-rounded" alt="Cinque Terre" width="50" height="50" />';
	};
	
	$("#search-form").submit(function(event) {
		debugger;
		event.preventDefault();
		var formData = $("#search-form").serialize();
		$.ajax({
			type : "GET",
			url : "cliente/search",
			data : formData
		}).done(function(response) {
			$('#table-aluno').bootstrapTable({
				data : response
			});

			// 			alert("");
			// 			alert(response);
		});
	});