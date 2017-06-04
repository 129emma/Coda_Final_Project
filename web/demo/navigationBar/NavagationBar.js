/**
 * Created by yzhb363 on 3/06/2017.
 */
$(document)
    .ready(function() {

        // fix menu when passed
     /*   $('.masthead').visibility({
                once: false,
                onBottomPassed: function() {
                    $('.fixed.menu').transition('fade in');
                },
                onBottomPassedReverse: function() {
                    $('.fixed.menu').transition('fade out');
                }
            })
        ;*/

        // create sidebar and attach to menu open
        $('.ui.sidebar')
            .sidebar('attach events', '.toc.item')
        ;


    })
;