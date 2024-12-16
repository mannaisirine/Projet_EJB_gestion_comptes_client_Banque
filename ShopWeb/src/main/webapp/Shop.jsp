<%@page import="tn.enis.dto.ProductDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<form action="ShopController" method="post">
	<table>
		<tr>
			<td>name</td>
			<td><input type="text" name="name" /></td>
		</tr>
		<tr>
			<td>quantity</td>
			<td><input type="text" name="quantity" /></td>
		</tr>
		<tr>
			<td>price</td>
			<td><input type="text" name="price" /></td>
		</tr>
		<tr>
			<td></td>
			<td><input type="submit" name="action" value="Add" /></td>
		</tr>
	</table>
</form>
<hr />
<h1>List of Products</h1>
<%
List<ProductDto> products = (List<ProductDto>) request.getAttribute("products");
%>
<table>
	<tr>
		<td>name</td>
		<td>quantity</td>
		<td>price</td>
		<td>Delete</td>
	</tr>
	<%
	if (products != null && !products.isEmpty()) {
		for (ProductDto product : products) {
	%>
	<tr>
		<td><%=product.getName()%></td>
		<td><%=product.getQuantity()%></td>
		<td><%=product.getPrice()%></td>
		<td><a
			href="ShopController?action=Delete&name=<%=product.getName()%>">delete</a>
	</tr>
	<%
	}
	}
	%>
</table>