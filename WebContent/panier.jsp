<%@ page import="llb.eboutique.model.*" %>
<%@ page import="llb.eboutique.dao.*" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	User auth = (User) request.getSession().getAttribute("auth");
        if(auth!= null) { 
        	//request.setAttribute("auth", auth);
        	response.sendRedirect("index.jsp");
        }
        
        List<Product> cartItems = (List<Product>) request.getSession().getAttribute("cartItems");
        ProductDao prdao = new ProductDao(DbConnexion.getConnection());
        List<Product> products = prdao.getAllProducts();
    %>
<!DOCTYPE html>
<html>
<head>
<title>Panier</title>
<%@include file="includes/header.jsp"%>
</head>
<body>
	<%@include file="includes/navbar.jsp"%>
	
	<div class="container">
		<div class="d-flex py-3"><h3>Total: 500$</h3><a class="mx-3 btn btn-primary" href="#">Payer</a></div>
		<table class="table table-light">
	        <thead>
	            <tr>
	                <th>Image</th>
	                <th>Nom du produit</th>
	                <th>Description</th>
	                <th>Prix</th>
	                <th>Quantité</th>
	                <th>Total</th>
	                <th>Action</th>
	            </tr>
	        </thead>
	        <tbody>
	            <% if (cartItems != null && !cartItems.isEmpty()) {
	                double grandTotal = 0;
	                for (Product item : cartItems) {
	                    double total = item.getPrice() * item.getQuantity();
	                    grandTotal += total;
	            %>
	            <tr>
	                <td><img src="imagess/<%= item.getImageUrl() %>" alt="<%= item.getName() %>" style="width: 50px; height: 50px;"></td>
	                <td><%= item.getName() %></td>
	                <td><%= item.getDescription() %></td>
	                <td><%= item.getPrice() %> $</td>
	                <td><%= item.getQuantity() %></td>
	                <td><%= total %> $</td>
	                <td>
	                    <a href="removeFromCart?productId=<%= item.getId() %>" class="btn btn-danger btn-sm">Supprimer</a>
	                </td>
	            </tr>
	            <% } %>
	            <tr>
	                <td colspan="5" class="text-right"><strong>Total général :</strong></td>
	                <td colspan="2"><strong><%= grandTotal %> $</strong></td>
	            </tr>
	            <% } else { %>
	            <tr>
	                <td colspan="7" class="text-center">Votre panier est vide.</td>
	            </tr>
	            <% } %>
	        </tbody>
    	</table>
	</div>
	

	
	<%@include file="includes/footer.jsp"%>
</body>
</html>