/**
 * Created by qpen546 on 5/06/2017.
 */

$(document).ready(function () {

    $('#fullpage').fullpage({
        continuousVertical: true,
        navigationPosition: 'left',
        navigation: true,

        afterLoad: function(anchorLink, index){

            if(index == 2){
                $('.sequenced.images .image').transition({
                    animation: 'jiggle',
                    duration: 500,
                    interval: 200
                });
            }
            if(index == 3){
                $('.sequenced.icons .icon').transition({
                    animation: 'bounce',
                    duration: 500,
                    interval: 200
                });
            }

        }

    });

    $('#loginBtn').click(function () {
        checkLoginStatus("login");
    });

    $('#registerBtn').click(function () {
        checkLoginStatus("register");
    });

    $('#login').on('blur', '#registerUsername', function () {
        if ($('#registerUsername').val() != "") {
            verifyUsername($(this).val());
        }

    });

    $('#login').on('click', '#loginButton', function () {
        var username = $('#loginUsername').val();
        var password = $('#loginPassword').val();

        if (username!= ""&& password!= "") {
            $("#loginButton").attr({"class":"ui loading green submit fluid button","disabled":"disabled"});
            login(username,password);
        }else if(username == ""){
            $('#login').transition('shake');
            $("#message").css("color", "red").text("Please enter your username");
        }else if(password == ""){
            $('#login').transition('shake');
            $("#message").css("color", "red").text("Please enter your password");
        }
    });
});

function getPage(action) {
    $.ajax({
        url: '/Login',
        type: 'post',
        data: {action: action},
        success: function (results) {
            var form = results.substring(results.indexOf('\<body\>')+6,results.indexOf("\</body\>"));
            $('#login').html(form).modal('show');
            renderButton();
        }
    });
}

function checkLoginStatus(action) {
    $.ajax({
        url: '/Login',
        type: 'post',
        data: {action: 'check'},
        success: function (status) {
            if(status=="login"){
                location.href = "/Blog?page=home";
            }else{
                getPage(action);
            }
        }
    });
}

function verifyUsername(username) {
    $.ajax({
        url: '/Login',
        type: 'post',
        data: {action: 'verify', username: username},
        success: function (message) {
            var message = message;
            if (message.includes("available")) {
                $("#registerButton").removeAttr('disabled');
                $("#message").css("color", "green").text(message);
            } else {
                $('#login').transition('shake');
                $("#registerButton").attr('disabled', 'disabled');
                $("#message").css("color", "red").text(message);
            }
        }
    });
}

function login(username,passowrd) {
    $.ajax({
        url: '/Login',
        type: 'post',
        data: {action: 'login', username: username, password:passowrd},
        success: function (message) {
            $("#loginButton").attr("class","ui green submit fluid button").removeAttr("disabled");
            if(message=="login"){
                location.href = "/Blog?page=home";
            }else{
                $('#login').transition('shake');
                $("#message").css("color", "red").text(message);
            }
        }
    });
}

function signOut() {
    var auth2 = gapi.auth2.getAuthInstance();
    auth2.signOut().then(function () {
        console.log('User signed out.');
    });
}

function clickDetector() {
    userClicked = true;
}

function onSuccess(googleUser) {
    console.log('Logged in as: ' + googleUser.getBasicProfile().getName());
    onSignIn(googleUser)
}
function onFailure(error) {
    console.log(error);
}
function renderButton() {
    gapi.signin2.render('my-signin2', {
        'scope': 'profile email',
        'width': 280,
        'height': 40,
        'longtitle': true,
        'theme': 'dark',
        'onsuccess': onSuccess,
        'onfailure': onFailure
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
    if (userClicked) {
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
    } else {
        signOut();
    }
}