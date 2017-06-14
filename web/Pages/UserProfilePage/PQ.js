/**
 * Created by qpen546 on 14/06/2017.
 */
$(document).ready(function () {

    $("#newUsername").blur(function () {
        var newUsername = $('#newUsername').val();
        console.log(username);
        console.log(newUsername);
        if (newUsername != "" && newUsername !=username) {
            verifyUsername($(this).val());
        }else if(newUsername == username){
            $("#usernameMessageContainer").attr("class","ui message hidden");
            $("#usernameMessage").text(null);
        }else if(newUsername == ""){
            $('#newUsername').transition('shake');
            $("#usernameMessageContainer").attr("class","ui negative message");
            $("#updateBtn").attr('disabled', 'disabled');
            $("#usernameMessage").text("Please enter your new username");
        }
    });

    if(googleUser=="false"){
        $("#passwordDivider").removeAttr("style");
        $("#passwordForm").removeAttr("style");
    }

    $("#passwordBtn").click(function () {
        var password = $("#password").val();
        var newPassword = $("#newPassword").val();
        var reNewPassword = $("#reNewPassword").val();

        if(password != ""&&newPassword!=""&&reNewPassword!=""&&newPassword!=password&&newPassword==reNewPassword){
            changePassword(password,newPassword);
        }else if(password ==""){
            $("#passwordMessageContainer").attr("class","ui negative message");
            $("#passwordMessage").text("Please enter password");
        }else if(newPassword ==""){
            $("#passwordMessageContainer").attr("class","ui negative message");
            $("#passwordMessage").text("Please enter new password");
        }else if(reNewPassword ==""){
            $("#passwordMessageContainer").attr("class","ui negative message");
            $("#passwordMessage").text("Please re-enter new password");
        }else if(newPassword!=reNewPassword){
            $("#passwordMessageContainer").attr("class","ui negative message");
            $("#passwordMessage").text("The re-entered password is different to new password");
        }else if(newPassword==password){
            $("#passwordMessageContainer").attr("class","ui negative message");
            $("#passwordMessage").text("New password is same to current password");
        }
    })
});

function changePassword(password,newPassword) {
    $("#passwordBtn").attr({"class":"ui loading submit button","disabled":"disabled"});
    $.ajax({
        url: '/ChangePassword',
        type: 'post',
        data: {password: password, newPassword:newPassword},
        success: function (message) {
            var message = message;
            if (message=="success") {
                $("#passwordMessageContainer").attr("class","ui positive message");
                $("#passwordMessage").text("You are successful to change your password");
            } else {
                $("#passwordMessageContainer").attr("class","ui negative message");
                $("#passwordMessage").text(message);
            }
            $("#passwordBtn").attr("class","ui submit button").removeAttr("disabled");
            // $("#message").text(message);
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
                $("#updateBtn").removeAttr('disabled');
                $("#usernameMessageContainer").attr("class","ui positive message");
                $("#usernameMessage").text(message);
            } else {
                $('#newUsername').transition('shake');
                $("#usernameMessageContainer").attr("class","ui negative message");
                $("#updateBtn").attr('disabled', 'disabled');
                $("#usernameMessage").text(message);
            }
            // $("#message").text(message);
        }
    });
}