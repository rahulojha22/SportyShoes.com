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
<div class="div-1" style="height:150px;">
	<h1><a href="/"><p style="color:blue;">SportyShoes</p></a></h1><br>	
	
	<% UserLoginDetail ud=new UserLoginDetail(); String Uname=ud.getUname();%> 
	<% if(Uname==null){ %>
		<table align='right'><td style='text-align: center' width='200 px'>
		<a href="UserLogin.jsp"><p style="color:black;font-size:20px;">User Login/SignUp</p></a>
		</td></table>
	<%}else {%>
		<table align='right'><td style='text-align: center' width='200 px'>
		<%= ud.getUname() %>
		<a href=UserLogout><input type="button" size='5' value="Logout"></a><br>
		<a href=ShopingCart><input type="button" size='5' value="Cart"></a>
		</td></table>
	<%} %>
	
	<table align='center'><td style='text-align: center' width='120 px'>
	<a href="GenSearch?prodGender=Male"><p style="color:red;font-size:20px;">Men</p></a>
	</td><td style='text-align: center' width='120 px'>
	<a href="GenSearch?prodGender=Female"><p style="color:red;font-size:20px;">Women</p></a>
	</td><td style='text-align: center' width='120 px'>
	<a href="GenSearch?prodGender=Kids"><p style="color:red;font-size:20px;">Kids</p></a>
	</td></table>
</div>
<div class="div-2">
	<form action="CustomSearch" method="post" align="center">
	<table border="1" align="center" bgcolor="cyan">
		<tr><td>Gender:</td><td>
				<input type="radio" name="prodGender" value="Male" required="required">Male
				<input type="radio" name="prodGender" value="Female" required="required">Female
				<input type="radio" name="prodGender" value="Kids" required="required">Kids
		</td></tr>
		<tr><td>Category:</td><td><select name="ProdCat">
								<option value="Running">Running</option>
								<option value="Sports">Sports</option>
								<option value="Sneakers">Sneakers</option>
								<option value="Gym">Gym</option>
								<option value="Walking">Walking</option>
							</select></td></tr>
	</table>
	<br><input type="submit" value="Search">
		<input type="reset" value="Reset">
		<a href="/"><input type="button" size='5' value="Back"></a>
</form>
<% String Message=(String)request.getAttribute("Message"); 
	if(Message==null){
	}else {%>
<h1>*<%= Message%></h1>
<%} %>
</div>
<div class="div-3">
	<table align='left'><td style='text-align: center' width='180 px'>
	<h2>Developed By:<br>Rahul Ojha</h2>
	</td></table>
	
	<table align='center'><td style='text-align: center' width='120 px'>
	<h2>Products:</h2>
	</td><td style='text-align: center' width='120 px'>
	<a href="CatSearch?prodCat=Sports"><p style="color:blue;font-size:20px;">Sports</p></a>
	</td><td style='text-align: center' width='120 px'>
	<a href="CatSearch?prodCat=Sneakers"><p style="color:blue;font-size:20px;">Sneakers</p></a>
	</td><td style='text-align: center' width='120 px'>
	<a href="CatSearch?prodCat=Walking"><p style="color:blue;font-size:20px;">Walking</p></a>
	</td><td style='text-align: center' width='120 px'>
	<a href="CatSearch?prodCat=Running"><p style="color:blue;font-size:20px;">Running</p></a>
	</td><td style='text-align: center' width='120 px'>
	<a href="CatSearch?prodCat=Gym"><p style="color:blue;font-size:20px;">Gym</p></a>
	</td></table>
</div>
</body>
</html>