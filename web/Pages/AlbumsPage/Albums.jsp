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
    <style>
        div.gallery {
            margin: 5px;
            border: 1px solid #ccc;
            float: left;
            width: 200px;
            height: 280px;
        }
div.youtubeGallery{
    margin: 5px;
    border: 1px solid #ccc;
    float: left;
}
        div.videoGallery{
            margin: 5px;
            border: 1px solid #ccc;
            float: left;
            width: 400px;
            height: 300px;
        }
        div.audioGallery{
            margin: 5px;
            border: 1px solid #ccc;
            float: left;
            width: 250px;
            height: 100px;

        }
        div.gallery:hover div.videoGallery:hover div.audioGallery:hover{
            border: 1px solid #777;
        }

        div.gallery img {
            width: 100%;
            height: 200px;
        }
        div.videoGallery video {
            width: 100%;
            height: 220px;
        }

        div.audioGallery audio {
            width: 100%;
        }
        div.desc {
            padding: 15px;
            text-align: center;
        }
    </style>


</head>
<body onload="loadUserImage()">
<jsp:include page="/Pages/NavBar/title.jsp"> <jsp:param name="title" value=""/> </jsp:include>
<button onclick="loadUserImage()">User Image</button>|<button onclick="loadUserVideo()">User video</button>|<button onclick="loadUserAudio()">User audio</button>|<button onclick="loadUserYoutube()">User youtube</button>
<div id="content">
</div>
<div style="width: 100px" id="loading">
    <img src="http://www.belmont.gov/Project/Contents/Main/_gfx/home/ajax-loader.gif" alt="Loading">
</div>

<script>

    function loadUserImage() {
        $('#loading').show();
        $('#content').html("");
        $.ajax({
            url: '/Albums',
            type: 'POST',
            data: {action:'loadUserImage'},
            success: function (data) {
                $('#loading').hide();
                $('#content').html(data);
            }
        });
    }
    
    function loadUserVideo() {
        $('#loading').show();
        $('#content').html("");
        $.ajax({
            url: '/Albums',
            type: 'POST',
            data: {action:'loadUserVideo'},
            success: function (data) {
                $('#loading').hide();
                $('#content').html(data);
            }
        });
    }
    function loadUserAudio() {
        $('#loading').show();
        $('#content').html("");
        $.ajax({
            url: '/Albums',
            type: 'POST',
            data: {action:'loadUserAudio'},
            success: function (data) {
                $('#loading').hide();
                $('#content').html(data);
            }
        });
    }
    function loadUserYoutube() {
        $('#loading').show();
        $('#content').html("");
        $.ajax({
            url: '/Albums',
            type: 'POST',
            data: {action:'loadUserYoutube'},
            success: function (data) {
                $('#loading').hide();
                $('#content').html(data);
            }
        });
    }
</script>
</body>
</html>
