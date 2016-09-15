<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
  <title>Login</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
  <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet"  />
  <link href="css/login.css" rel="stylesheet"  />
  <script type="text/javascript" src="js/jquery-1.11.3.js"></script>
  <script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
  
</head>
<body>
<div class="row">
    <div class="col-md-4 col-md-offset-4">
      <form class="form-horizontal" role="form">
        <fieldset>

          <legend>Cadastrar Cliente</legend>

		   <div class="form-group">
            <label class="col-sm-2 control-label" for="textinput">Nome: </label>
            <div class="col-sm-10">
              <input type="text" placeholder="Nome" class="form-control">
            </div>
          </div>
          
          <div class="form-group">
            <label class="col-sm-2 control-label" for="textinput">CPF: </label>
            <div class="col-sm-4">
              <input type="text" placeholder="CPF" class="form-control">
            </div>
            <label class="col-sm-2 control-label" for="textinput">Celular: </label>
            <div class="col-sm-4">
              <input type="text" placeholder="Celular" class="form-control">
            </div>
          </div>
		  	 <legend>Endereço</legend>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="textinput">Endereço: </label>
            <div class="col-sm-10">
              <input type="text" placeholder="Endereço" class="form-control">
            </div>
          </div>

		  <div class="form-group">
            <label class="col-sm-2 control-label" for="textinput">Número:</label>
            <div class="col-sm-2">
              <input type="text" placeholder="Nº" class="form-control">
            </div>
             <label class="col-sm-3 control-label" for="textinput">Complemento:</label>
            <div class="col-sm-5">
              <input type="text" placeholder="Complemento" class="form-control">
            </div>
          </div>

          <div class="form-group">
            <label class="col-sm-2 control-label" for="textinput">Cidade:</label>
            <div class="col-sm-4">
              <input type="text" placeholder="Cidade" class="form-control">
            </div>
            <label class="col-sm-2 control-label" for="textinput">CEP:</label>
            <div class="col-sm-4">
              <input type="text" placeholder="CEP" class="form-control">
            </div>
          </div>

          <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
              <div class="pull-right">
                <button type="submit"  class="btn btn-default"> Cancel</button>
                <button type="submit"  class="btn btn-primary">Save</button>
              </div>
            </div>
          </div>
        </fieldset>
      </form>
    </div><!-- /.col-lg-12 -->
</div><!-- /.row -->
</body>
</html>