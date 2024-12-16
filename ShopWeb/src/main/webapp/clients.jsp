<%@page import="tn.enis.entity.Client"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>shop</title>

<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

</head>
<body>
	<header class="bg-light py-3">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-auto">
					<img
						src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRcmNH1L27GDxgEaK6WosQmwf4uOJEFJzeMNg&s"
						alt="Votre logo">
				</div>
				<div class="col text-center">
					<h1 class="display-4">Gestion des Clients</h1>
					<p class="lead">Bienvenue</p>
				</div>
			</div>
		</div>
	</header>

	<div class="bg-lightgray py-3">
		<h1>Ajouter un client</h1>
		<form action="ClientController" method="post">
			<table class="table">
				<tr>
					<td><h5>cin</h5></td>
					<td><input type="text" name="cin" class="form-control" /></td>
				</tr>
				<tr>
					<td><h5>nom</h5></td>
					<td><input type="text" name="nom" class="form-control" /></td>
				</tr>
				<tr>
					<td><h5>prenom</h5></td>
					<td><input type="text" name="prenom" class="form-control" /></td>
				</tr>
				<tr>
					<td></td>
					<td><input type="submit" name="action" value="Add" /></td>
				</tr>
			</table>
		</form>

		<hr />
	</div>

	<div class="bg-light">
		<h1>List of Clients</h1>
		<%
	List<Client> clients = (List<Client>) request.getAttribute("clients");
	%>
		<form action="ClientController" method="post">
			<table class="table">
				<tr>
					<td>search</td>
					<td><input type="text" name="search" class="form-control" /></td>
				</tr>
				<tr>
					<td></td>
					<td><input type="submit" name="action" value="search" /></td>
				</tr>
			</table>
		</form>
		<table class="table table-striped">
			<tr>
				<td><h5>cin</h5></td>
				<td><h5>nom</h5></td>
				<td><h5>prenom</h5></td>
				<td><h5>Actions</h5></td>
				<td><h5>Comptes</h5></td>
			</tr>
			<%
		if (clients != null && !clients.isEmpty()) {
			for (Client client : clients) {
		%>
			<tr id="tr<%=client.getCin()%>">

				<td><%=client.getCin()%></td>
				<td><%=client.getNom()%></td>
				<td><%=client.getPrenom()%></td>
				<td>
					<button onclick="deleteClient('<%= client.getCin() %>')"
						class="btn btn-danger">Delete</button> <a
					href="ClientController?action=Edit&cin=<%=client.getCin()%>"
					class="btn btn-warning btn-sm">Edit</a>
				<td><a
					href="ClientController?action=compte&cin=<%=client.getCin()%>"
					class="btn btn-success">AddComptes</a></td>
				<%
		}
		}
		%>
			
		</table>
	</div>


	<script>
	function deleteClient(cin) {
	    console.log("Attempting to delete client with CIN: " + cin); 
	    swal({
	        title: "Are you sure?",
	        text: "Once deleted, you will not be able to recover this client!",
	        icon: "warning",
	        buttons: true,
	        dangerMode: true,
	    }).then((willDelete) => {
	        if (willDelete) {
	            $.ajax({
	                url: "ClientController",
	                type: "POST",
	                data: { action: "Delete", cin: cin },
	                success: function() {
	                    console.log("Deletion successful, removing row for CIN: " + cin); 
	                    $("#tr" + cin).remove();
	                    swal("Your client has been deleted!", { icon: "success" });
	                },
	                error: function(xhr, status, error) {
	                    console.log("Deletion failed: " + error); 
	                    swal("Error! Your client wasn't deleted!", { icon: "error" });
	                }
	            });
	        }
	    });
	}

</script>


	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

	<footer class="bg-lightgray py-3 ">
		<div class="container">
			<p class="text-center mb-0">© 2024 Gestion des Clients. Tous
				droits réservés.</p>
		</div>
	</footer>
</body>

</html>