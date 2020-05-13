<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<style>
.blue-button {
	background: #25A6E1;
	filter: progid: DXImageTransform.Microsoft.gradient( startColorstr='#25A6E1',
		endColorstr='#188BC0', GradientType=0);
	padding: 3px 5px;
	color: #fff;
	font-family: 'Helvetica Neue', sans-serif;
	font-size: 12px;
	border-radius: 2px;
	-moz-border-radius: 2px;
	-webkit-border-radius: 4px;
	border: 1px solid #1A87B9
}

table {
	font-family: "Helvetica Neue", Helvetica, sans-serif;
	width: 50%;
}

th {
	background: SteelBlue;
	color: white;
}

td, th {
	border: 1px solid gray;
	width: 25%;
	text-align: left;
	padding: 5px 10px;
}

.error {
	color: red;
}
</style>
</head>
<body>
	<div align="center">
		<form:form method="post" modelAttribute="product"
			action="/MiniShop/updateProduct" enctype="multipart/form-data">
			<table>
				<tr>
					<th colspan="2">Edit Product</th>
				</tr>
				<tr>
				<td>Id</td>
				<td><form:input path="id" readonly="true" /></td>				
				</tr>
				<tr>
				<td><form:input path="productName" type="text" /></td>
				</tr>
			</table>
		</form:form>
	</div>
</body>
</html>