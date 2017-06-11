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

        //edit comment
        $('.editBtn').each(function(i,obj){
            console.log("1");
            console.log(obj);
            $(obj).click(function () {
                console.log("2");
                console.log($(obj).parent().parent().parent().next());
                $(obj).parent().parent().parent().next()
                    .modal('setting', 'transition', 'vertical flip')
                    .modal('show')
                ;
            })
        })
    });