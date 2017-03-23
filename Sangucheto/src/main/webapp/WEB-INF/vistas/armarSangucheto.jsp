<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Arma tu Sangucheto!</title>
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
				<li class="active"><a href="armarSangucheto">Armar
						Sangucheto</a></li>
				<li><a href="mostrarSangucheto">Ver Sangucheto</a></li>
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
		<h1>Arma tu Sangucheto</h1>
	</div>
	<h2>Ingredientes</h2>
	<div class="row">
		<div class="col-md-6">
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>Ingrediente</th>
						<th>Tipo</th>
						<th>Precio</th>
						<th>Cantidad</th>
						<th>
					</tr>
				</thead>
				<tbody>

					<c:forEach items="${stock}" var="object">
						<form:form action="armarSanguchettoAgrega"
							modelAttribute="ingrediente" role="form" method="POST">
							<tr>
								<c:if test="${object.key.tipo.toString().equals('INGREDIENTE')}">
									<c:if test="${object.value>0}">
										<td><form:input style="border:none" path="nombre"
												value="${object.key.nombre}" readonly="true" /></td>
										<td><form:input style="border:none" path="tipo"
												value="${object.key.tipo}" readonly="true" /></td>
										<td><form:input style="border:none" path="precio"
												value="${object.key.precio}" readonly="true" /></td>
										<td><input type="number" name="cantidad" type="number"
											value="1" placeholder="Ingresar numero positivo" /></td>
										<td><button type="submit" class="btn btn-primary">Agregar
												al Sanguchetto</button></td>
									</c:if>
								</c:if>
							</tr>
						</form:form>
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
						<th>Ingrediente</th>
						<th>Tipo</th>
						<th>Precio</th>
						<th>Cantidad</th>
						<th>
					</tr>
				</thead>
				<tbody>

					<c:forEach items="${stock}" var="object">
						<form:form action="armarSanguchettoAgrega"
							modelAttribute="ingrediente" role="form" method="POST">
							<tr>
								<c:if test="${object.key.tipo.toString().equals('CONDIMENTO')}">
									<c:if test="${object.value>0}">
										<td><form:input style="border:none" path="nombre"
												value="${object.key.nombre}" readonly="true" /></td>
										<td><form:input style="border:none" path="tipo"
												value="${object.key.tipo}" readonly="true" /></td>
										<td><form:input style="border:none" path="precio"
												value="${object.key.precio}" readonly="true" /></td>
										<td><input type="number" name="cantidad" type="number"
											value="1" placeholder="Ingresar numero positivo" /></td>
										<td><button type="submit" class="btn btn-primary">Agregar
												al Sanguchetto</button></td>
									</c:if>
								</c:if>
							</tr>
						</form:form>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>

	<div class="page-header">
		<h2>Promoción del dia: 10% de descuento al llevar 3 o mas
			ingredientes/condimientos DIFERENTES</h2>

		<h1>Sanguchetto Precio Total: ${precio}$.-</h1>
		<c:set var="object2" value="${sanguchetto}" />
		<c:choose>
			<c:when test="${fn:length(object2) > 2}">
				<h1>Descuento actual: ${descuento} $.-</h1>
			</c:when>
			<c:otherwise>
				<h1>Descuento actual: 0$ .-</h1>
			</c:otherwise>
		</c:choose>
	</div>
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

					<c:forEach items="${sanguchetto}" var="object">
						<tr>
							<td>${object.key.nombre}</td>
							<td>${object.key.tipo}</td>
							<td>${object.key.precio}</td>
							<td>${object.value}</td>

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
					<tr>
						<td><form action="comprarSangucheto" method="POST">
								<button type="submit" class="btn btn-primary">Comprar
									Sangucheto</button>
							</form></td>
						<td>
							<form action="armarSanguchettoVaciar" method="POST">
								<button type="submit" class="btn btn-primary">Cancelar</button>
							</form>
						</td>

					</tr>
				</tbody>
			</table>
		</div>
	</div>






</body>
</html>
