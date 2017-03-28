<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Modificar stock</title>
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
				<li class="active"><a href="agregarOQuitarStock">Modificar
						Stock</a></li>
				<li><a href="verStockDisponible">Stock Disponible</a></li>
			</ul>
		</div>
		<!--/.nav-collapse -->
	</div>
	</nav>
	<br>
	<div class="page-header">
		<h1>Agregar o quitar Stock</h1>
	</div>
	<div class="container">
		<h2>Ingredientes</h2>
		<div class="row">
			<div class="col-md-6">
				<table class="table table-bordered">
					<thead>
						<tr>
							<th>Ingrediente</th>
							<th>Cantidad Actual</th>
							<th>Cantidad a modificar</th>
							<th>Agregar</th>
							<th>Quitar</th>
							<th>Eliminar</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${stock}" var="object">
							<form:form action="" modelAttribute="ingrediente" role="form"
								method="POST">
								<tr>
									<c:if
										test="${object.key.tipo.toString().equals('INGREDIENTE')}">
										<td><form:input style="border:none" path="nombre"
												value="${object.key.nombre}" readonly="true" /></td>
										<td>${object.value}</td>
										<td><input type="number" name="cantidadAIngresar"
											type="number" value="0" /></td>
										<td><button onclick="this.form.action='agregarStock';"
												type="submit" class="btn btn-primary">Agregar</button></td>
										<td><button onclick="this.form.action='quitarStock';"
												type="submit" class="btn btn-primary">Quitar</button></td>
										<td><button
												onclick="this.form.action='eliminarIngrediente';"
												type="submit" class="btn btn-primary">Eliminar</button></td>
									</c:if>
								</tr>
							</form:form>
						</c:forEach>
					</tbody>

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
							<th>Ingrediente</th>
							<th>Cantidad Actual</th>
							<th>Cantidad a modificar</th>
							<th>Agregar</th>
							<th>Quitar</th>
							<th>Eliminar</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${stock}" var="object">
							<form:form action="" modelAttribute="ingrediente" role="form"
								method="POST">
								<tr>
									<c:if test="${object.key.tipo.toString().equals('CONDIMENTO')}">
										<td><form:input style="border:none" path="nombre"
												value="${object.key.nombre}" readonly="true" /></td>
										<td>${object.value}</td>
										<td><input type="number" name="cantidadAIngresar"
											type="number" value="0" /></td>
										<td><button onclick="this.form.action='agregarStock';"
												type="submit" class="btn btn-primary">Agregar</button></td>
										<td><button onclick="this.form.action='quitarStock';"
												type="submit" class="btn btn-primary">Quitar</button></td>
										<td><button
												onclick="this.form.action='eliminarIngrediente';"
												type="submit" class="btn btn-primary">Eliminar</button></td>
									</c:if>
								</tr>
							</form:form>
						</c:forEach>
					</tbody>

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