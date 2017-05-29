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
    <link href="css/login.css" rel="stylesheet">
</head>
<body>

<form id="form" action="Login" method="post">
    <div class="login-block">
        <h1>Login</h1>
        <div>
            <input type="text" name="username" id="username" placeholder="Username"/>
            <input type="password" name="password" id="password" placeholder="Password"/>
        </div>
        <input id="button" type="submit" value="Login"/>
        <p>No account yet? Register <a href="Registration">HERE</a></p>
        <p style="color: #ff7c60;">${sessionScope.loginMessage}</p>
    </div>
</form>
</body>
</html>