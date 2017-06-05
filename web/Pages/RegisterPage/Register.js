/**
 * Created by qpen546 on 5/06/2017.
 */

$(document).ready(function () {
    $("#UsernameInput").blur(function () {
        if ($('#UsernameInput').val() != "") {
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
                $("#button").removeAttr('disabled');
                $("#Message").css("color", "green").text(message);
            } else {
                $("#button").attr('disabled', 'disabled');
                $("#Message").css("color", "red").text(message);
            }
            $("#Message").text(message);
        }
    });
}