$(document).ready(function () {
    $('#flipright').click(function () {
        $('.shape').shape('flip back');
    });
    $('#flipleft').click(function () {
        $('.shape').shape('flip over');
    });
});
