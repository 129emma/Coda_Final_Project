<%--
  Created by IntelliJ IDEA.
  User: txie936
  Date: 31/05/2017
  Time: 11:58 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>UserAlbums</title>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>


</head>
<body onload="loadUserImage()">
<jsp:include page="/Pages/NavBar/title.jsp"> <jsp:param name="title" value=""/> </jsp:include>
<button onclick="loadUserImage()">User Image</button>|<button onclick="loadUserVideo()">User video</button>|<button onclick="loadUserAudio()">User audio</button>|<button onclick="loadUserYoutube()">User youtube</button>
<div id="content">
</div>
<script>
    function loadUserImage() {
        $.ajax({
            url: '/Albums',
            type: 'POST',
            data: {action:'loadUserImage'},
            success: function (data) {
                $('#content').html(data);
            }
        });
    }
    
    function loadUserVideo() {
        $.ajax({
            url: '/Albums',
            type: 'POST',
            data: {action:'loadUserVideo'},
            success: function (data) {
                $('#content').html(data);
            }
        });
    }
    function loadUserAudio() {
        $.ajax({
            url: '/Albums',
            type: 'POST',
            data: {action:'loadUserAudio'},
            success: function (data) {
                $('#content').html(data);
            }
        });
    }
    function loadUserYoutube() {
        $.ajax({
            url: '/Albums',
            type: 'POST',
            data: {action:'loadUserYoutube'},
            success: function (data) {
                $('#content').html(data);
            }
        });
    }
</script>
</body>
</html>
