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
            offset:50,
            context: $(this).parent().parent(),

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