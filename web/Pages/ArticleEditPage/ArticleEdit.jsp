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
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="Pages/ArticleEditPage/ArticlePage.css">


    <style>
        .content {
            border: solid black 1px;
            width: 800px;
            height: 1000px;
            position: relative;
            overflow: hidden;
        }

        .video {
            margin: auto;
        }


    </style>
</head>
<body>
<jsp:include page="/Pages/NavBar/title.jsp">
    <jsp:param name="title" value=""/>
</jsp:include>


<form id="form" action="Article" method="post" onsubmit="prepareContent()">
    <fieldset>
        <legend>Your article</legend>
        <p>title: <input type="text" id="title" name="title" placeholder="Please Enter Your Title"
                         value="${articleInfo.title}" style="width: 300px;"/></P>
        <p>content:</p>
        <div id="content" class="content" contenteditable="true">${articleInfo.content}
            <div class="video">${video}</div>
        </div>
        <input type="hidden" name="content" id="articleContentSubmit">
        <p>tag: <input type="text" id="tags" name="tag" placeholder="Please Enter Your Tag" value="${articleInfo.tags}"
                       style="width: 300px;"/></p>
        ${hiddenElement}
        ${submitElement}
        ${deleteElement}
    </fieldset>
</form>


<span>Add image</span>
<label for="image-input">
    <img title="add image" src="http://www.hugorc.es/static/images/galeria2.png" width="40px" height="40px">
</label>
<input id="image-input" type="file" style="display: none ;cursor: pointer;" accept=".jpg, .gif,.png">


<label for="audio-input">
    <img title="add video" src="http://www.iconsfind.com/wp-content/uploads/2016/04/20160405_57033268db0ea.png"
         width="40px" height="40px"/>
</label>
<input id="audio-input" type="file" style="display: none;cursor: pointer;">


<label for="video-input">
    <img title="add video"
         src="https://upload.wikimedia.org/wikipedia/commons/thumb/8/83/Circle-icons-videocameracompact.svg/1000px-Circle-icons-videocameracompact.svg.png"
         width="40px" height="40px"/>
</label>
<input id="video-input" type="file" style="display: none;cursor: pointer;">


<form action="AlbumsChange" method="post" enctype="multipart/form-data" onsubmit="prepareDivImage()">
    click to add image <input type="file" id="imageFile" accept=".jpg, .gif,.png" name="icon"/>
    <input type="submit" name="Confirm">
    <input type="hidden" name="articleTitle" id="imageTitle">
    <input type="hidden" name="articleTags" id="imageTags">
    <input type="hidden" name="articleContent" id="imageContent">
</form>
<form about="AlbumsChange" method="post" enctype="multipart/form-data">
    click to add audio <input type="file" id="audioFile" accept=".jpg, .gif,.png" name="icon"/>
</form>

<div class="myButton"><input type="submit" name="" value=""></div>


<input type="file" class="filestyle" data-input="false">

<p>click to add the Youtube video(Please use the link under "Embed")
    <button onclick="readLink()">click</button>
</p>

<form action="AlbumsChange" method="Post" onsubmit="prepareDivVideo()">
    click to add video <input type="file" id="videoFile" accept=".jpg, .gif,.png" name="icon"/>
    Video address: <input type="text" readonly name="videoAddress" id="videoAddress">
    <input type="hidden" name="articleTitle" id="videoTitle">
    <input type="hidden" name="articleTags" id="videoTags">
    <input type="hidden" name="articleContent" id="videoContent">
    <input type="hidden" name="action" value="createVideo">
    <input type="submit" onclick="return validateInput()" name="Confirm">
</form>


<div id="video"></div>
<c:if test="${information != null}">
    <p>${information}</p>
</c:if>


<script>
    //    function readLink() {
    //        var input = prompt("Please put your video link", "link here");
    //        if (input != null) {
    //            //var content=document.getElementById("content");
    //            //var contentText=content.innerHTML;
    //            //input="<div>"+input+"</div>";
    //            document.getElementById("videoAddress").value=input;
    //            document.getElementById("video").innerHTML=input;
    //            //content.innerHTML=contentText+input;
    //        }
    //    }
    //
    //    function prepareDivImage() {
    //        document.getElementById("imageTitle").value=document.getElementById("title").value;
    //        document.getElementById("imageTags").value=document.getElementById("tags").value;
    //        document.getElementById("imageContent").value = document.getElementById("content").innerHTML;
    //    }
    //    function prepareDivVideo() {
    //        document.getElementById("videoTitle").value=document.getElementById("title").value;
    //        document.getElementById("videoTags").value=document.getElementById("tags").value;
    //        document.getElementById("videoContent").value = document.getElementById("content").innerHTML;
    //    }
    //function prepareContent() {
    //    document.getElementById("articleContentSubmit").value = document.getElementById("content").innerHTML;
    //}
    //    function validateInput() {
    //        if( document.getElementById("videoAddress").value.trim().length=0){
    //            return false;
    //        }
    //    }
</script>
</body>
</html>