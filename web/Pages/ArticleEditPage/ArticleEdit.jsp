<%--
  Created by IntelliJ IDEA.
  User: qpen546
  Date: 31/05/2017
  Time: 12:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Title</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.2/css/bootstrap-select.min.css">
    <!-- Latest compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.2/js/bootstrap-select.min.js"></script>

    <script src="Pages/ArticleEditPage/bootstrap-wysiwyg.js"></script>


    <style>
        .content {
            border: solid black 1px;
            width: 800px;
            height: 1000px;
            position: relative;
            overflow: hidden;
        }

        .center {
            margin: auto;
            padding: 10px;
            width: 800px;
            height: 1000px;
        }

        .center .image {
            cursor: pointer;
            width:40px;
            height:40px
        }


    </style>

</head>
<body onload="wyi()">

<jsp:include page="/Pages/NavBar/title.jsp">
    <jsp:param name="title" value=""/>
</jsp:include>
<div class="center">


    <form action="Article" method="post" onsubmit="prepareContent()">

            <h2>Your article</h2>
            <p>Title: <input required type="text" id="title" name="title" placeholder="Please Enter Your Title"
                             value="${articleInfo.title}" style="width: 300px;"/></P>

            <label for="image-input">
                <img class="image" title="add image" src="http://www.hugorc.es/static/images/galeria2.png" >
            </label>
            <input style=" display: none; " id="image-input" class="input" type="file" accept=".jpg, .gif,.png">

            <label for="audio-input">
                <img class="image" title="add video" src="http://www.iconsfind.com/wp-content/uploads/2016/04/20160405_57033268db0ea.png" />
            </label>
            <input id="audio-input" style=" display: none; " class="input" type="file" accept=".mp3,.wav">

            <label for="video-input">
                <img class="image" title="add video" src="https://upload.wikimedia.org/wikipedia/commons/thumb/8/83/Circle-icons-videocameracompact.svg/1000px-Circle-icons-videocameracompact.svg.png"/>
            </label>
            <input id="video-input" style=" display: none; " class="input" type="file" accept=".ogg,.mp4">


            <img class="image" title="add youtube video" src="https://cdn3.iconfinder.com/data/icons/social-icons-5/606/YouTube.png"  onclick="readLink()"/>

            <p>Content:</p>
            <div id="content" class="content" contenteditable="true">${articleInfo.content}
            </div>
            <input type="hidden" name="content" id="articleContentSubmit">

            Tag:<select class="selectpicker" data-style="btn-primary" data-width="150px" name="tag">
            <option data-icon="glyphicon-film" value="Movie">Movie</option>
            <option data-icon="glyphicon-cutlery" value="Food">Food</option>
            <option data-icon="glyphicon-globe" value="Science">Science</option>
            <option data-icon="glyphicon-phone" value="Technology">Technology</option>
            <option data-icon="glyphicon-piggy-bank" value="Business">Business</option>
            <option data-icon="glyphicon-heart" value="Heaish">Health</option>
            <option data-icon="glyphicon-music" value="Music">Music</option>
            <option data-icon="glyphicon-education" value="Education">Education</option>
            <option data-icon="glyphicon-option-horizontal" value="Other">Other</option>
        </select>
            ${hiddenElement}
            ${submitElement}
            ${deleteElement}

    </form>
    <c:if test="${information != null}">
        <p style="color: red">${information}</p>
    </c:if>
</div>

<script>
function wyi() {
    $('#content').wysiwyg();
}
    $('.input').each(function () {
        $(this).change(function () {
            var data = new FormData();
            data.append('file', $(this).prop('files')[0]);
            $.ajax({
                url: 'AlbumsChange',
                type: 'POST',
                data: data,
                processData: false,  // tell jQuery not to process the data
                contentType: false,  // tell jQuery not to set contentType
                success: function (data) {
                    $('#content').append(data + '<div><br></div>');
                }
            });
            $(this).val('');
        });
    });

    function readLink() {
        var input = prompt("Please put your video link", "link here");
        if (input != null) {
            var data = {'action': 'createYoutube', 'youtubeAddress': input};
            $.ajax({
                url: 'AlbumsChange',
                type: 'POST',
                data: data,
                success: function (data) {
                    $('#content').append(input + '<div><br></div>');
                }
            });
        }
    }

    function prepareContent() {
        document.getElementById("articleContentSubmit").value = document.getElementById("content").innerHTML;
    }

</script>
</body>
</html>