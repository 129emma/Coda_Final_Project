<%--
  Created by IntelliJ IDEA.
  User: qpen546
  Date: 23/05/2017
  Time: 1:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html class="full">
<head>
    <title>Login Page</title>
    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="css/basicSetting.css" rel="stylesheet">
</head>
<body>
<form id="form" action="Login" method="post">
    <fieldset>
        <legend>Your details</legend>
        <p>Username: <input type="text" name="username" placeholder="Please Enter Your Username" style="width: 300px;"/></P>
        <p>Password: <input type="password" name="password" placeholder="Please Enter Your Password" style="width: 300px;"/></p>
        <input type="submit" name="action" value="login"/>
    </fieldset>
</form>
<div>
    <p style="color: red">${message}</p>
</div>

<a href="Login?action=login"><p>Login</p></a>
<a href="Login?action=register"><p>Registration</p></a>
<a href="Login?action=logout"><p>Logout</p></a>
</body>
</html>