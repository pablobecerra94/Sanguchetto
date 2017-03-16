<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registro de ingrediente</title>
<!-- Bootstrap core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<!-- Bootstrap theme -->
<link href="css/bootstrap-theme.min.css" rel="stylesheet">
</head>
<body>
	<div class="page-header">
		<h1>Registro de Ingrediente</h1>
	</div>
	<div class="container">
		<h2>${texto}</h2>
		<h3>Nombre: ${ingrediente.nombre}</h3>
		<h3>Precio: ${ingrediente.precio}</h3>
		<h3>Tipo: ${ingrediente.tipo}</h3>
	</div>
</body>
</html>