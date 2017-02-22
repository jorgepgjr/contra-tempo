$(document).ready(function() {
	
	$("#register-form").submit(function(event) {
		event.preventDefault();
		var formData = $("#register-form").serialize();
		$.ajax({
			type : "POST",
			url : "cliente",
			data : formData
		}).done(function(response) {
			carregaTela(response);
		});
	});
	$('#rg').mask('AA.AAA.AAA-A');
	$('#telefone').mask('(99) 99999-9999');
	
//    $('#register-form')
//        .formValidation({
//            framework: 'bootstrap',
//            icon: {
//                valid: 'glyphicon glyphicon-ok',
//                invalid: 'glyphicon glyphicon-remove',
//                validating: 'glyphicon glyphicon-refresh'
//            },
//            fields: {
//            	telefone: {
//                    validators: {
//                        telefone: {
//                            message: 'Numero de telefone inválido'
//                        }
//                    }
//                }
//            }
//        })
//        .find('[name="telefone"]').mask('(00)00000-0000');
});