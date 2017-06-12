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
        console.log($(window).scrollTop());
        console.log($(window).height());
        console.log($(document).height());
        if ($(window).scrollTop() + $(window).height() >= $(document).height() && process == false) {
            process = true;
            $("#Loader").show();
            articlesNum += 3;
            loadArticles();
        }
    });

    $("#followInfo").click(function (){
         getFollowInfo();
        $(window).off('scroll');
    });


function refresh() {
    $('.ui.sticky').sticky('refresh');

    $('.userAvatarToHover').each(function () {
        $(this).popup({
            popup: $('.custom.popup')
        });
    });
}


});
function loadArticles(){
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

function getFollowers() {
    $("#getFollowers").off().click(function () {
        $("#getFollows").removeClass('active');
        $(this).addClass('active');
        $("#follows").hide();
        $("#followers").show();
    })
}

function getFollows() {
    $("#getFollows").off().click(function () {
        $("#getFollowers").removeClass('active');
        $(this).addClass('active');
        $("#follows").show();
        $("#followers").hide();
    })
}

function freshButtonList() {
    $(".ui.button.unfollow").off().each(function (i,obj) {
        $(obj).click(function () {
            var username=$(obj).parent().siblings(".content").html();
            $.ajax({
                url: '/Follow',
                type: 'post',
                data: {action: 'unfollow', followUsername: username},
                success: function () {
                    console.log( $(obj).text());
                    $(obj).removeClass("unfollow").addClass("follow").html('Follow');
                    freshButtonList();
                }
            })
        })
    });
    $(".ui.button.follow").off().each(function (i,obj) {
        $(obj).click(function () {
            var username=$(obj).parent().siblings(".content").html();
            $.ajax({
                url: '/Follow',
                type: 'post',
                data: {action: 'follow', followUsername: username},
                success: function () {
                    console.log( $(obj).text());
                    $(obj).removeClass("follow").addClass("unfollow").html('Unfollow');
                    freshButtonList();
                }
            })
        })
    })

}



function  getFollowInfo(){

    $("#ArticleContainer").html("");
    $("#Loader").show();
    $.ajax({
        url:'/Follow',
        type:'post',
        data:{action:'getFollowInfo'},
        success: function (followInfo) {
            var info = followInfo.substring(followInfo.indexOf('\<body\>') + 6, followInfo.indexOf("\</body\>"));
            $("#ArticleContainer").html(info);
            getFollows();
            getFollowers();
            freshButtonList();
            $("#followers").hide();
            $("#follows").show();
            $("#Loader").hide();

        }
    })
}

function followFunction() {
    $('.ui.button.blue').off().each(function (i, obj) {
        $(obj).click(function () {
            var username = $(obj).parent().siblings('.header').text();
            $(obj).prop("disabled", true);
            $.ajax({
                url: '/Follow',
                type: 'post',
                data: {action: 'follow', followUsername: username},
                success: function () {
                    $(".header:contains(" + username + ")").siblings(".description").find('.ui.button.blue').removeClass("blue").addClass("red").text('Unfollow');
                    $(obj).prop("disabled", false);
                    followFunction();
                }
            })
        })
    });
    $('.ui.button.red').off().each(function (i, obj) {
        $(obj).click(function () {
            var username = $(obj).parent().siblings('.header').text();
            $(obj).prop("disabled", true);
            $.ajax({
                url: '/Follow',
                type: 'post',
                data: {action: 'unfollow', followUsername: username},
                success: function () {
                    $(".header:contains(" + username + ")").siblings('.description').find(".ui.button.red").removeClass("red").addClass("blue").text('Follow');
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