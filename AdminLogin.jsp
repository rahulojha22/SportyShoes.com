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
	<table align='center'><td style='text-align: center'>
	<h2>Admin Login Page</h2>
	</td></table>	
			
</div>
<div class="div-2">
<form action="AdminLogin" method="post" align="center">
	<table border="1" align="center" bgcolor="cyan">
		<tr><td>Admin Username:</td><td><input type="text" name="AdUname" required="required"></td></tr>
		<tr><td>Admin Password:</td><td><input type="password" name="AdPass" required="required"></td></tr>
	</table>
	<br><input type="submit" value="Login">
		<input type="reset" value="Reset">
	<br><br><a href=AdminRegister.jsp><input type="button" size='5' value="Register New Admin"></a>
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