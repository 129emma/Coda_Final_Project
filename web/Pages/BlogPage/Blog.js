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
            context: $(this).parent().parent()
        });
    });

    $(window).scroll(function () {
        // console.log($(window).scrollTop());
        // console.log($(window).height());
        // console.log($(document).height());
        if ($(window).scrollTop() + $(window).height() == $(document).height() && process == false) {
            process = true;
            $("#Loader").show();
            articlesNum += 3;
            loadArticles();
        }
    });
});

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
            followFunction();
        }
    });
}


function followFunction() {
    $('.ui.flowing.popup.top.left.transition.hidden').each(function () {
        var username=$(this).parent().siblings(".header").html();
        $(this).find('.ui.blue.button').click(function () {
            console.log(username);
            $.ajax({
                url: '/Follow',
                type: 'post',
                data: {action: 'follow', followUsername: username},
                success: function () {
                    $(this).removeClass( "blue" ).addClass( "red" ).html('Unfollow');
                        followFunction();
                }
            })
        });
        $(this).find('.ui.red.button').click(function () {
            console.log(username);
            $.ajax({
                url: '/Follow',
                type: 'post',
                data: {action: 'unfollow', followUsername: username},
                success: function () {
                    $(this).removeClass( "red" ).addClass( "blue" ).html('Follow');
                    followFunction();
                }
            })
        })
    })
}



function refresh() {
    $('.ui.sticky').sticky('refresh');
    $('.ui.sticky').each(function () {
        var followUsername=$(this).next().find('.header').text();
        $.ajax({
            url: '/Follow',
            type: 'post',
            data: {action: 'checkFollowStatus',followUsername:followUsername},
            success: function (result) {
               if(result=='follow'){
                   $(this).next().find('button').removeClass( "blue" ).addClass( "red" ).html('Unfollow')
               }
            }
        });
        $(this).popup({
            popup: $(this).next('.custom.popup'),
            hoverable  : true
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