<%--
  Created by IntelliJ IDEA.
  User: qpen546
  Date: 31/05/2017
  Time: 12:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
<head>
    <title>Title</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="Pages/ArticleEditPage/ArticlePage.css">


<style>
    .content{
        border: solid black 1px;
        width: 800px;
        height: 1000px;
        position: relative;
        overflow: hidden;
    }
.video{
    margin: auto;
}

.image{
    cursor: hand;
}
.form{
    display: inline-block;
}
.input {

    }

</style>

</head>
<body>

<jsp:include page="/Pages/NavBar/title.jsp"> <jsp:param name="title" value=""/> </jsp:include>

<form class="form" action="Article" method="post" onsubmit="prepareContent()">

    <fieldset>
        <legend>Your article</legend>

        <p>title: <input type="text" id="title" name="title" placeholder="Please Enter Your Title" value="${articleInfo.title}" style="width: 300px;"/></P>


                <label for="image-input">
                    <img  class="image" title="add image" src="http://www.hugorc.es/static/images/galeria2.png" width="40px" height="40px" >
                </label>
                <input   style=" display: none; " id="image-input" class="input" type="file" accept=".jpg, .gif,.png">

                <label for="audio-input">
                    <img  class="image" title="add video" src="http://www.iconsfind.com/wp-content/uploads/2016/04/20160405_57033268db0ea.png" width="40px" height="40px"/>
                </label>
                <input id="audio-input" style=" display: none; " class="input"  type="file" accept=".mp3,.wav">
                <label for="video-input">
                    <img  class="image" title="add video"  src="https://upload.wikimedia.org/wikipedia/commons/thumb/8/83/Circle-icons-videocameracompact.svg/1000px-Circle-icons-videocameracompact.svg.png" width="40px" height="40px"/>
                </label>
                <input id="video-input" style=" display: none; " class="input"  type="file"  accept=".ogg,.mp4">
        <label >
            <img  class="image" title="add youtube video"  src="https://cdn3.iconfinder.com/data/icons/social-icons-5/606/YouTube.png" width="40px" height="40px"/>
        </label>



       <p>content:</p><div id="content" class="content" contenteditable="true" >${articleInfo.content}<div class="video">${video}</div> </div>
        <input type="hidden" name="content" id="articleContentSubmit">
        <p>tag: <input type="text" id="tags" name="tag" placeholder="Please Enter Your Tag"  value="${articleInfo.tags}" style="width: 300px;"/></p>
        ${hiddenElement}
        ${submitElement}
        ${deleteElement}

    </fieldset>
</form>

<c:if test = "${information != null}">
    <p>${information}</p>
</c:if>

<script>

    $('.input').each(function() {
        $(this).change(function () {
            var data = new FormData();
            data.append('file',$(this).prop('files')[0]);
            $.ajax({
                url : 'AlbumsChange',
                type : 'POST',
                data : data,
                processData: false,  // tell jQuery not to process the data
                contentType: false,  // tell jQuery not to set contentType
                success : function(data) {
                    $('#content').append(data);

                }
            });
            $(this).val('');
        });

    });


    function readLink() {
        var input = prompt("Please put your video link", "link here");
        if (input != null) {
            //var content=document.getElementById("content");
            //var contentText=content.innerHTML;
            //input="<div>"+input+"</div>";
            document.getElementById("videoAddress").value=input;
            document.getElementById("video").innerHTML=input;
            //content.innerHTML=contentText+input;
        }
    }


function prepareContent() {
    document.getElementById("articleContentSubmit").value = document.getElementById("content").innerHTML;
}
//    function validateInput() {
//        if( document.getElementById("videoAddress").value.trim().length=0){
//            return false;
//        }
//    }
</script>
</body>
</html>