/**
 * Created by qpen546 on 5/06/2017.
 */

$(document).ready(function () {
    $("#registerUsername").blur(function () {
        if ($('#registerUsername').val() != "") {
            verifyUsername($(this).val());
        }
    })
});

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
                $("#registerButton").attr('disabled', 'disabled');
                $("#message").css("color", "red").text(message);
            }
            $("#message").text(message);
        }
    });
}