<%@page import="tn.enis.entity.Client"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Edit Client</title>
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<meta charset="UTF-8">
</head>
<body>
	<header class="bg-light py-3">
		<div class="container">
			<h1 class="display-4">
				<center>Gestion des Clients</center>
			</h1>
			<p class="lead">
			<center>
				Bienvenue
				<center>
					</p>
		</div>
	</header>

	<h2>Edit Client</h2>
	<div class="bg-lightgray py-3">
		<%
    Client client = (Client) request.getAttribute("client");
    if (client == null) {
        out.println("<p>Client not found!</p>");
    } else {
    %>
		<div class="bg-lightgray py-3">
			<form action="ClientController" method="post">
				<input type="hidden" name="action" value="Update" /> <input
					type="hidden" name="cin" value="<%= client.getCin() %>" />
				<table>
					<tr>
						<td>CIN:</td>
						<td><%= client.getCin() %></td>
					</tr>
					<tr>
						<td>Nom:</td>
						<td><input type="text" name="nom"
							value="<%= client.getNom() %>" required /></td>
					</tr>
					<tr>
						<td>Prenom:</td>
						<td><input type="text" name="prenom"
							value="<%= client.getPrenom() %>" required /></td>
					</tr>
					<tr>
						<td></td>
						<td><input type="submit" value="Update"
							class="btn btn-warning btn-sm" /></td>
					</tr>
				</table>
			</form>
		</div>
		<% } %>
	</div>
	<footer class="bg-lightgray py-3 fixed-bottom">
		<div class="container">
			<p class="text-center mb-0">© 2024 Gestion des Clients. Tous
				droits réservés.</p>
		</div>
	</footer>

	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</body>
</html>