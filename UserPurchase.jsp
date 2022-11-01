<%@page import="SportyShoes.com.*"%>
<%@page import="java.util.List"%>
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
<div class="div-1" style="height:150px;">
	<h1><a href="/"><p style="color:blue;">SportyShoes</p></a></h1><br>
		
<% UserLoginDetail ud=new UserLoginDetail(); String Uname=ud.getUname();%>
	<table align='right'><td style='text-align: center' width='200 px'>
		<%= ud.getUname() %>
		<a href=UserLogout><input type="button" size='5' value="Logout"></a><br>
		</td></table>
	<table align='center'><td style='text-align: center' width='200 px'>
	<h2>Purchase List</h2>
	</td></table>
</div>
<div class="div-2">
	<div">
	<% List<PurchaseList> PurList=(List<PurchaseList>)request.getAttribute("PurList"); %>
<table align='center' cellspacing='5px' width='100%'>
	<tr><td><table>
	<%int j=0; %>
	<%int amount=0; %>
	<%String Address=null; %>
	<%String OrderID=null; %>
	
	<%for(PurchaseList cl:PurList){ %>
	<%j++; %>
		<tr><td style='text-align: center' width='30%'>
			<h3>Product <%= j %>:</h3><%= cl.getProdName() %><br>
			<% Address=cl.getDelAddress(); %>
			<% OrderID=cl.getOrderID(); %>
			<%= cl.getProdCat() %>-
			<%= cl.getProdGender() %><br>
			Size: <%= cl.getShoeSize() %><br>
			Quantity: <%= cl.getProdQty() %><br>
			Price:<%= cl.getProdPrice() %>Rs.<br>
			<% amount=amount+cl.getProdPrice(); %>
	</td></tr>
	<% } %></table>
	</td><td>
		Order ID = <%= OrderID %><br>
		Buyer = <%= ud.getUname() %><br>
		Seller = SportyShoes.com<br>
		Deliver Address = <%= Address %><br>
		<h2>Total Amount = <%= amount %> Rs.<br></h2>		
		<a href="/"><input type="button" value="Buy Another Products"></p></a>
	</td></tr>
</table>
</div>
<div class="div-3">
	<table align='left'><td style='text-align: center' width='180 px'>
	<h2>Developed By:<br>Rahul Ojha</h2>
	</td></table>
	
	<table align='center'><td style='text-align: center' width='120 px'>
	<h2>Products:</h2>
	</td><td style='text-align: center' width='120 px'>
	<a href="CatSearch"><p style="color:blue;font-size:20px;">Sports</p></a>
	</td><td style='text-align: center' width='120 px'>
	<a href="CatSearch"><p style="color:blue;font-size:20px;">Sneakers</p></a>
	</td><td style='text-align: center' width='120 px'>
	<a href="CatSearch"><p style="color:blue;font-size:20px;">Walking</p></a>
	</td><td style='text-align: center' width='120 px'>
	<a href="CatSearch"><p style="color:blue;font-size:20px;">Running</p></a>
	</td><td style='text-align: center' width='120 px'>
	<a href="CatSearch"><p style="color:blue;font-size:20px;">Gym</p></a>
	</td><td style='text-align: center' width='150 px'>
	<a href="CusSearch"><p style="color:blue;font-size:20px;">Customise Search</p></a>
	</td></table>
</div>
</body>
</html>