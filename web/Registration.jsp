<%--
  Created by IntelliJ IDEA.
  User: qpen546
  Date: 23/05/2017
  Time: 1:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Registration Page</title>
</head>
<body>
<form id="form" action="Registration" method="post">
    <fieldset>
        <legend>Your details</legend>
        <p>Username: <input type="text" name="username" placeholder="Please Enter Your Username" style="width: 300px;"/></P>
        <p>Password: <input type="password" name="password" placeholder="Please Enter Your Password" style="width: 300px;"/></p>
        <input type="submit" value="Register"/>
    </fieldset>
</form>
<div>
    <p style="color: red">${sessionScope.RegisterMessage}</p>
</div>
<a href="/Login"><p>Login</p></a>
<a href="/Registration"><p>Registration</p></a>
<a href="/Logout"><p>Logout</p></a>
</body>
</html>