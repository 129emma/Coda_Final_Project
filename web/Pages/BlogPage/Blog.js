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
    $('.ui.flowing.popup').each(function () {
        var username=$(this).find(".header").text();
        var followBtn= $(this).find('.ui.blue.button');
       followBtn.click(function () {
            console.log(username);
            $.ajax({
                url: '/Follow',
                type: 'post',
                data: {action: 'follow', followUsername: username},
                success: function () {
                    console.log(1+$(this).text());
                    followBtn.removeClass( "blue" ).addClass( "red" ).text('Unfollow');
                        followFunction();
                }
            })
        });
        var unfollowBtn= $(this).find('.ui.red.button');
       unfollowBtn.click(function () {
            console.log(username);
            $.ajax({
                url: '/Follow',
                type: 'post',
                data: {action: 'unfollow', followUsername: username},
                success: function () {
                    unfollowBtn.removeClass( "red" ).addClass( "blue" ).text('Follow');
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
                   $(this).next().find('button').removeClass( 'blue' ).addClass( 'red' ).text('Unfollow')
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