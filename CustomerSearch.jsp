<%@page import="SportyShoes.com.*"%>
<%@page import="java.util.*"%>
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
<% Customer cx=(Customer)request.getAttribute("cx"); %>
<div class="div-1" style="height:150px;">
	<h1><a href="AdminHome.jsp"><p style="color:blue;">SportyShoes</p></a></h1><br>
	<table align='right'><tr><td style='text-align: center'>
	<a href="AdminProfile"><p style="color:blue;"><h2><%= AdDetail.getAdName()%></h2></p></a>
	<a href=AdLogout><input type="button" size='5' value="Logout"></a></td></tr></table>
	<table align='center'><td style='text-align: center'>
	<h2>Customer Details</h2>
	</td></table>
</div>
<div class="div-2">
	<form action="SearchCx" method="post" align="center">
	<table border="1" align="center" bgcolor="pink">
		<tr><td>Customer Username:</td><td><input type="text" name="username" required="required"></td>
		<td><input type="submit" value="Search Customer"></td>
		<td><input type="reset" value="Reset"></td>
	</table>
</form>
	<table border="1" align="center">
		<tr><br><br></tr>
		<tr><td>Customer Username:</td><td><%= cx.getUsername() %></td></tr>
		<tr><td>Customer Name:</td><td><%= cx.getUname() %></td></tr>
		<tr><td>Customer Age:</td><td><%= cx.getUage() %></td></tr>
		<tr><td>Customer Gender:</td><td><%= cx.getUgender() %></td></tr>
		<tr><td>Customer Mobile Number:</td><td><%= cx.getUnum() %></td></tr>
	</table>
	<table align="center" style="text-align: center">
	<tr><td><br><br><a href=AdminHome.jsp><input type="button" size='5' value="Admin HomePage"></a>
			<a href=SearchCx.jsp><input type="button" size='5' value="Back"></a>
	</td></tr></table>
</div>
<div class="div-3">
	<table align="left"><td style='text-align: center' width='180 px'>
	<h2>Developed By:<br>Rahul Ojha</h2>
	</td></table>	
	
</div>
</body>
</html>