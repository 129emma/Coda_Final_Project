/**
 * Created by qpen546 on 31/05/2017.
 */
var articlesNum = 3;
var process = false;

$(document).ready(function () {

    loadArticles();

    $('#flipright').click(function () {
        $('.shape').shape('flip back');
    });

    $('#flipleft').click(function () {
        $('.shape').shape('flip over');
    });

    $('.ui.sticky').each(function () {
        $(this).sticky({
            context: '.keepContent'
        });
    });

    $(window).scroll(function () {
        console.log($(window).scrollTop());
        console.log($(window).height());
        console.log($(document).height());
        if ($(window).scrollTop() + $(window).height() == $(document).height() && process == false) {
            process = true;
            $("#Loader").show();
            articlesNum += 3;
            loadArticles();
        }

        if($(window).scrollTop()==0){
            $('.topButton').hide();
        }

        if($(window).scrollTop()>100){
            $('.topButton').fadeIn();
        }else {
            $('.topButton').fadeOut();
        }



    });
});


function refresh() {
    $('.ui.sticky').sticky('refresh');

    $('.userAvatarToHover').each(function () {
        $(this).popup({
            popup: $('.custom.popup')
        });
    });
}

function loadArticles() {
    $.ajax({
        url: '/Article',
        type: 'post',
        data: {action: 'preview', articleNumber: articlesNum, page: page},
        success: function (articlesPreview) {
            var preview = articlesPreview.substring(articlesPreview.indexOf('\<body\>') + 6, articlesPreview.indexOf("\</body\>"));
            $("#ArticleContainer").html(preview);
            $("#Loader").hide();
            process = false;
            refresh();
        }
    });
}


function followFunction() {

    $('.ui.button.blue').off().each(function (i, obj) {
        // console.log("blueButton");
        $(obj).click(function () {
            var username = $(obj).parent().siblings('.header').text();
            // console.log("followClick");
            $(obj).prop("disabled", true);
            $.ajax({
                url: '/Follow',
                type: 'post',
                data: {action: 'follow', followUsername: username},
                success: function () {
                    // console.log("follow");
                    $(".header:contains(" + username + ")").siblings(".description").find('.ui.button.blue').removeClass("blue").addClass("red").text('Unfollow');
                    // $(obj).removeClass("blue").addClass("red").text('Unfollow');
                    $(obj).prop("disabled", false);
                    followFunction();
                }
            })
        })
    });
    $('.ui.button.red').off().each(function (i, obj) {
        // console.log("redButton");
        $(obj).click(function () {
            var username = $(obj).parent().siblings('.header').text();
            // console.log("unfollowClick");
            $(obj).prop("disabled", true);
            $.ajax({
                url: '/Follow',
                type: 'post',
                data: {action: 'unfollow', followUsername: username},
                success: function () {
                    // console.log("unfollow");
                    $(".header:contains(" + username + ")").siblings('.description').find(".ui.button.red").removeClass("red").addClass("blue").text('Follow');
                    // $(obj).removeClass("red").addClass("blue").text('Follow');
                    $(obj).prop("disabled", false);
                    followFunction();
                }
            })
        })
    });
}


function refresh() {
    $('.ui.sticky').sticky('refresh');
    $('.ui.sticky').each(function () {
        var followUsername = $(this).next().find('.header').text();
        var button = $(this).next().find('.ui.button');
        $.ajax({
            url: '/Follow',
            type: 'post',
            data: {action: 'checkFollowStatus', followUsername: followUsername},
            success: function (result) {
                if (result == 'user') {
                    button.remove();
                } else if (result == 'followed') {
                    button.addClass('red').text('Unfollow')
                } else {
                    button.addClass('blue').text('Follow')
                }
                followFunction();
            }
        });
        $(this).popup({
            popup: $(this).next('.custom.popup'),
            hoverable: true
        });
    });
}

// var $content = $("#ContentContainer");
// $("#Loader").hide();
// if ($content.html() != articlesPreview) {
//     $content.html(articlesPreview);
//     process = false;
// } else {
//     setTimeout(function () {
//         process = false;
//     }, 10000);
// }