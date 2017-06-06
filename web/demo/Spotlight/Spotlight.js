/**
 * Created by yzhb363 on 5/06/2017.
 */
$(document).ready(function () {
    $('.ui.sticky').each(function () {
        $(this).sticky({
            context: '.keepContent',
            pushing: true
        });
    });

    $('.userAvatarToHover').popup({
            popup : $('.custom.popup'),
            on    : 'click'

    });

});