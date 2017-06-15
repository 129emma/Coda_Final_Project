/**
 * Created by txie936 on 14/06/2017.
 */
$(document).ready(function () {

    $('#fileButton').click(function () {
        $('#imageFile').click();
    });

    $("#submitAvatarChange").click(function () {
        $(this).addClass("loading");
        $(this).prop("disabled", true);
        $("#avatarForm").submit();
        $('#result').val("");
    });

    $(".rounded").each(function () {
        $(this).click(function () {
            var src = $(this).attr('src');
            $("#icon").attr('src', src);
            $('#result').val(src);
        });
    });


    $('#imageFile').change(function () {
        readURL(this);
    });

    $("#deleteBtn").click(function () {
        $('#deleteWindow').modal('show');
    });

    $("#deleteAccountBtn").click(function () {
        $(this).addClass("loading");
        $(this).prop("disabled", true);
        $("#profileAction").val("Delete");
        $("#profileForm").submit();
    });

    $("#updateBtn").click(function () {
        $(this).addClass("loading");
        $(this).prop("disabled", true);
        $("#profileAction").val("Update");
        $("#profileForm").submit();
    });


    $("#passwordBtn").click(function () {
        $(this).addClass("loading");
        $(this).prop("disabled", true);
    })
});
function showWindow2() {
    $('#iconWindow')
        .modal('show')
    ;
}
function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            $('#icon').attr('src', e.target.result);
        };
        reader.readAsDataURL(input.files[0]);
    }
}