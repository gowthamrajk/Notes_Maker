<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>RemindMe</title>
<style>
input[type=email],[type=text],[type=password], select {
    width: 135%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

input[type=submit] {
	width: 135%;
	background-color: #4CAF50;
	color: white;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

input[type=submit]:hover {
	background-color: #45a049;
}

.id1 {
	background: #F2F4F4;
	width: 600px;
}
</style>
</head>
<center>
	<body>
		<center>
			<h1>RemindMe</h1>
		</center>
		<div class="id1">
			<form action="loginSuccess.do"  method="post"  onsubmit="return validateUser()">
				<table cellspacing="2">
					
					<tr>
						<td><center><h2>Login</h2></center></td>
					</tr>
					
					<tr>
						<td><div id="error" style="color: red; display: block">${error}</div></td>
					</tr>
					<tr>
						<td><div id="message" style="color: red; display: block">${message}</div></td>
					</tr>
					 <tr><td><div id="email_error" style="display:none; color:red;">Email Id cannot be empty</div></td></tr>
					<tr>
						<td><input type="email" placeholder="email" name="email" id="email"></td>
					</tr>
					 <tr><td><div id="password_error" style="display:none; color:red;">Password cannot be empty</div></td></tr>
					<tr>
						<td><input type="password" placeholder="password"
							name="password" id="password" ></td>
					</tr>
					<tr>
						<td><input type="submit" id="submit" value="Login">
					</tr>
					
					<tr>
						<td><br><center>Not a member?<a href="signup.do">Sign Up</a></center></td>
					</tr>
					
				</table>
			</form>
		</div>

	</body>
</center>
</html>

