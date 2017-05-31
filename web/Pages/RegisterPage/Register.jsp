<%--
  Created by IntelliJ IDEA.
  User: qpen546
  Date: 31/05/2017
  Time: 5:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register</title>
</head>

<body>
<form id="form" action="Login" method="post">
    <fieldset>
        <legend>Your details</legend>
        <p>Username: <input type="text" name="username" placeholder="Please Enter Your Username" style="width: 300px;"/></P>
        <p>Password: <input type="password" name="password" placeholder="Please Enter Your Password" style="width: 300px;"/></p>
        <input type="submit" name="action" value="register"/>
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
