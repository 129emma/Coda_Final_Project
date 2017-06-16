/**
 * Created by qpen546 on 31/05/2017.
 */
var articlesNum = 3;
var ajaxProcess = true;

$(document).ready(function () {
    //fresh
setInterval(function () {
    $('.ui.sticky').sticky('refresh')
},50);


    $('.message .close')
        .on('click', function () {
            $(this)
                .closest('.message')
                .transition('fade')
            ;
        });

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

    var autoRefresh = setInterval(function () {
        if ($(window).height() == $(document).height() && ajaxProcess == false) {
            ajaxProcess = true;
            $("#Loader").fadeIn();
            $("html, body").animate({scrollTop: $(document).height()}, 200);
            articlesNum += 3;
            loadArticles();
        }
    }, 10000);


    $(window).scroll(function () {
        console.log("1: " + ajaxProcess);
        if ($(window).scrollTop() + $(window).height() >= $(document).height() && ajaxProcess == false) {
            ajaxProcess = true;
            console.log("2: " + ajaxProcess);
            $("#Loader").fadeIn();
            $("html, body").animate({scrollTop: $(document).height()}, 200);
            articlesNum += 3;
            loadArticles();
        }

        if ($(window).scrollTop() == 0) {
            $('.topButton').hide();
        }

        if ($(window).scrollTop() > 100) {
            $('.topButton').fadeIn();
        } else {
            $('.topButton').fadeOut();
        }
    });

    $("#followIcon").click(function () {
        getFollowInfo();
        $(window).off('scroll');
        clearInterval(autoRefresh);
    });
});
function loadArticles() {
    console.log(page);
    console.log(targetUser);
    console.log(tags);
    $.ajax({
        url: '/coda_bubble_beta/Article',
        type: 'post',
        data: {action: 'preview', articleNumber: articlesNum, page: page, targetUser: targetUser, tags: tags},
        success: function (articlesPreview) {
            console.log("3: " + ajaxProcess);
            var preview = articlesPreview.substring(articlesPreview.indexOf('\<body\>') + 6, articlesPreview.indexOf("\</body\>"));
            $("#ArticleContainer").html(preview);
            if (!$.trim($("#ArticleContainer").html()).length) {
                $('#noArticleMessage').show();
            } else {
                $('#noArticleMessage').hide();
            }
            $("#Loader").fadeOut();
            console.log("4: " + ajaxProcess);
            refresh();
            followFunction();
            setTimeout(function () {
                ajaxProcess = false;
                console.log("5: " + ajaxProcess);
            }, 3000);
        }
    });
}

function barFunction() {
    handler = {
        activate: function () {
            if (!$(this).hasClass('dropdown browse')) {
                $(this)
                    .addClass('active')
                    .closest('.ui.menu')
                    .find('.item')
                    .not($(this))
                    .removeClass('active')
                ;
            }
        }
    };
    $('.menu .item').on('click', handler.activate)
    ;


}
function getFollowers() {
    $("#getFollowers").off().click(function () {
        $("#followInfo").hide();
        $("#followerInfo").show();
    })
}

function getFollows() {
    $("#getFollows").off().click(function () {
        $("#followInfo").show();
        $("#followerInfo").hide();
    })
}

function freshButtonList() {

    $(".ui.button.unfollow").each(function (i, obj) {
        $(obj).off().click(function () {
            $(obj).addClass("loading");
            $(obj).prop("disabled", true);
            var username = $(obj).parent().siblings(".content").html();
            $.ajax({
                url: '/coda_bubble_beta/Follow',
                type: 'post',
                data: {action: 'unfollow', followUsername: username},
                success: function () {
                    $(obj).attr('title', 'follow').removeClass("unfollow loading").addClass("follow").html('<i class="add user icon"></i>');
                    $(obj).prop("disabled", false);
                    freshButtonList();
                }
            })
        })
    });

    $(".ui.button.follow").each(function (i, obj) {
        $(obj).off().click(function () {
            $(obj).addClass("loading");
            $(obj).prop("disabled", true);
            var username = $(obj).parent().siblings(".content").html();
            $.ajax({
                url: '/coda_bubble_beta/Follow',
                type: 'post',
                data: {action: 'follow', followUsername: username},
                success: function () {
                    $(obj).attr('title', 'unfollow').removeClass("follow loading").addClass("unfollow").html('<i class="remove user icon"></i>');
                    $(obj).prop("disabled", false);
                    freshButtonList();
                }
            })
        })
    })

}


function getFollowInfo() {

    $("#ArticleContainer").html("");
    $("#Loader").show();

    $.ajax({
        url: '/coda_bubble_beta/Follow',
        type: 'post',
        data: {action: 'getFollowInfo'},
        success: function (followInfo) {

            var info = followInfo.substring(followInfo.indexOf('\<body\>') + 6, followInfo.indexOf("\</body\>"));
            $("#ArticleContainer").html(info);
            getFollows();
            getFollowers();
            freshButtonList();
            barFunction();
            if (!$.trim($("#follows").html()).length) {
                $("#followList").hide();
                $("#noFollowInfo").show();
            }
            if (!$.trim($("#followers").html()).length) {
                $("#followerList").hide();
                $("#noFollowerInfo").show();
            }
            $("#followerInfo").hide();
            $("#followInfo").show();
            $("#Loader").hide();
        }
    })
}

function followFunction() {

    $('.ui.button.blue').each(function (i, obj) {
        $(obj).off().click(function () {
            var username;
            if($(obj).parent().siblings('.header').length){
                username = $(obj).parent().siblings('.header').text();
            }else {
                username=$(obj).parent().parent().next(".ui.segment.keepContent").find(".username").text();
            }
            console.log(username);
            $(obj).prop("disabled", true);
            $.ajax({
                url: '/Follow',
                type: 'post',
                data: {action: 'follow', followUsername: username},
                success: function () {
                    var element= $(".header:contains(" + username + ")");
                    element.siblings(".description").find('.ui.button.blue').removeClass("blue").addClass("red").text('Unfollow');
                    element.closest(".ui.segment.keepContent").prev(".ui.center.aligned.container.responAvatar").find(".ui.button.blue").removeClass("blue").addClass("red").text('Unfollow');
                    $(obj).prop("disabled", false);
                    followFunction();
                }
            })
        })
    });
    $('.ui.button.red').each(function (i, obj) {
        $(obj).off().click(function () {
            var username;
            if($(obj).parent().siblings('.header').length){
                username = $(obj).parent().siblings('.header').text();
            }else {
                username=$(obj).parent().parent().next(".ui.segment.keepContent").find(".username").text();
            }
            $(obj).prop("disabled", true);
            $.ajax({
                url: '/Follow',
                type: 'post',
                data: {action: 'unfollow', followUsername: username},
                success: function () {
                    var element= $(".header:contains(" + username + ")");
                    element.siblings(".description").find(".ui.button.red").removeClass("red").addClass("blue").text('Follow');
                    element.closest(".ui.segment.keepContent").prev(".ui.center.aligned.container.responAvatar").find(".ui.button.red").removeClass("red").addClass("blue").text('Follow');
                    $(obj).prop("disabled", false);
                    followFunction();
                }
            })
        })
    });
}


function refresh() {

    $('.ui.sticky').each(function () {
        $(this).popup({
            popup: $(this).next('.custom.popup'),
            hoverable: true
        });
    });
}