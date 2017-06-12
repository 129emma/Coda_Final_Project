/**
 * Created by pqsky on 2017/6/6.
 */
$(document).ready(function () {
    $("#loginButton").click(function () {
        $('#form').submit();
    })
});

function signOut() {
    var auth2 = gapi.auth2.getAuthInstance();
    auth2.signOut().then(function () {
        console.log('User signed out.');
    });
}

function onSignIn(googleUser) {
    console.log("1");
    // Useful data for your client-side scripts:
    var profile = googleUser.getBasicProfile();
    console.log("2");
    console.log("ID: " + profile.getId()); // Don't send this directly to your server!
    console.log('Full Name: ' + profile.getName());
    console.log('Given Name: ' + profile.getGivenName());
    console.log('Family Name: ' + profile.getFamilyName());
    console.log("Image URL: " + profile.getImageUrl());
    console.log("Email: " + profile.getEmail());

    // The ID token you need to pass to your backend:
    var idToken = googleUser.getAuthResponse().id_token;
    console.log("ID Token: " + idToken);
    $.ajax({
        url: '/GoogleLogin',
        type: 'post',
        data: {idToken: idToken},
        success: function (result) {
            if (result == "success") {
                location.href = "/Blog?page=home";
            } else {
                $("#message").css("color", "red").text(result);
            }
        }
    });
}

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