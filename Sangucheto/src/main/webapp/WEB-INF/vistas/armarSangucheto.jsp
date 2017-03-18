<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<div class="page-header">
		<h1>Arma tu Sangucheto</h1>
	</div>
	<div class="row">
		<div class="col-md-6">
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>Ingrediente</th>
						<th>Tipo</th>
						<th>Precio</th>
						<th>
					</tr>
				</thead>
				<tbody>

					<c:forEach items="${stock}" var="object">
						<form:form action="armarSanguchettoAgrega"
							modelAttribute="ingrediente" role="form" method="POST">
							<tr>

								<td><form:input style="border:none" path="nombre"
										value="${object.key.nombre}" readonly="true" /></td>
								<td><form:input style="border:none" path="tipo"
										value="${object.key.tipo}" readonly="true" /></td>
								<td><form:input style="border:none" path="precio"
										value="${object.key.precio}" readonly="true" /></td>
								<td><button type="submit" class="btn btn-primary">Agregar
										al Sanguchetto</button></td>

							</tr>
						</form:form>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>

	<h2>Vaciar Sanguchetto</h2>

	<div class="page-header">
		<h1>Sanguchetto Precio Total "${precio}"</h1>
	</div>
	<div class="row">
		<div class="col-md-6">
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>Nombre</th>
						<th>Tipo</th>
						<th>Precio</th>
					</tr>
				</thead>
				<tbody>

					<c:forEach items="${sanguchetto}" var="object">
						<tr>
							<td>${object.nombre}</td>
							<td>${object.tipo}</td>
							<td>${object.precio}</td>

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
