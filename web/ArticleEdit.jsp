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
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
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
</style>
</head>
<body>

<form id="form" action="Article" method="post" onsubmit="prepareContent()">
    <fieldset>
        <legend>Your article</legend>
        <p>title: <input type="text" id="title" name="title" placeholder="Please Enter Your Title" value="${articleInfo.title}" style="width: 300px;"/></P>
       <p>content:</p><div id="content" class="content" contenteditable="true" >${articleInfo.content}<div class="video">${video}</div> </div>
        <input type="hidden" name="content" id="articleContentSubmit">
        <p>tag: <input type="text" id="tags" name="tag" placeholder="Please Enter Your Tag"  value="${articleInfo.tags}" style="width: 300px;"/></p>
        ${hiddenElement}
        ${submitElement}
        ${deleteElement}
    </fieldset>
</form>

<form action="AlbumsChange" method="post" enctype="multipart/form-data" onsubmit="prepareDivImage()">
   click to add image <input type="file" id="imageFile" accept=".jpg, .gif,.png" name="icon"/>
    <input type="submit" name="Confirm">
    <input type="hidden" name="articleTitle" id="imageTitle">
    <input type="hidden" name="articleTags" id="imageTags">
    <input type="hidden" name="articleContent" id="imageContent">
</form>

<p>click to add the Youtube video(Please use the link under "Embed")<button onclick="readLink()">click</button></p>

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
<c:if test = "${information != null}">
    <p>${information}</p>
</c:if>
<script>
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

    function prepareDivImage() {
        document.getElementById("imageTitle").value=document.getElementById("title").value;
        document.getElementById("imageTags").value=document.getElementById("tags").value;
        document.getElementById("imageContent").value = document.getElementById("content").innerHTML;
    }
    function prepareDivVideo() {
        document.getElementById("videoTitle").value=document.getElementById("title").value;
        document.getElementById("videoTags").value=document.getElementById("tags").value;
        document.getElementById("videoContent").value = document.getElementById("content").innerHTML;
    }
function prepareContent() {
    document.getElementById("articleContentSubmit").value = document.getElementById("content").innerHTML;
}
    function validateInput() {
        if( document.getElementById("videoAddress").value.trim().length=0){
            return false;
        }
    }
</script>
</body>
</html>