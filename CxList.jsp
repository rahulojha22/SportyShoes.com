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
<% AdminLoginDetail AdDetail=new AdminLoginDetail(); %>
<% List<Customer> cxList=(List<Customer>)request.getAttribute("cx"); %>
<div class="div-1" style="height:150px;">
	<h1><a href="AdminHome"><p style="color:blue;">SportyShoes</p></a></h1><br>
	<table align='right'><tr><td style='text-align: center'>
	<a href="AdminProfile.jsp"><p style="color:blue;"><h2><%= AdDetail.getAdName()%></h2></p></a>
	<a href=AdLogout><input type="button" size='5' value="Logout"></a></td></tr></table>
	<table align='center'><td style='text-align: center'>
	<h2>Customer List</h2>
	</td></table>
</div>
<div class="div-2">
	<table style="text-align: center">
	<tr><td><br><br><a href=AdminHome.jsp><input type="button" size='5' value="Admin HomePage"></a>
			<a href=ManageCx.jsp><input type="button" size='5' value="Back"></a>
	</td></tr></table>
	<table border="1px" align='center' cellspacing='5px'>
	<tr align="center"><td>Username</td><td>Customer Name</td><td>Age</td><td>Gender</td><td>Mobile Number</td><td>Purchase Report</td></tr>	
	<%for(Customer cx:cxList){ %>
		<tr style='text-align: center'><td>
			<%= cx.getUsername() %></td><td>
			<%= cx.getUname() %></td><td>
			<%= cx.getUage() %></td><td>
			<%= cx.getUgender()%></td><td>
			<%= cx.getUnum()%></td><td>
			<a href="UserPurchaseReport?username=<%=cx.getUsername() %>"><p style="color:blue;font-size:15px;">Report</p></a></td></tr>
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