<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Compte</title>
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body>
	<header class="bg-light py-3">
		<div class="container">
			<h1 class="display-4">
				<center>Gestion des Comptes</center>
			</h1>
			<p class="lead">
			<center>
				Bienvenue
				<center>
					</p>
		</div>
	</header>
	<h1>Edit Compte</h1>
	<c:if test="${not empty editCompte}">
		<div class="bg-lightgray py-3">
			<form action="CompteController" method="post">
				<tr>
					<td><h3>Solde</h3></td>
					<input type="hidden" name="action" value="DoEdit">
					<input type="hidden" name="rib" value="${editCompte.rib}">
					<input type="text" name="solde" value="${editCompte.solde}"
						placeholder="Solde">
					<input type="hidden" name="clientCin"
						value="${editCompte.client.cin}">
					<input type="submit" value="Update Compte"
						class="btn btn-danger btn-sm">
				</tr>
			</form>
		</div>
	</c:if>
	<a href="comptes.jsp">Back to List</a>

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
