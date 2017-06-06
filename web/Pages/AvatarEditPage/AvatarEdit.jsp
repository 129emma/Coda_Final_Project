<%--
  Created by IntelliJ IDEA.
  User: txie936
  Date: 29/05/2017
  Time: 12:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>

    <title>changeIcon</title>
    <style>
        .rounded { border-radius: 50%;
            width: 100px;
            height: 100px;}

        .image:hover{ cursor:pointer}
    </style>
    <script>
        $(document).ready(function () {
            $( ".image" ).each(function() {
                $(this).click( function(){
                    $("#icon").attr('src',$(this).attr('src'));
                    $('input[type=hidden]').val($(this).attr('src'));
                });
            });

            function readURL(input) {
                if (input.files && input.files[0]) {
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        $('#icon').attr('src', e.target.result);
                    };
                    reader.readAsDataURL(input.files[0]);
                }
            }

            $('input[type=file]').change(function () {
                readURL(this);
                $('input[type=hidden]').val("");
            })
        });

    </script>
</head>
<body>
<jsp:include page="/Pages/NavBar/title.jsp"> <jsp:param name="title" value=""/> </jsp:include>
<img src="${userInfo.avatar}" id="icon" name="userIcon" class="rounded" />
<form action="AvatarEdit" method="post" enctype="multipart/form-data">
    <input type="hidden" name="result" id="result">
    <label for="imageFile">Choose one image:</label><input type="file" id="imageFile" accept=".jpg, .gif,.png" name="icon"/><br><br>
    <c:forEach var="localIcon" items="${iconList}">
        <div class="panel panel-default" >
            <img src="${localIcon}" class="rounded image" id="${localIcon}" />
        </div>
    </c:forEach>
    <br><br>
    <input type="submit" value="Submit"/>
</form>

</body>
</html>
