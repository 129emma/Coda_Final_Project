/**
 * Created by xingjianche on 06/06/2017.
 */
$(document).ready(function () {
    $('#flipright').click(function () {
        $('.shape').shape('flip right');
    });
    $('#flipleft').click(function () {
        $('.shape').shape('flip left');
    });
});