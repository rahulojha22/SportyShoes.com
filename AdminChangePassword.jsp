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
<% Admin admin=(Admin)request.getAttribute("admin"); %>
<div class="div-1" style="height:150px;">
	<h1><a href="AdminHome.jsp"><p style="color:blue;">SportyShoes</p></a></h1><br>
	<table align='right'><tr><td style='text-align: center'>
	<a href="AdminProfile"><p style="color:blue;"><h2><%= AdDetail.getAdName()%></h2></p></a>
	<a href=AdLogout><input type="button" size='5' value="Logout"></a><br></td></tr></table>
	<table align='center'><td style='text-align: center'>
	<h2>Change Password</h2>
	</td></table>
</div>
<div class="div-2">
<form action="AdminChangePassword" method="post" align="center">
	<table border="1" align="center" bgcolor="cyan">
		<tr><br><br></tr>
		<tr><td><b>New Password:</b></td><td><input type="text" name="NewAdPass"></td></tr>
	</table>
	<br><input type="submit" value="Change Password">
		<input type="reset" value="Reset">
</form>
	<table align="center" style="text-align: center">
	<tr><td><br><br><a href=AdminHome.jsp><input type="button" size='5' value="Admin HomePage"></a>
	</td></tr></table>
</div>
<div class="div-3">
	<table align="left"><td style='text-align: center' width='180 px'>
	<h2>Developed By:<br>Rahul Ojha</h2>
	</td></table>	
	
</div>
</body>
</html>