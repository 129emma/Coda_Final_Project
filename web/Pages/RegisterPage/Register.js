/**
 * Created by qpen546 on 5/06/2017.
 */

$(document).ready(function () {
    console.log("1");
    $("#UsernameInput").blur(function () {
        console.log($(this).val());
        verifyUsername($(this).val());
        console.log("2");
    })
});

function verifyUsername(username) {
    console.log("3");
    $.ajax({
        url: 'Login',
        type: 'post',
        data: {action: 'verify', username: username},
        success: function (message) {
            console.log("4");
            if(message!="Username is available"){
                console.log("5");
                $("#RegisterButton").attr('disabled', 'disabled');
                $("#Message").css("color", "red").text(message);
            }else{
                $("#RegisterButton").removeAttr('disabled');
                $("#Message").css("color", "green").text(message);
            }
            console.log("6");
        }
    });
}