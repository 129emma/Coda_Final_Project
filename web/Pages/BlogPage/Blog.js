/**
 * Created by qpen546 on 31/05/2017.
 */
var articlesNum = 1;

$(document).ready(function () {
    loadArticles();
    $('#ContentContainer').on('click', '#loadArticleButton', function () {
        // Load more articles
        articlesNum += 1;
        loadArticles();
    });
});

function loadArticles() {
    $.ajax({
        url: 'Article',
        type: 'post',
        data: {action: 'preview', articleNumber: articlesNum},
        success: function (articlesPreview) {
            $("#ContentContainer").html(articlesPreview);
        }
    });
}