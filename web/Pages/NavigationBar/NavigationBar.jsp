<%--
  Created by IntelliJ IDEA.
  User: qpen546
  Date: 6/06/2017
  Time: 11:39 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
<title>Login Page</title>
<meta name="google-signin-scope" content="profile email">
<meta name="google-signin-client_id" content="782826346139-b034vt93v6m8483o8m4jf2d94hdsbhq6.apps.googleusercontent.com">
<script src="https://apis.google.com/js/platform.js" async defer></script>

<body>


<%--    <a href="Blog?page=home" class="item iconClass"><li class="ion-ios-home-outline"></li></a>
    <a href="Albums" class="item ion-images"></a>
    <a href="Login?action=logout" class="item iconClass"><li class="ion-log-out"></li> </a>
--%>
<div class="ui vertical center aligned segment" id="topMenu">
    <div class="ui container">
        <div class="ui icon borderless menu">
            <a href="Blog?page=home" class="item iconClass"><i class="ion-ios-home-outline iconClass"></i></a>
            <a href="Albums" class="item"><i class="ion-ios-analytics-outline iconClass"></i></a>
            <a href="Login?action=logout" class="item"><i class="ion-ios-redo-outline iconClass"></i></a>
            <a href="#" onclick="signOut();">Sign out</a>
        </div>
    </div>

</div>

<script>
    function signOut() {
        gapi.auth2.init();
        var auth2 = gapi.auth2.getAuthInstance();
        auth2.signOut().then(function () {
            console.log('User signed out.');
        });
    }
</script>

</body>
