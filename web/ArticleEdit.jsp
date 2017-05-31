<%--
  Created by IntelliJ IDEA.
  User: qpen546
  Date: 31/05/2017
  Time: 12:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>

</head>
<body>
<form id="form" action="Article" method="post">
    <fieldset>
        <legend>Your article</legend>
        <p>title: <input type="text" name="title" placeholder="Please Enter Your Title" value="${articleInfo.title}" style="width: 300px;"/></P>
        <p>content:<br> <textarea  id="content" name="content" placeholder="Please Enter Your Content" rows="50" cols="100">${articleInfo.content}</textarea></p>
        <p>tag: <input type="text" name="tag" placeholder="Please Enter Your Tag"  value="${articleInfo.tags}" style="width: 300px;"/></p>
        ${hiddenElement}
        ${submitElement}
        ${deleteElement}
    </fieldset>
</form>

<form action="AlbumsChange?" method="post" enctype="multipart/form-data">
    <p>click to add image <input type="file" id="imageFile" accept=".jpg, .gif,.png" name="icon"/><br></p>
    <input type="submit" name="submit">
</form>
<c:if test = "${information != null}">
    <p>${information}</p>
</c:if>
<p>click to add the Youtube video(Please use the link under "Embed")</p><button onclick="readLink()">click</button><br><br>
<div id="frame"></div>
<form action="AlbumsChange" method="Post">
    Video address: <input type="text" readonly name="action" id="videoAddress">
    <input type="submit" onclick="return validateInput()" name="submit">
</form>
<c:if test = "${error != null}">
    <p>${error}</p>
</c:if>
<script>
    function readLink() {
        var input = prompt("Please put your video link", "link here");
        if (input != null) {
            document.getElementById("videoAddress").value=input;
            document.getElementById("frame").innerHTML=input;
        }
    }
    function validateInput() {
        if( document.getElementById("link").value.trim().length=0){
            return false;
        }
    }
</script>
</body>
</html>