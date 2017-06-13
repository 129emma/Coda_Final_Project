/**
 * Created by yzhb363 on 3/06/2017.
 */
$(document)
    .ready(function () {
     /*   $('.toc.item').click(function () {
            $('.responsiveMenu').sidebar('setting','transition','push')
                .sidebar('setting','direction','top')
                .sidebar('toggle')


        })*/


        $('.ui.sidebar')
            .sidebar('attach events', '.toc.item','push')
        ;



    })
;