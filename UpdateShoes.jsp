<%@page import="SportyShoes.com.AdminLoginDetail"%>
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
        position: absolute;
        top: 30%;
        width: 100%;
    }
    .div-3 {
    	position: absolute;
        bottom: 0px;
        height:100px;
        width: 100%;
        background-color: grey;
    }
</style>

</head>
<body>
<% AdminLoginDetail AdDetail=new AdminLoginDetail(); %>
<% String ProdID1=(String)request.getAttribute("ProdID"); %>
<% String Control=(String)request.getAttribute("Control"); %>
<div class="div-1" style="height:150px;">
	<h1><a href="AdminHome.jsp"><p style="color:blue;">SportyShoes</p></a></h1><br>
	<table align='right'><tr><td style='text-align: center'>
	<a href="AdminProfile"><p style="color:blue;"><h2><%= AdDetail.getAdName()%></h2></p></a>
	<a href=AdLogout><input type="button" size='5' value="Logout"></a></td></tr></table>
	<table align='center'><td style='text-align: center'>
	<h2>Update Shoes</h2>
	</td></table>
</div>
<div class="div-2">
	<form action="UpdateShoes" method="post" align="center">
	<table border="1" align="center" bgcolor="pink">
	<%if(ProdID1!=null){ %>
		<input type="hidden" name="ProdID" value="<%=ProdID1%>">
		<input type="hidden" name="Control" value="<%=Control%>">
	<%}else{ %>
		<tr><td>Product ID:</td><td><input type="text" name="ProdID" required="required"></td>
	<%} %>
		<tr><td>Shoe Size:</td><td><input type="number" name="shoeSize" required="required"></td>
		<tr><td>Update Price:</td><td><input type="number" name="ProdPrice" required="required"></td>
		<tr><td>Update Stock:</td><td><input type="number" name="stock" required="required"></td>
	</table>
	<br><input type="submit" value="Update Shoe">
		<input type="reset" value="Reset">
	<br><br><a href=AdminHome.jsp><input type="button" size='5' value="Admin HomePage"></a>
	<%if(ProdID1!=null){ %>
		<a href=ShoesList><input type="button" size='5' value="Back"></a>
	<%}else{ %>
		<a href=ManageProd.jsp><input type="button" size='5' value="Back"></a>
		<%} %>
</form>
<% String Message=(String)request.getAttribute("Message"); 
	if(Message==null){
	}else {%>
<h1>*<%= Message%></h1>
<%} %>
</div>
<div class="div-3">
	<table align="left"><td style='text-align: center' width='180 px'>
	<h2>Developed By:<br>Rahul Ojha</h2>
	</td></table>	
	
</div>
</body>
</html>