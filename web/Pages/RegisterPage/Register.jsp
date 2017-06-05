<%--
  Created by IntelliJ IDEA.
  User: qpen546
  Date: 31/05/2017
  Time: 5:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <title>Register</title>
    <!-- JQuery -->
    <script src="https://code.jquery.com/jquery-3.2.0.js"
            integrity="sha256-wPFJNIFlVY49B+CuAIrDr932XSb6Jk3J1M22M3E2ylQ=" crossorigin="anonymous"></script>

    <script src="Pages/RegisterPage/Register.js"></script>
</head>

<body>
<form id="form" action="Login" method="post">
    <fieldset>
        <legend>Your details</legend>
        <p>Username: <input id="UsernameInput" type="text" name="username" placeholder="Please Enter Your Username" style="width: 300px;"/></P>
        <p>Password: <input id="PasswordInput" type="password" name="password" placeholder="Please Enter Your Password" style="width: 300px;"/></p>
        <input id="RegisterButton" type="submit" name="action" value="register"/>
    </fieldset>
</form>
<div>
    <p id="Message" style="color: red">${message}</p>
</div>
<a href="/Login?action=login"><p>Login</p></a>
</body>

</html>
