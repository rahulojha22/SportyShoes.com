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
	<% if(Uname==null){ %>
		<table align='left'><td style='text-align: center' width='120 px'>
	<a href="AdminLogin.jsp"><p style="color:black;font-size:20px;">Admin Login</p></a>
	</td></table>		
		<table align='right'><td style='text-align: center' width='200 px'><td>
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
	</td><td style='text-align: center' width='150 px'>
	<a href="CusSearch.jsp"><p style="color:red;font-size:20px;">Customise Search</p></a>
	</td></table>
</div>
<div class="div-2">
	<% List<Product> list=(List<Product>)request.getAttribute("list"); %>
<table align='center' cellspacing='5px' width='50%'>	
	<%for(Product pr:list){ %>
		<tr><td style='text-align: center' width='30%' height="200px">
		<form action="UserCart" method="post">
			<%= pr.getProdName() %><br>
			<%= pr.getProdCat() %>-
			<%= pr.getProdGender() %><br>
		<table align='center'>
			<tr><td>Size:</td>
			<%for(ShoesSize sh:pr.getShoeSizes()){%>
			<td><%= sh.getShoeSize()%></td>	
		<% } %>
			</tr>
			<tr><td>Price:</td>
			<%for(ShoesSize sh:pr.getShoeSizes()){%>
			<td>|<%= sh.getProdPrice()%>Rs.|</td>	
		<% } %>
			</tr>				
		</table>
		Select Size:<select name="ProdSize">
			<%for(ShoesSize sh:pr.getShoeSizes()){%>
				<option value="<%=sh.getShoeSize() %>"><%=sh.getShoeSize() %></option>
			<%}%>
		</select>
		<input type="hidden" name="ProdID" value="<%= pr.getProdID()%>">
		<input type="submit" value="Add to Cart">
		</form>
	</td></tr>
	<% } %>
</table>
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
	</td><td style='text-align: center' width='150 px'>
	<a href="CusSearch.jsp"><p style="color:blue;font-size:20px;">Customise Search</p></a>
	</td></table>
</div>
</body>
</html>