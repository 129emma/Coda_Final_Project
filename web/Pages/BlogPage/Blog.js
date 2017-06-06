/**
 * Created by qpen546 on 31/05/2017.
 */
var articlesNum = 1;
var process = false;

$(document).ready(function () {

    loadArticles();

    $(window).scroll(function () {
        if ($(window).scrollTop() + $(window).height() == $(document).height() && process == false) {
            process = true;
            $("#Loader").show();
            articlesNum += 1;
            loadArticles();
        }
    });
});


function refresh() {
    $('.ui.sticky').each(function () {
        $(this).sticky({
            context: '.keepContent',
            pushing: true
        });
    });

    $('.userAvatarToHover').each(function () {
        $(this).popup({
            popup: $('.custom.popup'),
            on: 'click'
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
            refresh();
            process = false;
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