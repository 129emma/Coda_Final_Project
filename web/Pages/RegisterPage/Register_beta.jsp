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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Pages/RegisterPage/Register_beta.css"
          type="text/css">
    <script src="${pageContext.request.contextPath}/Pages/RegisterPage/Register.js"></script>
</head>

<body>
<div id="container">
    <div id="subContainer">
        <div class="ui segment">
            <div class="ui attached message">
                <div class="header">
                    Welcome to Bubble!
                </div>
                <p>Fill out the form below to sign-up for a new account</p>
            </div>
            <form class="ui form attached fluid segment">
                <div class="ui left icon input">
                    <input id="registerUsername" required type="text" name="username" class="username"
                           placeholder="Username"/>
                    <i class="user icon"></i>
                </div>
                <div class="ui left icon input">
                    <input id="registerPassword" required type="password" name="password" class="password"
                           placeholder="Password">
                    <i class="lock icon"></i>
                </div>
                <div class="inline field">
                    <div class="ui checkbox">
                        <input type="checkbox" id="terms">
                        <label for="terms">I agree to <a
                                href="${pageContext.request.contextPath}/Pages/TermsConditionsPage/Terms&Conditions.html">the
                            terms and conditions</a></label>
                    </div>
                </div>
                <input class="ui green submit fluid button" id="registerButton" type="submit" value="register"
                       name="action"/>
            </form>
            <div class="ui bottom attached warning message">
                <i class="icon help"></i>
                Already signed up? Login <a href="${pageContext.request.contextPath}/Pages/LoginPage/Login.jsp">HERE</a>
                instead.
            </div>
        </div>
    </div>
</div>
</body>

</html>
