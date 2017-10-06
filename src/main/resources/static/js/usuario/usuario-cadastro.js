function reloadUsuarios(mensagem){
  $.ajax({
        type : "GET",
        url : "usuario",
        success: function(data) {
              $('#todos-usuarios').html(data);
              if (mensagem  !== 'undefined' ){
                $('#messages-all').html(mensagem);
                $('#message-all').removeClass('hide').slideDown().show();
              }
          }
    })
}

function deletaUsuario(id){
   var formData = $("#register-form-usuario").serialize(); // Usado apenas para pegar o csrf token e enviar junto na requisicao
   $.ajax({
        type : "POST",
        data : formData,
        url : "usuario/"+id+"/delete",
    }).done(function(data) {
        reloadUsuarios(data);
    });
}

$(document).ready(function() {

	$("#register-form-usuario").submit(function(event) {
		event.preventDefault();
		var formData = $("#register-form-usuario").serialize();
		$.ajax({
			type : "POST",
			url : "usuario/novo",
			data : formData,
			success: function(data) {
                $('#messages').html(data);
                $('#message').removeClass('hide').slideDown().show();

                $("#register-form-usuario")[0].reset();
                reloadUsuarios();
            }
		})
	});

});