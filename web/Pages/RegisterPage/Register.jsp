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
<div id="container">
    <form action="${pageContext.request.contextPath}/Login" method="post">
        <div class="login-block">
            <h1>Register</h1>
            <input id="registerUsername" required type="text" name="username" class="username" placeholder="Username"/>
            <input id="registerPassword" required type="password" name="password" class="password"
                   placeholder="Password"/>
            <div class="ui checked checkbox">
                <input id="terms" type="checkbox" checked>
                <label>I agree to the <a
                        href="${pageContext.request.contextPath}/Pages/TermsConditionsPage/Terms&Conditions.html">terms
                    and conditions</a></label>
            </div>
            <br><br>
            <button class="ui green submit fluid button" id="registerButton" type="button"
                    name="action">Submit</button>
            <br>
            <p>Already registered? Login <a href="${pageContext.request.contextPath}/Pages/LoginPage/Login.jsp">HERE</a>
            </p>
            <p id="message">${message}</p>
        </div>
    </form>
</div>
</body>

</html>
