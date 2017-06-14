/**
 * Created by xingjianche on 05/06/2017.
 */
$(document)
    .ready(function () {
        likeArticle();
    });

        //edit comment
     /*       $('.editBtn').each(function (i, obj) {
         console.log("1");
         console.log(obj);
         $(obj).click(function () {
         console.log("2");
         console.log($(obj).parent().parent().next());
         $(obj).parent().parent().next()
         .modal('setting', 'transition', 'vertical flip')
         .modal('show')
         ;
         })
         })*/

        $('.reply.editBtn').each(function () {
            $(this).click(function () {
                $('.editComment') .modal('setting', 'transition', 'vertical flip')
                                   .modal('show');
            })
        });


        //reply comment
        $('.replyBtn').each(function () {
            $(this).click(function () {
                $('.replyComment').modal({
                    blurring:true})
                                  .modal('show');
            })
        })




function likeArticle() {
    var id = $('#id').text();
    $('.ui.button.like').off().click(function () {
        console.log("likeClick");
        $(this).prop("disabled", true);
        var numLike = $('.ui.basic.right.pointing.label').text();
        $('.ui.basic.right.pointing.label').text(parseInt(numLike, 10) + 1);
        $('.heart.icon').addClass('red');
        $('#ifLiked').text('liked');
        $.ajax({
            url: '/Article',
            type: 'post',
            data: {action: 'like', articleID: id},
            success: function () {
                console.log('success');
                $('.ui.button.like').removeClass('like').addClass('liked');
                $('#likeButton').prop("disabled", false);
                likeArticle();
            }
        })
    });
    $('.ui.button.liked').off().click(function () {
        console.log("dislikeClick");
        $(this).prop("disabled", true);
        var numLike = $('.ui.basic.right.pointing.label').text();
        $('.ui.basic.right.pointing.label').text(parseInt(numLike, 10) - 1);
        $('.heart.icon').removeClass('red');
        $('#ifLiked').text('like');
        $.ajax({
            url: '/Article',
            type: 'post',
            data: {action: 'dislike', articleID: id},
            success: function () {
                console.log('success2');
                $('.ui.button.liked').removeClass('liked').addClass('like');
                $('#likeButton').prop("disabled", false);
                likeArticle();
            }
        })
    });
}
