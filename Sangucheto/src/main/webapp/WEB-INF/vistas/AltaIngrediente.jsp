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

	<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#navbar" aria-expanded="false"
				aria-controls="navbar">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="home">Sangucheto</a>
		</div>
		<div id="navbar" class="navbar-collapse collapse">
			<ul class="nav navbar-nav">
				<li><a href="armarSangucheto">Armar Sangucheto</a></li>
				<li><a href="mostrarSangucheto">Ver Sangucheto</a></li>
				<li class="active"><a href="ingresaringrediente">Ingresar ingrediente</a></li>
				<li ><a href="agregarOQuitarStock">Modificar
						Stock</a></li>
				<li><a href="verStockDisponible">Stock Disponible</a></li>
			</ul>
		</div>
		<!--/.nav-collapse -->
	</div>
	</nav>
	<br>
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