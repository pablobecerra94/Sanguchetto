<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Ingresar ingrediente</title>
<!-- Bootstrap core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<!-- Bootstrap theme -->
<link href="css/bootstrap-theme.min.css" rel="stylesheet">
</head>
<body>
	<div class="page-header">
		<h1>Ingresar ingrediente</h1>
	</div>
	<div class="container">
		<form:form action="AltaIngrediente" modelAttribute="ingrediente"
			role="form" method="POST">
			<div class="form-group">
				<label for="Nombre">Nombre:</label>
				<form:input id="nombre" class="form-control" type="text"
					path="nombre" placeholder="Ingresar nombre" />
			</div>

			<div class="form-group">
				<label for="precio">Precio:</label>
				<form:input id="precio" class="form-control" type="number"
					min="0.01" step="0.01" max="2500" value="25.67" path="precio"
					placeholder="Ingresar precio" />
			</div>

			<div class="form-group">
				<form:radiobutton id="tipo" path="tipo" value="INGREDIENTE" label="Ingrediente"/>
				<form:radiobutton id="tipo" path="tipo" value="CONDIMENTO" label="Condimento"/>
			</div>


			<button type="submit" class="btn btn-primary">Ingresar</button>
			<button type="reset" class="btn btn-primary">Borrar Todo</button>
		</form:form>

	</div>
</body>
</html>