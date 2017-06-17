/**
 * Created by pqsky on 2017/6/6.
 */
var userClicked = false;

$(document).ready(function () {
    $('#loginButton').click(function () {
        var username = $('#loginUsername').val();
        var password = $('#loginPassword').val();

        if (username!= ""&& password!= "") {
            $("#loginButton").attr({"class":"ui loading green submit fluid button","disabled":"disabled"});
            login(username,password);
        }else if(username == ""){
            $('#loginBlock').transition('shake');
            $("#messageContainer").attr("class","ui negative message");
            $("#message").text("Please enter your username");
        }else if(password == ""){
            $('#loginBlock').transition('shake');
            $("#messageContainer").attr("class","ui negative message");
            $("#message").text("Please enter your password");
        }
    });

    $(this).keydown(function (event) {
        if(event.keyCode==13){
            $('#loginButton').click();
        }
    })


});

function login(username,passowrd) {
    $.ajax({
        url: 'Login',
        type: 'post',
        data: {action: 'login', username: username, password:passowrd},
        success: function (message) {
            if(message=="login"){
                location.href = "Blog?page=home";
            }else{
                $('#loginBlock').transition('shake');
                $("#messageContainer").attr("class","ui negative message");
                $("#message").text(message);
                $("#loginButton").attr("class","ui green submit fluid button").removeAttr("disabled");
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
        'width': 292,
        'height': 36,
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
    $("#loginSegment").addClass("loading");
    if (userClicked) {
        $.ajax({
            url: 'GoogleLogin',
            type: 'post',
            data: {idToken: idToken},
            success: function (result) {
                if (result == "success") {
                    location.href = "Blog?page=home";
                } else {
                    $("#message").css("color", "red").text(result);
                    $("#loginSegment").removeClass("loading");
                }
            }
        });
    } else {
        signOut();
        $("#loginSegment").removeClass("loading");
    }
}