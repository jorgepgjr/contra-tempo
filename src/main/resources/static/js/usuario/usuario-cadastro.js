$(document).ready(function() {

	function mensagemDeSucesso(data){
        $('#messages').html(data);
        $('#message').removeClass('hide').slideDown().show();
    }

	$("#register-form-usuario").submit(function(event) {
		event.preventDefault();
		var formData = $("#register-form-usuario").serialize();
		$.ajax({
			type : "POST",
			url : "usuario/novo",
			data : formData,
			success: function(data) {
                mensagemDeSucesso(data);
                $("#register-form-usuario")[0].reset();
            }
		})
	});
});