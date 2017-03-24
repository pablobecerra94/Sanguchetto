<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Compra realizada</title>
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
				<li class="active"><a href="armarSangucheto">Armar Sangucheto</a></li>
				<li><a href="ingresaringrediente">Ingresar ingrediente</a></li>
				<li><a href="agregarOQuitarStock">Modificar Stock</a></li>
				<li><a href="verStockDisponible">Stock Disponible</a></li>
			</ul>
		</div>
		<!--/.nav-collapse -->
	</div>
	</nav>
	<br>
	<div class="page-header">
		<h1>Gracias por tu compra!</h1>
	</div>
	<h3>Felicitaciones por elegir el sanguche perfecto en Sangucheto!</h3>
	<h2>Precio Final : ${precio} $.-</h2>
	<div class="page-header">
		<h1>Sanguchetto</h1>
	</div>
	<h2>Ingredientes</h2>
	<div class="row">
		<div class="col-md-6">
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>Nombre</th>
						<th>Tipo</th>
						<th>Precio</th>
						<th>Cantidad</th>
					</tr>
				</thead>
				<tbody>

					<c:forEach items="${sangucheto}" var="object">
						<tr>
							<c:if test="${object.key.tipo.toString().equals('INGREDIENTE')}">
								<td>${object.key.nombre}</td>
								<td>${object.key.tipo}</td>
								<td>${object.key.precio}</td>
								<td>${object.value}</td>
							</c:if>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	
		<h2>Condimentos</h2>
	<div class="row">
		<div class="col-md-6">
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>Nombre</th>
						<th>Tipo</th>
						<th>Precio</th>
						<th>Cantidad</th>
					</tr>
				</thead>
				<tbody>

					<c:forEach items="${sangucheto}" var="object">
						<tr>
							<c:if test="${object.key.tipo.toString().equals('CONDIMENTO')}">
								<td>${object.key.nombre}</td>
								<td>${object.key.tipo}</td>
								<td>${object.key.precio}</td>
								<td>${object.value}</td>
							</c:if>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<div class="row">
		<div class="col-md-6">
			<table class="table table-borderless table-condensed table-hover">
				<tbody>
				
					<form action="armarSangucheto" method="POST">
								<button type="submit" class="btn btn-primary">Comprar
									otro Sangucheto</button>
							</form>
						
				</tbody>
			</table>
		</div>
	</div>
	
</body>
</html>