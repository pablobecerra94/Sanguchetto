<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<title>Stock disponible</title>
<!-- Bootstrap core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<!-- Bootstrap theme -->
<link href="css/bootstrap-theme.min.css" rel="stylesheet">
</head>
<body>
	<div class="page-header">
		<h1>Sanguchetto</h1>
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
			
					<c:forEach items="${sangucheto}" var="object">
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