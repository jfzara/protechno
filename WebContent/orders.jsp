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
<title>Vos commandes</title>
<%@include file="includes/header.jsp"%>
</head>
<body>
	<%@include file="includes/navbar.jsp"%>
	
	
	<%@include file="includes/footer.jsp"%>
</body>
</html>