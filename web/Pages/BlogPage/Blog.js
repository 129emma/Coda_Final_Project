/**
 * Created by qpen546 on 31/05/2017.
 */
var articlesNum = 1;
var process = false;

$(document).ready(function () {
    windowHeight = $(window).height();
    loadArticles();

    $(window).scroll(function () {
        if ($(window).scrollTop() + $(window).height()== $(document).height()&&process == false) {
            process = true;
            $("#Loader").show();
            articlesNum += 1;
            loadArticles();
        }
    });

    // $('#ContentContainer').on('click', '#loadArticleButton', function () {
    //     // Load more articles
    //     articlesNum += 1;
    //     loadArticles();
    // });
});

function loadArticles() {
    $.ajax({
        url: 'Article',
        type: 'post',
        data: {action: 'preview', articleNumber: articlesNum, page: page},
        success: function (articlesPreview) {
            $("#ContentContainer").html(articlesPreview);
            $("#Loader").hide();
            process=false;
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