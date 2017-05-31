<%--
  Created by IntelliJ IDEA.
  User: txie936
  Date: 30/05/2017
  Time: 2:15 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Add Video</title>

</head>
<body>
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
