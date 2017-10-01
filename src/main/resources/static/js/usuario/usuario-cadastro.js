$(document).ready(function() {

	function mensagemDeSucesso(data){
        $('#messages').html(data);
        $('#message').removeClass('hide').slideDown().show();
    }

    function reloadUsuarios(){
          $.ajax({
                type : "GET",
                url : "usuario",
                success: function(data) {
                      $('#todos-usuarios').html(data);
                  }
            })
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
                reloadUsuarios();
            }
		})
	});

	$("#delete-form-usuario").submit(function(event) {
    		event.preventDefault();
    		var formData = $("#delete-form-usuario").serialize();
       		$.ajax({
       			type : "POST",
       			data : formData,
       			url : "usuario/"+$("#usuarioId").val()+"/delete",
       		}).done(function() {
       		    mensagemDeSucesso(data);
       		    reloadUsuarios();
       		});
       	});
});