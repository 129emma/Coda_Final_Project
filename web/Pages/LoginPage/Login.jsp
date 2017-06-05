<%--
  Created by IntelliJ IDEA.
  User: xingjianche
  Date: 01/06/2017
  Time: 1:04 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login Page</title>
    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="Login.css" rel="stylesheet">
</head>
<body>

<form id="form" action="Login" method="post">
    <div class="login-block">
        <h1>Login</h1>
        <div>
            <input type="text" name="username" id="username" placeholder="Username"/>
            <input type="password" name="password" id="password" placeholder="Password"/>
        </div>
        <input id="button" type="submit" value="login" name="action"/>
        <p>No account yet? Register <a href="Pages/RegisterPage/Register.jsp">HERE</a></p>
        <p style="color: #ff7c60;">${sessionScope.loginMessage}</p>
        <p style="color: #68ff61;">${sessionScope.logoutMessage}</p>
    </div>
</form>
</body>
</html>
