<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Comptes</title>
<!-- Include Bootstrap CSS -->
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

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

	<div class="bg-lightgray py-3">
		<h1>Comptes</h1>

		<div>
			<h5>Ajouter un Compte</h5>
		</div>
		<form action="CompteController" method="post" class="mb-3">
			<input type="hidden" name="action" value="Add">
			<div class="mb-3">
				<input type="text" class="form-control" name="solde"
					placeholder="Solde"> <input type="hidden" name="clientCin"
					value="${sessionScope.clientCin}">
			</div>
			<button type="submit" class="btn btn-primary">Add Compte</button>
		</form>

		<!-- List of comptes for the client -->
		<h2>List of Comptes</h2>
		<table class="table table-striped table-bordered">
			<thead>
				<tr>
					<th>Client</th>
					<th>RIB</th>
					<th>Solde</th>
					<th>Actions</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="compte" items="${comptes}">
					<tr id="tr${compte.rib}">

						<td>${compte.client.nom}</td>
						<td>${compte.rib}</td>
						<td>${compte.solde}</td>
						<td>
							<button onclick="deleteCompte('${compte.rib}')"
								class="btn btn-danger btn-sm">Delete</button> <a
							href="CompteController?action=LoadEdit&rib=${compte.rib}"
							class="btn btn-warning btn-sm">Edit</a>
						</td>

					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<button onclick="window.location.href='/ShopWeb/ClientController'"
		class="btn btn-warning btn-sm">Voir Clients</button>

	<footer class="bg-lightgray py-3 fixed-bottom">
		<div class="container">
			<p class="text-center mb-0">© 2024 Gestion des Clients. Tous
				droits réservés.</p>
		</div>
	</footer>
	<script>
function deleteCompte(rib) {
    swal({
        title: "Are you sure?",
        text: "Once deleted, you will not be able to recover this compte!",
        icon: "warning",
        buttons: true,
        dangerMode: true,
    }).then((willDelete) => {
        if (willDelete) {
            $.ajax({
                url: "CompteController",
                type: "POST",
                data: {
                    action: "Delete",
                    rib: rib
                },
                success: function() {
                    $("#tr" + rib).remove(); 
                    swal("Your compte has been deleted!", {
                        icon: "success",
                    });
                },
                error: function() {
                    swal("Server error! Your compte wasn't deleted!", {
                        icon: "error",
                    });
                }
            });
        }
    });
}
</script>

	<!-- Liens vers les fichiers JavaScript de Bootstrap -->
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</body>
</html>