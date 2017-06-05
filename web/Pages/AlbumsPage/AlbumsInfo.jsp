<%--
  Created by IntelliJ IDEA.
  User: 熊猫
  Date: 2017/6/6
  Time: 0:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html >
<head>
    <title>AlbumsInfo</title>
    <style>
        div.gallery {
            margin: 5px;
            border: 1px solid #ccc;
            float: left;
            width: 200px;
            height: 280px;
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
<body>
<c:forEach var="albumsImage" items="${albumsImageInfoList}">
    <div class="gallery">
        <a target="_blank" href="${albumsImage.address}">
            <img src=" ${albumsImage.address}" alt="${albumsImage.fileName}">
        </a>
        <div class="desc">${albumsImage.postTime} <a href="AlbumsChange?imageFileName=${albumsImage.fileName}&imageID=${albumsImage.id}&action=deleteImage" class="btn btn-info btn-sm">
            <span class="glyphicon glyphicon-trash"></span> Delete
        </a>
        </div>
    </div>
</c:forEach>

<c:forEach var="albumsVideo" items="${albumsVideoInfoList}">
    <div class="videoGallery">
        <a target="_blank" href="${albumsVideo.address}">
            <video width="400" controls>
                <source src="${albumsVideo.address}" type="video/mp4">
                <source src="${albumsVideo.address}" type="video/ogg">
                Your browser does not support HTML5 video.
            </video>
        </a>
        <div class="desc">${albumsVideo.postTime} <a href="AlbumsChange?videoFileName=${albumsVideo.fileName}&videoID=${albumsVideo.id}&action=deleteVideo" class="btn btn-info btn-sm">
            <span class="glyphicon glyphicon-trash"></span> Delete
        </a>
        </div>
    </div>
</c:forEach>

<c:forEach var="albumsAudio" items="${albumsAudioInfoList}">
    <div class="audioGallery">
        <a target="_blank" href="${albumsAudio.address}">
            <audio controls>
                <source src="${albumsAudio.address}" type="audio/ogg">
                <source src="${albumsAudio.address}" type="audio/mpeg">
                Your browser does not support the audio tag.
            </audio>
        </a>
        <div class="desc">${albumsAudio.postTime} <a href="AlbumsChange?audioFileName=${albumsAudio.fileName}&audioID=${albumsAudio.id}&action=deleteAudio" class="btn btn-info btn-sm">
            <span class="glyphicon glyphicon-trash"></span> Delete
        </a>
        </div>
    </div>
</c:forEach>
<br><br>
</body>
</html>