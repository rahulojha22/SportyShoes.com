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
	<table align='center'><td style='text-align: center' width='120 px'>
	<h2>User Cart</h2>
	</td></table>
</div>
<div class="div-2">
	<div>
	<% List<PurchaseList> cartList=(List<PurchaseList>)request.getAttribute("cartList"); %>
<form action="PurDetail" method="post">
<table align='center' cellspacing='5px' width='100%'>
	<tr><td><table>
	<%int j=0; %>
	<%int amount=0; %>
	<%for(PurchaseList cl:cartList){ %>
	<%j++; %>
		<tr><td style='text-align: center' width='30%'>
			<h3>Product <%= j %>:</h3><%= cl.getProdName() %><br>

			<input type="hidden" name="prodID<%=j%>" value="<%=cl.getProdID()%>">
			<input type="hidden" name="size<%=j%>" value="<%=cl.getShoeSize()%>">

			<%= cl.getProdCat() %>-
			<%= cl.getProdGender() %><br>
			Size: <%= cl.getShoeSize() %><br>
			Price: <%= cl.getProdPrice() %>Rs.<br>
			<% amount=amount+cl.getProdPrice(); %>
		Select Quantity:<select name="BuyQty<%=j%>">
			<%if(cl.getProdQty()>=6){%>
			<%for(int i=0;i<6;i++){%>
				<option value="<%=i+1 %>"><%=i+1 %></option><br>
			<%}%>
		<%}else{%>
			<%for(int i=0;i<cl.getProdQty();i++){%>
				<option value="<%=i+1 %>"><%=i+1 %></option>
			<%}%><br>
		<%}%>
		</select><br>
		<a href="DeleteFromCart?ProdID=<%=cl.getProdID()%>&shoeSize=<%=cl.getShoeSize() %>"><p style="color:blue;font-size:15px;">Delete</p></a>
	</td></tr>
	<% } %></table>
	</td><td>
	<%if(j!=0){%>
		<h2>Total Amount = <%= amount %> Rs.<br></h2>
		Delivery Address: <input type="text" name="DelAddress" required="required"><br>
		<input type="hidden" name="TotalProduct" value="<%=j%>">
		<input type="submit" value="Buy All">
	<%}%>
	<%if(j<5){%>
		<a href="/"><input type="button" value="Add More Product"></p></a>
	<%}%>	
	<% String Message=(String)request.getAttribute("Message"); %>
		<%if(Message==null){%>
		<%}else {%>
	<h1>*<%= Message%></h1>
	<%} %>
	</td></tr>
</table>
</form>
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
	<a href="CusSearch.jsp"><p style="color:blue;font-size:20px;">Customise Search</p></a>
	</td></table>
</div>
</body>
</html>