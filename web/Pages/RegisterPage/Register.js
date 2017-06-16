
/**
 * Created by qpen546 on 5/06/2017.
 */

$(document).ready(function () {
    $("#registerUsername").blur(function () {
        if ($('#registerUsername').val() != "") {
            verifyUsername($(this).val());
        }
    });




    $('#registerButton').click(function () {
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

function register(username,passowrd) {
    $.ajax({
        url: '/coda_bubble_beta/Login',
        type: 'post',
        data: {action: 'register', username: username, password:passowrd},
        success: function (message) {
            if(message=="login"){
                location.href = "/coda_bubble_beta/Blog?page=home";
            }else if(message == "success"){
                $("#message").css("color", "green").text("Your are success to create new account");
                setTimeout(function(){location.href = "/coda_bubble_beta/Login?action=login"},2000);
            }else{
                $('#loginBlock').transition('shake');
                $("#message").css("color", "red").text(message);
                $("#registerButton").attr("class","ui green submit fluid button").removeAttr("disabled");
            }
        }
    });
}

function verifyUsername(username) {
    $.ajax({
        url: '/coda_bubble_beta/Login',
        type: 'post',
        data: {action: 'verify', username: username},
        success: function (message) {
            var message = message;
            if (message.includes("available")) {
                $("#registerButton").removeAttr('disabled');
                $("#message").css("color", "green").text(message);
            } else {
                $('#loginBlock').transition('shake');
                $("#registerButton").attr('disabled', 'disabled');
                $("#message").css("color", "red").text(message);
            }
            // $("#message").text(message);
        }
    });
}
