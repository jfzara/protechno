<%@ page import="llb.eboutique.model.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	User auth = (User) request.getSession().getAttribute("auth");
        if(auth!= null) { 
        	//request.setAttribute("auth", auth);
        	response.sendRedirect("index.jsp");
        }
    %>
<!DOCTYPE html>
<html>
<head>
<title>Connexion</title>
<%@include file="includes/header.jsp"%>
</head>
<body>
	<%@include file="includes/navbar.jsp"%>
		<div class="container">
			<div class="card w-50 mx-auto my-5 ">
				<div class="card-header tex-center">Connexion</div>
				<div class="card-body">
				<form action="user-login" method="post">
					<div class="form-group">
						<label>Nom utilisateur</label>
						<input type="email" class="form-control" name="email" placeholder="Entrez votre email" required>
	                </div>
	                <div class="form-group">
						<label>Mot de passe</label>
						<input type="password" class="form-control" name="password" placeholder="Entrez votre mot de passe" required>
	                </div>
	                
	                <div class="text-center">
						<button type="submit" class="btn btn-primary">Connexion</button>
					</div>
				</form>
				
				</div>
			</div>
		</div>
	
	
	<%@include file="includes/footer.jsp"%>
</body>
</html>