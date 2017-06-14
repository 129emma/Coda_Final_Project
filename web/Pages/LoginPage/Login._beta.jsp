<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html class="full">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
    <title>Login Page</title>
    <%--<meta name="google-signin-scope" content="profile email">--%>
    <meta name="google-signin-client_id"
          content="782826346139-b034vt93v6m8483o8m4jf2d94hdsbhq6.apps.googleusercontent.com">
    <script src="https://apis.google.com/js/platform.js" async defer></script>

    <script src="https://code.jquery.com/jquery-3.2.1.min.js" type="text/javascript"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.10/semantic.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Pages/LoginPage/Login.css" type="text/css">
    <script src="${pageContext.request.contextPath}/Pages/LoginPage/Login.js"></script>
</head>
<body>
<div id="container">
    <form id="form" action="${pageContext.request.contextPath}/Login" method="post">
        <div class="login-block">
            <h1>Login</h1>
            <div>
                <input id="loginUsername" type="text" required name="username" class="username" placeholder="Username"/>
                <input id="loginPassword" type="password" required name="password" class="password"
                       placeholder="Password"/>
            </div>
            <input type="hidden" value="login" name="action"/>
            <button id="loginButton" type="button">Login</button>
            <br/><br/>
            <p id="message">${message}</p>
            <p>No account yet? Register <a href="${pageContext.request.contextPath}/Pages/RegisterPage/Register.jsp">HERE</a>
            </p>

            <div class="ui horizontal divider">Or</div>
            <div id="my-signin2" onclick="clickDetector()"></div>
        </div>
    </form>
    <%--<div class="g-signin2" data-onsuccess="onSignIn" data-theme="dark"></div>--%>
</div>
<div class="fb-login-button" data-max-rows="1" data-size="large" data-button-type="continue_with"
     data-show-faces="false" data-auto-logout-link="false" data-use-continue-as="false"></div>
<script>
    (function (d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) {
            return;
        }
        js = d.createElement(s);
        js.id = id;
        js.src = "//connect.facebook.net/en_US/sdk.js";
        fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));

    FB.getLoginStatus(function (response) {
        statusChangeCallback(response);
    });

    (function (d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) return;
        js = d.createElement(s);
        js.id = id;
        js.src = "//connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v2.9&appId=466254077053335";
        fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));

    function checkLoginState() {
        FB.getLoginStatus(function(response) {
            statusChangeCallback(response);
        });
    }

    window.fbAsyncInit = function () {
        FB.init({
            appId: '466254077053335',
            cookie: true,
            xfbml: true,
            version: 'v2.8'
        });
        FB.AppEvents.logPageView();
    };
</script>
</body>
</html>
