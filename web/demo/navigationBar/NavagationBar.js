/**
 * Created by yzhb363 on 3/06/2017.
 */
$(document).ready(function () {
    // create sidebar and attach to menu open
    $('.ui.sidebar')
        .sidebar('attach events', '.toc.item')
    ;
});