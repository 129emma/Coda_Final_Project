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
    <script src="https://code.jquery.com/jquery-3.2.1.min.js" type="text/javascript"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.10/semantic.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Pages/RegisterPage/Register.css" type="text/css">
    <script src="${pageContext.request.contextPath}/Pages/RegisterPage/Register.js"></script>
</head>

<body>
<form action="${pageContext.request.contextPath}/Login" method="post">
    <div class="login-block">
        <h1>Your Details</h1>
        <p>Don't panic:) We do respect your privacy! Read Terms&Conditions <a href="${pageContext.request.contextPath}/Pages/TermsConditionsPage/Terms&Conditions.html">HERE</a>
        </p>
        <div>
            <input id="UsernameInput" required type="text" name="username" class="username" placeholder="Username"/>
            <input id="PasswordInput" required type="password" name="password" class="password" placeholder="Password"/>
        </div>
        <input id="button" type="submit" value="register" name="action"/>
        <p>Already registered? Login <a href="${pageContext.request.contextPath}/Pages/LoginPage/Login.jsp">HERE</a></p>
        <p id="message">${message}</p>
    </div>
</form>

</body>

</html>
