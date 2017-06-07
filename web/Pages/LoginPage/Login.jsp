<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html class="full">
<head>
    <title>Login Page</title>
    <script src="https://code.jquery.com/jquery-3.2.1.min.js" type="text/javascript"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.10/semantic.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Pages/LoginPage/Login.css" type="text/css">
    <script src="${pageContext.request.contextPath}/Pages/LoginPage/Login.js"></script>
</head>
<body>

<form id="form" action="${pageContext.request.contextPath}/Login" method="post">
    <div class="login-block">
        <h1>Login</h1>
        <div>
            <input id="loginUsername" type="text" required name="username" class="username" placeholder="Username"/>
            <input id="loginPassword" type="password" required name="password" class="password" placeholder="Password"/>
        </div>
        <input type="hidden" value="login" name="action"/>
        <button id="loginButton" type="button">Login</button>
        <p>No account yet? Register <a href="${pageContext.request.contextPath}/Pages/RegisterPage/Register.jsp">HERE</a></p>
        <p id="message">${message}</p>
    </div>
</form>
</body>
</html>
