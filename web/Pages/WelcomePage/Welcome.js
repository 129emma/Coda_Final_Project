/**
 * Created by qpen546 on 5/06/2017.
 */

var userClicked = false;
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


$(document).ready(function () {




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


    $('#login').on('click', '#registerButton', function () {
        var username = $('#registerUsername').val();
        var password = $('#registerPassword').val();
        var checked = $("#terms").prop("checked") == true;
        console.log(checked);

        if (username!= ""&& password!= ""&&checked) {
            $("#registerButton").attr({"class":"ui loading green submit fluid button","disabled":"disabled"});
            register(username,password);
        }else if(username == ""){
            $('#loginBlock').transition('shake');
            $("#message").css("color", "red").text("Please enter your username");
        }else if(password == ""){
            $('#loginBlock').transition('shake');
            $("#message").css("color", "red").text("Please enter your password");
        }else if(!checked){
            $('#loginBlock').transition('shake');
            $("#message").css("color", "red").text("Please agree the terms and conditions");
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

            if(message=="login"){
                location.href = "/Blog?page=home";
            }else{
                $("#loginButton").attr("class","ui green submit fluid button").removeAttr("disabled");
                $('#login').transition('shake');
                $("#message").css("color", "red").text(message);
            }
        }
    });
}

function register(username,passowrd) {
    $.ajax({
        url: '/Login',
        type: 'post',
        data: {action: 'register', username: username, password:passowrd},
        success: function (message) {
            if(message=="login"){
                location.href = "/Blog?page=home";
            }else if(message == "success"){
                $("#message").css("color", "green").text("Your are success to create new account");
                $("#registerButton").attr("class","ui green submit fluid button").removeAttr("disabled");
                setTimeout(function(){location.href = "/Login?action=login"},2000);
            }else{
                $('#loginBlock').transition('shake');
                $("#message").css("color", "red").text(message);
                $("#registerButton").attr("class","ui green submit fluid button").removeAttr("disabled");
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

    // Useful data for your client-side scripts:
    var profile = googleUser.getBasicProfile();


    // The ID token you need to pass to your backend:
    var idToken = googleUser.getAuthResponse().id_token;
    $("#loginSegment").addClass("loading");
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
                    $("#loginSegment").removeClass("loading");
                }
            }
        });
    } else {
        signOut();
        $("#loginSegment").removeClass("loading");
    }
}