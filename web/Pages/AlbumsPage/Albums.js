/**
 * Created by yzhb363 on 6/06/2017.
 */

function loadUserImage() {
    loadInfo('Image');
}

function loadUserVideo() {

    loadInfo('Video');

    refresh();
}

function loadUserAudio() {

    loadInfo('Audio');

}
function loadUserYoutube() {

    loadInfo('Youtube');

}

function refresh() {
    handler = {
        activate: function () {
            if (!$(this).hasClass('dropdown browse')) {
                $(this)
                    .addClass('active')
                    .closest('.ui.menu')
                    .find('.item')
                    .not($(this))
                    .removeClass('active')
                ;
            }
        }
    };
    $('.menu .item').on('click', handler.activate)
    ;
}
function loadInfo(info) {
    $('#gallery').hide();
    $('#loading').show();
    $.ajax({
        url: '/Albums',
        type: 'POST',
        data: {action: info},
        success: function (data) {
            var content = data.substring(data.indexOf("<div id='" + info + "'"), data.indexOf("<div id='" + info + "End'>"));
            $('#content').html(content);
            var userContentID = "#user" + info + "List";
            var spotlightContentID = "#spotlight" + info + "List";

            if (!$.trim($(userContentID).html()).length) {
                $(userContentID).html("<img class='ui centered large image' src='http://dr35ey0x3otoq.cloudfront.net/uploads/default/original/3X/c/1/c1145577473f6c697ae5d5681498031d3de2cff6.gif'  alt='Loading'>");
            }

            if (!$.trim($(spotlightContentID).html()).length) {

                $(spotlightContentID).html("<img class='ui centered large image' src='http://dr35ey0x3otoq.cloudfront.net/uploads/default/original/3X/c/1/c1145577473f6c697ae5d5681498031d3de2cff6.gif'  alt='Loading'>");
            }

            $("#showUsers").addClass("active").off().click(function () {
                $(userContentID).show();
                $(spotlightContentID).hide();
            });
            $("#showSpotlight").removeClass("active").off().click(function () {
                $(userContentID).hide();
                $(spotlightContentID).show();
            });
            refresh();
            $('#gallery').show();
            $('#loading').hide();
            $(userContentID).show();
            $(spotlightContentID).hide();
        }
    });
}
