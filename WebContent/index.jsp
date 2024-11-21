<%@ page import="llb.eboutique.connexion.DbConnexion" %>
<%@ page import="llb.eboutique.model.*" %>
<%@ page import="llb.eboutique.dao.*" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	User auth = (User) request.getSession().getAttribute("auth");
        if(auth!= null) { 
        	request.setAttribute("auth", auth);
        }
        
        ProductDao prdao = new ProductDao(DbConnexion.getConnection());
        List<Product> products = prdao.getAllProducts();
    %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<%@include file="includes/header.jsp"%>
</head>
<body>
	<%@include file="includes/navbar.jsp"%>

	<%-- <% out.print(DbConnexion.getConnection()); %> --%>
	
	<div class="container">
		<div class="card-header my-3">Tous les articles</div>
		<div class="row">
		<%
        if(!products.isEmpty()) { 
        	for(Product p:products) { 
        		//out.println(p.getName()); %>
        		<div class="col-md-3 my-3">
				<div class="card w-100" style="width: 18rem;">
					  <img src="imagess/<%= p.getImageUrl() %>" class="card-img-top" alt="...">
					  <div class="card-body">
					    <h5 class="card-title"><%= p.getName() %></h5>
					    <h5 class="category"><%= p.getCategoryId() %></h5>
					    <p class="card-text"><%= p.getDescription() %></p>
					    <h5 class="price"><%= p.getPrice() %>$</h5>
					    <div class="mt-3 d-flex justify-content-between">
					    	<a href="#" class="btn btn-primary">Ajouter</a>
					  	</div>
					  </div>
				</div>
				
			</div>
        <%	}
        }
        %>
			
		</div>
	</div>
	
	<%@include file="includes/footer.jsp"%>
</body>
</html>