<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<!-- Bootstrap core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<!-- Bootstrap theme -->
<link href="css/bootstrap-theme.min.css" rel="stylesheet">
</head>
<body>
	<div class="page-header">
		<h1>Agregar o quitar Stock</h1>
	</div>

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
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${stock}" var="object">
						<form:form action="" modelAttribute="ingrediente" role="form"
							method="POST">
							<tr>

								<td><form:input style="border:none" path="nombre"
										value="${object.key.nombre}" readonly="true" /></td>
								<td>${object.value}</td>
								<td><input type="number" name="cantidadAIngresar" type="number" value="0" /></td>

								<td><button
										onclick="this.form.action='agregarStock';this.form.submit();"
										type="submit" class="btn btn-primary">Agregar</button></td>
								<td><button
										onclick="this.form.action='quitarStock';this.form.submit();"
										type="submit" class="btn btn-primary">Quitar</button></td>
							</tr>
						</form:form>
					</c:forEach>
				</tbody>

				</tbody>
</body>
</html>