/**
 * Created by qpen546 on 5/06/2017.
 */

jq(document).ready(function () {

    jq('#loginBtn').click(function () {
        getPage("login");
        jq('#login').modal('show');
    });

    jq('#registerBtn').click(function () {
        getPage("register");
        jq('#login').modal('show');
    });


    jq('#login').on('blur', '#UsernameInput', function () {
        if (jq('#UsernameInput').val() != "") {
            verifyUsername(jq(this).val());
        }

    });
    // jq("#UsernameInput").blur(function () {
    //     console.log(jq(this).val());
    //     verifyUsername(jq(this).val());
    //     console.log("2");
    // })
});

function getPage(page) {
    jq.ajax({
        url: '/Login',
        type: 'post',
        data: {action: page},
        success: function (results) {
            jq('#login').html(results);
        }
    });
}

function verifyUsername(username) {

    jq.ajax({
        url: '/Login',
        type: 'post',
        data: {action: 'verify', username: username},
        success: function (message) {
            var message = message;
            if (message.includes("available")) {
                jq("#button").removeAttr('disabled');
                jq("#Message").css("color", "green").text(message);
            } else {
                jq("#button").attr('disabled', 'disabled');
                jq("#Message").css("color", "red").text(message);
            }
            jq("#Message").text(message);
        }
    });
}