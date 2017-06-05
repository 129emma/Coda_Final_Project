<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html class="full">
<head>
    <title>Login Page</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.10/semantic.css"/>
</head>
<body>

<form id="form" action="${pageContext.request.contextPath}/Login" method="post">
    <div class="login-block">
        <h1>Login</h1>
        <div>
            <input type="text" name="username" id="username" placeholder="Username"/>
            <input type="password" name="password" id="password" placeholder="Password"/>
        </div>
        <input id="button" type="submit" value="login" name="action"/>
        <p>No account yet? Register <a href="${pageContext.request.contextPath}/Pages/RegisterPage/Register.jsp">HERE</a></p>
        <p style="color: red">${message}</p>
    </div>
</form>
</body>
</html>
