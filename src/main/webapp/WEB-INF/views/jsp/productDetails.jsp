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
.error{
	color: red;
}
</style>
</head>
<body>
<div align="center">
	<form:form method="post" modelAttribute="product"
		action="/MiniShop/addProduct" enctype="multipart/form-data">
		<table>
			<tr>
				<th colspan="2">Add Product</th>
			</tr>
			<tr>
				<form:hidden path="id" />
				<td><form:label path="productName">Product Name:</form:label></td>
				<td><form:input type="text" path="productName"></form:input><br>
				 <form:errors path="productName" cssClass="error" />
				</td>
			</tr>
			<tr>
				<td><form:label path="typeProduct">Product Type:</form:label></td>
				<td><form:input type="text" path="typeProduct"></form:input><br>
				 <form:errors path="typeProduct" cssClass="error" />
			</tr>
			<tr>
				<td><form:label path="description">Description:</form:label></td>
				<td><form:input type="text" path="description"></form:input><br>
				<form:errors path="description" cssClass="error" />
			</tr>
			<tr>
				<td>Image</td>
				<td><input name="file" type="file" /></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" class="blue-button" /></td>
			</tr>
		</table>
	</form:form>
	</br>
<h3>Product List</h3>
<c:if test="${!empty listOfProducts}">
	<table class="tg">
	<tr>
		<th width="80">Id</th>
		<th width="120">Product Name</th>
		<th width="120">Product Type</th>
		<th width="120">Description</th>
		<th width="120">Image </th>
		<th width="60">Edit</th>
		<th width="60">Delete</th>
	</tr>
	<c:forEach items="${listOfProducts}" var="product">
		<tr>
			<td>${product.id}</td>
			<td>${product.productName}</td>
			<td>${product.typeProduct}</td>
			<td>${product.description}</td>
			<td> <img alt="" src="${product.imagePath}" width="200px" height="auto" > </td>
			<td><a href="<c:url value='/updateProduct/${product.id}' />" >Edit</a></td>
			<td><a href="<c:url value='/deleteProduct/${product.id}' />" >Delete</a></td>
		</tr>
	</c:forEach>
	</table>
</c:if>
</div>
</body>
</html>