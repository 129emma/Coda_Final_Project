/**
 * Created by qpen546 on 5/06/2017.
 */

$(document).ready(function () {

    $('#fullpage').fullpage({
        loopTop: true,
        loopBottom: true
    });

    $('.sequenced.images .image').transition({
        animation: 'jiggle',
        duration: 500,
        interval: 200
    });

    $('#loginBtn').click(function () {
        checkLoginStatus("login");
    });

    $('#registerBtn').click(function () {
        checkLoginStatus("register");
    });

    $('#login').on('blur', '#UsernameInput', function () {
        if ($('#UsernameInput').val() != "") {
            verifyUsername($(this).val());
        }

    });

    $('#login').on('click', '.loginButton', function () {

        var username = $('#username').val();
        var password = $('#password').val();

        if (username!= ""&& password!= "") {
            login(username,password);
        }else if(username == ""){
            $("#message").css("color", "red").text("Please enter your username");
        }else if(password == ""){
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
                $("#button").removeAttr('disabled');
                $("#message").css("color", "green").text(message);
            } else {
                $("#button").attr('disabled', 'disabled');
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
                $("#message").css("color", "red").text(message);
            }
        }
    });
}