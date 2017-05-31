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
    div{
        margin: auto;
    }
</style>
</head>
<body>
<form id="form" action="Article" method="post" onsubmit="prepareContent()">
    <fieldset>
        <legend>Your article</legend>
        <p>title: <input type="text" name="title" placeholder="Please Enter Your Title" value="${articleInfo.title}" style="width: 300px;"/></P>
       <p>content:</p><div id="content" class="content" contenteditable="true" >${articleInfo.content}</div>
        <input type="hidden" name="content" id="articleContentSubmit">
        <p>tag: <input type="text" name="tag" placeholder="Please Enter Your Tag"  value="${articleInfo.tags}" style="width: 300px;"/></p>
        ${hiddenElement}
        ${submitElement}
        ${deleteElement}
    </fieldset>
</form>
<form action="AlbumsChange" method="post" enctype="multipart/form-data" onsubmit="prepareDivImage()">
   click to add image <input type="file" id="imageFile" accept=".jpg, .gif,.png" name="icon"/>
    <input type="submit" name="submit">
    <input type="hidden" name="ArticleContent" id="imageAddress">
</form>
<p>click to add the Youtube video(Please use the link under "Embed")<button onclick="readLink()">click</button></p>
<form action="AlbumsChange" method="Post" onsubmit="prepareDivVideo()">
    Video address: <input type="text" readonly name="videoAddress" id="videoAddress">
    <input type="hidden" name="ArticleContent" id="ArticleContent">
    <input type="hidden" name="action" value="createVideo">
    <input type="submit" onclick="return validateInput()" name="Submit">
</form>

<c:if test = "${information != null}">
    <p>${information}</p>
</c:if>
<script>
    function readLink() {
        var input = prompt("Please put your video link", "link here");
        if (input != null) {
            var content=document.getElementById("content");
            var contentText=content.innerHTML;
            input="<div>"+input+"</div>";
            document.getElementById("videoAddress").value=input;
            content.innerHTML=contentText+input;
        }
    }

    function prepareDivImage() {
        document.getElementById("imageAddress").value = document.getElementById("content").innerHTML;
    }
    function prepareDivVideo() {
        document.getElementById("ArticleContent").value = document.getElementById("content").innerHTML;
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