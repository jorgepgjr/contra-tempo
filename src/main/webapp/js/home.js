$(document).ready(function() {

	/*Menus*/
	function carregaTela(tela, id) {
		$("#panel-body").empty();
		$("#panel-body").html(tela);
		if (id != null) {
			$(".active").removeClass("active");
			$('#' + id).addClass("active");
		}
		hideLoading();
	}

	$("#menu-aluno").click(function() {
		showLoading();
		$.ajax({
			type : "GET",
			url : "cliente",
			success : function(data) {				
				carregaTela(data, 'menu-aluno');
				
			}
		});
		return false; // stop the browser following the link
	});

	$("#menu-turma").click(function() {
		showLoading();
		$.ajax({
			type : "GET",
			url : "turma",
			success : function(data) {
				carregaTela(data, 'menu-turma');
			}
		});
		return false; // stop the browser following the link
	});
	
	$("#menu-professor").click(function() {
		showLoading();
		$.ajax({
			type : "GET",
			url : "professor",
			success : function(data) {
				carregaTela(data, 'menu-professor');
			}
		});
		return false; // stop the browser following the link
	});
	
	function carregaTabela(value) {
		$('#table-aluno').bootstrapTable({
			data : value
		})
	};

	$(".btn-pagar").click(function(event) {
		event.preventDefault();		
		$.ajax({
			type : "POST",
			url : "matricula/"+this.id+"/pagar"
		}).done(function() {
			alert("Matricula paga!");
			window.location.replace("/home");
		});
	});	
	
	function showLoading(){
		$('#loading-image').show();
		$('#panel-body').hide();		
	}
	function hideLoading(){
		$('#loading-image').hide();
		$('#panel-body').show();
	}
	
});