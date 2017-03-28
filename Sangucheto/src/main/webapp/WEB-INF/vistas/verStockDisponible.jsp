<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Stock disponible</title>
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
				<li><a href="ingresaringrediente">Ingresar ingrediente</a></li>
				<li><a href="agregarOQuitarStock">Modificar Stock</a></li>
				<li class="active"><a href="verStockDisponible">Stock
						Disponible</a></li>
			</ul>
		</div>
		<!--/.nav-collapse -->
	</div>
	</nav>
	<br>

	<div class="page-header">
		<h1>Stock Disponible</h1>
	</div>
	<div class="container">
		<div class="row">
		
			<div class="col-md-6">
				<h2>Ingredientes</h2>
			
				<table class="table table-bordered">
					<thead>
						<tr>
							<th>Producto</th>
							<th>Cantidad</th>
						</tr>
					</thead>
					<tbody>

						<c:forEach items="${stock}" var="object">
							<tr>
								<c:if test="${object.key.tipo.toString().equals('INGREDIENTE')}">
									<td>${object.key.nombre}</td>
									<td>${object.value}</td>
								</c:if>

							</tr>
						</c:forEach>
					</tbody>
				</table>

			</div>

			

			<div class="col-md-6">
			<h2>Condimentos</h2>
				<table class="table table-bordered">
					<thead>
						<tr>
							<th>Producto</th>
							<th>Cantidad</th>
						</tr>
					</thead>
					<tbody>

						<c:forEach items="${stock}" var="object">
							<tr>
								<c:if test="${object.key.tipo.toString().equals('CONDIMENTO')}">
									<td>${object.key.nombre}</td>
									<td>${object.value}</td>
								</c:if>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>

	<script src="js/jquery.1,11,3,min.js" type="text/javascript">
		
	</script>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>