<%@page import="org.springframework.web.servlet.ModelAndView"%>
<%@page import="java.util.Optional"%>
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
        position: absolute;
        top: 40%;
        width: 100%;
        text-align: center;
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
<div class="div-1" style="height:150px;">
	<h1><a href="AdminHome.jsp"><p style="color:blue;">SportyShoes</p></a></h1><br>
	<table align='right'><tr><td style='text-align: center'>
	<a href="AdminProfile"><p style="color:blue;"><h2><%= AdDetail.getAdName()%></h2></p></a>
	<a href=AdLogout><input type="button" size='5' value="Logout"></a></td>
	</td></tr></table>
	<table align='center'><td style='text-align: center'>
	<h2>Admin HomePage</h2>
	</td></table>	
</div>
<div class="div-2">
	<table align='center'><tr>
	<a href="ManageProd.jsp"><p style="color:blue;"><h3>Product Management</h3></p></a>
	</tr><tr>
	<a href="ManageCx.jsp"><p style="color:blue;"><h3>Customer Management</h3></p></a>
	</tr><tr>
	<a href="PurReport.jsp"><p style="color:blue;"><h3>Purchase Report</h3></p></a>
	</tr></table>
</div>
<div class="div-3">
	<table align="left"><td style='text-align: center' width='180 px'>
	<h2>Developed By:<br>Rahul Ojha</h2>
	</td></table>	
</div>
</body>
</html>