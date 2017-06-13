/**
 * Created by xingjianche on 05/06/2017.
 */
$(document)
    .ready(function () {

        // fix main menu to page on passing
        $('.main.menu').visibility({
            type: 'fixed'
        });
        $('.overlay').visibility({
            type: 'fixed',
            offset: 80
        });
        // lazy load images
        $('.image').visibility({
            type: 'image',
            transition: 'vertical flip in',
            duration: 500
        });

        // show dropdown on hover
        $('.main.menu  .ui.dropdown').dropdown({
            on: 'hover'
        });
        refresh();
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
        })


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
    $('.ui.button.dislike').off().click(function () {
        console.log("likeClick");
        $(this).prop("disabled", true);
        $.ajax({
            url: '/Article',
            type: 'post',
            data: {action: 'like', articleID: id},
            success: function () {
                // console.log(id);
                $('.ui.button.dislike').removeClass('dislike').addClass('like');
                $(this).prop("disabled", false);
                refresh();
            }
        })
    });
    $('.ui.button.like').off().click(function () {
        console.log("dislikeClick");
        $(this).prop("disabled", true);
        $.ajax({
            url: '/Article',
            type: 'post',
            data: {action: 'dislike', articleID: id},
            success: function () {
                $('.ui.button.like').removeClass('like').addClass('dislike');
                $(this).prop("disabled", false);
                refresh();
            }
        })
    });
}

function refresh() {
    var id = $('#id').text();
    $.ajax({
        url: '/Article',
        type: 'post',
        data: {action: 'checkLikeStatus', articleID: id},
        success: function (result) {
            console.log("success");
            if (result == 'liked') {
                console.log(result);
                $('.heart.icon').addClass('red');
                $('#likeButton').addClass('like');
                $('#ifLiked').text('liked');
            } else {
                $('.heart.icon').removeClass('red');
                $('#likeButton').addClass('dislike');
                $('#ifLiked').text('like');
            }
            $.ajax({
                url: '/Article',
                type: 'post',
                data: {action: 'getLikeNum', articleID: id},
                success: function (resultInt) {
                    console.log("success2");
                    console.log(resultInt);
                    $('.ui.basic.right.pointing.label').text(resultInt);
                }
            });
            likeArticle();
        }
    });

}