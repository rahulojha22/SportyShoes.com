<%@page import="java.util.List"%>
<%@page import="java.time.LocalDate"%>
<%@page import="SportyShoes.com.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>SportyShoes.com</title>
<style>
	.div-1 {
        background-color: yellow;
        width: 100%;
    }
    .div-2 {
        width: 100%;
    }
    .div-3 {
    	position: relative;
        bottom: 0px;
        height:100px;
        width: 100%;
        background-color: grey;
    }
</style>
</head>
<body>
<% AdminLoginDetail AdDetail=new AdminLoginDetail(); %>
<% String prodCat=(String)request.getAttribute("prodCat"); %>
<% List<PurchaseList> purList=(List<PurchaseList>)request.getAttribute("purList"); %>
<div class="div-1" style="height:150px;">
	<h1><a href="AdminHome.jsp"><p style="color:blue;">SportyShoes</p></a></h1><br>
	<table align='right'><tr><td style='text-align: center'>
	<a href="AdminProfile"><p style="color:blue;"><h2><%= AdDetail.getAdName()%></h2></p></a>
	<a href=AdLogout><input type="button" size='5' value="Logout"></a></td></tr></table>
	<table align='center'><td style='text-align: center'>
	<h2>Purchase Report</h2>
	</td></table>
</div>
<div class="div-2">
	<table style="text-align: center">
	<tr><td><br><br><a href=AdminHome.jsp><input type="button" size='5' value="Admin HomePage"></a>
		<%if(prodCat!=null){ %>
			<a href=PurRepByCat.jsp><input type="button" size='5' value="Back"></a>
		<%}else{ %>
			<a href=PurRepByDate.jsp><input type="button" size='5' value="Back"></a>
		<%} %>
	</td></tr></table>
	<table border="1px" align='center' cellspacing='5px'>
	<tr align="center"><td>Order ID</td><td>Customer Name</td><td>Order Date</td><td>Product ID</td><td>Product Name</td>
	<td>Product For</td><td>Product Category</td><td>Product Size</td><td>Product Quantity</td><td>Product Price</td></tr>	
	<%for(PurchaseList pl:purList){ %>
		<tr style='text-align: center'><td>
			<%= pl.getOrderID() %></td><td>
			<%= pl.getUname() %></td><td>
			<%= pl.getProdDate() %></td><td>
			<%= pl.getProdID() %></td><td>
			<%= pl.getProdName()%></td><td>
			<%= pl.getProdGender()%></td><td>
			<%= pl.getProdCat()%></td><td>
			<%= pl.getShoeSize()%></td><td>
			<%= pl.getProdQty()%></td><td>
			<%= pl.getProdPrice()%> Rs.</td></tr>
	<% } %>
	</table>	
</div>
<div class="div-3">
	<table align="left"><td style='text-align: center' width='180 px'>
	<h2>Developed By:<br>Rahul Ojha</h2>
	</td></table>	
	
</div>
</body>
</html>