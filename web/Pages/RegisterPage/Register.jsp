<%--
  Created by IntelliJ IDEA.
  User: xingjianche
  Date: 01/06/2017
  Time: 1:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Registration Page</title>
    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="Register.css" rel="stylesheet">
</head>
<body>
<form id="form" action="Login" method="post">
    <div class="login-block">
        <h1>Your Details</h1>
        <p>Don't panic:) We do respect your privacy! Read Terms&Conditions <a href="Terms&Conditions.html">HERE</a></p>
        <div>
            <input type="text" name="username" id="username" placeholder="Username"/>
            <input type="password" name="password" id="password" placeholder="Password"/>
        </div>
        <input id="button" type="submit" value="register" name="action"/>
        <p>Already registered? Login <a href="Pages/LoginPage/Login.jsp">HERE</a></p>
        <p style="color: #ff4758;">${sessionScope.RegisterMessage}</p>
    </div>
</form>
</body>
</html>
