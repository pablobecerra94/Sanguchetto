<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>

<body>
	<c:forEach items="${stock}" var="object">
		<form:form action="armarSanguchettoAgrega"
			modelAttribute="ingrediente" role="form" method="POST">
			<h2>
				<form:input path="nombre" value="${object.key.nombre}"
					readonly="true" />
				<form:input path="tipo" value="${object.key.tipo}" readonly="true" />
				<form:input path="precio" value="${object.key.precio}"
					readonly="true" />
				<button type="submit" class="btn btn-primary">Agregar al
					Sanguchetto</button>

			</h2>
		</form:form>
	</c:forEach>
	<h2>Vaciar Sanguchetto</h2>
	<form action="armarSanguchettoVaciar" method="POST">
		<button type="submit" class="btn btn-primary">VaciarSanguchetto</button>
	</form>
	<div class="page-header">
		<h1>Sanguchetto Precio Total "${precio}"</h1>
	</div>
	<div class="row">
		<div class="col-md-6">
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>Nombre</th>
						<th>tipo</th>
						<th>precio</th>
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



</body>
</html>
