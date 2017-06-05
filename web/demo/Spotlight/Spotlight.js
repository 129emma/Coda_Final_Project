/**
 * Created by yzhb363 on 5/06/2017.
 */
$(document).ready(function () {
    $('.ui.sticky').each(function () {
        $(this).sticky({
            context: '.example2',
            pushing: true
        });
    });

    $('.userAvatarToHover').popup({
            popup : $('.custom.popup'),
            on    : 'click'

    });

});