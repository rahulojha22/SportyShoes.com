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
<div class="div-1" style="height:150px;">
	<h1><a href="AdminHome.jsp"><p style="color:blue;">SportyShoes</p></a></h1><br>
	<table align='right'><tr><td style='text-align: center'>
	<a href="AdminProfile"><p style="color:blue;"><h2><%= AdDetail.getAdName()%></h2></p></a>
	<a href=AdLogout><input type="button" size='5' value="Logout"></a></td></tr></table>
	<table align='center'><td style='text-align: center'>
	<h2>Add New Shoes</h2>
	</td></table>	
</div>
<div class="div-2">
	<form action="AddShoe" method="post" align="center">
	<table border="1" align="center" bgcolor="pink">
		<tr><td>Product ID:</td><td><input type="text" name="ProdID" required="required"></td>
		<td>Product Name:</td><td><input type="text" name="ProdName" required="required"></td></tr>
		<tr><td>Gender:</td><td>
				<input type="radio" name="ProdGender" required value="Male">Male
				<input type="radio" name="ProdGender" required value="Female">Female
				<input type="radio" name="ProdGender" required value="Kids">Kids
							</td>
		<td>Category:</td><td><select name="ProdCat">
								<option value="Running">Running</option>
								<option value="Sports">Sports</option>
								<option value="Sneakers">Sneakers</option>
								<option value="Gym">Gym</option>
								<option value="Walking">Walking</option>
							</select></td></tr>
		<tr><td>Size:
					<br><input type="checkbox" name="sz2" value="2">2
					<br><input type="checkbox" name="sz3" value="3">3
					<br><input type="checkbox" name="sz4" value="4">4
					<br><input type="checkbox" name="sz5" value="5">5
					<br><input type="checkbox" name="sz6" value="6">6
					<br><input type="checkbox" name="sz7" value="7">7
					<br><input type="checkbox" name="sz8" value="8">8
					<br><input type="checkbox" name="sz9" value="9">9
					<br><input type="checkbox" name="sz10" value="10">10</td>
		<td>Stock:
				<br>Size 2:<input type="number" name="st2">
				<br>Size 3:<input type="number" name="st3">
				<br>Size 4:<input type="number" name="st4">
				<br>Size 5:<input type="number" name="st5">
				<br>Size 6:<input type="number" name="st6">
				<br>Size 7:<input type="number" name="st7">
				<br>Size 8:<input type="number" name="st8">
				<br>Size 9:<input type="number" name="st9">
				<br>Size 10:<input type="number" name="st10"></td>
		<td>Price:</td><td>
				<br>Size 2:<input type="number" name="ProdPrice2">Rs.
				<br>Size 3:<input type="number" name="ProdPrice3">Rs.
				<br>Size 4:<input type="number" name="ProdPrice4">Rs.
				<br>Size 5:<input type="number" name="ProdPrice5">Rs.
				<br>Size 6:<input type="number" name="ProdPrice6">Rs.
				<br>Size 7:<input type="number" name="ProdPrice7">Rs.
				<br>Size 8:<input type="number" name="ProdPrice8">Rs.
				<br>Size 9:<input type="number" name="ProdPrice9">Rs.
				<br>Size 10:<input type="number" name="ProdPrice10">Rs.</td></tr>
	</table>
	<br><input type="submit" value="Add to list">
		<input type="reset" value="Reset">
	<br><br><a href=AdminHome.jsp><input type="button" size='5' value="Admin HomePage"></a>
			<a href=ManageProd.jsp><input type="button" size='5' value="Back"></a>
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