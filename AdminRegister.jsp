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
<div class="div-1" style="height:150px;">
	<h1><a href="AdminLogin.jsp"><p style="color:blue;">SportyShoes</p></a></h1><br>
	<table align='center'><td style='text-align: center'>
	<h2>Admin Registration Page</h2>
	</td></table>	
			
</div>
<div class="div-2">
<form action="AdminRegister" method="post" align="center">
*Only existing admin can register new admin
	<table border="1" align="center" bgcolor="pink">
		<tr><td>Existing Admin Username:</td><td><input type="text" name="AdUname" required="required"></td>
		<td>Existing Admin Password:</td><td><input type="password" name="AdPass" required="required"></td></tr>
	</table><br>
	<h3>Registration Details</h3>
	<table border="1" align="center" bgcolor="pink">
		<tr><td>New Admin Username:</td><td><input type="text" name="NewAdUname" required="required"></td>
		<td>New Admin Password:</td><td><input type="text" name="NewAdPass" required="required"></td></tr>
		<tr><td>Admin Name:</td><td><input type="text" name="AdName" required="required"></td>
		<td>Admin Age(Min 18 years):</td><td><input type="number" name="AdAge" required="required"></td></tr>
		<tr><td>Gender:</td><td>
				<input type="radio" name="AdGender" required value="Male">Male
				<input type="radio" name="AdGender" required value="Female">Female
				<input type="radio" name="AdGender" required value="Other">Other
							</td>
		<td>Mobile Number:</td><td><input type="number" name="AdNum" required="required"></td></tr>
	</table>
	<br><input type="submit" value="Register">
		<input type="reset" value="Reset">
	<br><br><a href=AdminLogin.jsp><input type="button" size='5' value="Admin Login"></a>
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