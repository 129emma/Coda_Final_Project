<%--
  Created by IntelliJ IDEA.
  User: txie936
  Date: 30/05/2017
  Time: 2:15 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Video</title>

</head>
<body>
<p>click to add the Youtube video(Please use the link under "Embed")</p><button onclick="myFunction()">click</button><br><br>


<div id="frame"></div>

<form action="AlbumsChange" method="Get">
    <input type="hidden" name="link" id="link">
    <input type="submit" name="submit">
</form>

<script>

    function myFunction() {
        var input = prompt("Please put your video link", "link here");
        if (input != null) {
            document.getElementById("link").val=input;
            document.getElementById("frame").innerHTML=input;
        }
    }
</script>
</body>
</html>
