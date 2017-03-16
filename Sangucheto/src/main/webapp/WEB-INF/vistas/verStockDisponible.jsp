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
	<div class="page-header">
		<h1>Stock Disponible</h1>
	</div>
	<div class="row">
		<div class="col-md-6">
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
						<td>${object.key.nombre}</td>
						<td>${object.value}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>

</body>
</html>