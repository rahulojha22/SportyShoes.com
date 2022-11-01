<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>SportyShoes.com</title>
<style>
	.div-1 {
		text-align: center;
        background-color: cyan;
        width: 100%;
    }
    .div-2 {
        text-align: center;
        position: absolute;
        top: 40%;
        width: 100%;
    }
</style>
</head>
<body>
<div class="div-1" style="height:150px;">
	<br><br><h1>Payment Page</h1>
</div>
<div class="div-2">
	<h2>Card Details</h2>
	<form action="BuyProduct" method="post" align="center">
	<table border="1" align="center" bgcolor="cyan">
		<tr><td>Card No.:</td><td><input type="number" name="CardNo" required="required"></td></tr>
		<tr><td>Name on Card:</td><td><input type="text" name="Name" required="required"></td></tr>
		<tr><td>Mobile No.:</td><td><input type="number" name="MoNum" required="required"></td></tr>
		<tr><td>CVV No.:</td><td><input type="number" name="CVV" required="required"></td></tr>
	</table>
	<br><input type="submit" value="Pay">
		<input type="reset" value="Reset">
		<a href=CartDetail><input type="button" size='5' value="Back to Cart"></a>
</form>
</div>
</body>
</html>