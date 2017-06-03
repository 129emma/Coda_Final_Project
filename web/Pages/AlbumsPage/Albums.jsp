<%--
  Created by IntelliJ IDEA.
  User: txie936
  Date: 31/05/2017
  Time: 11:58 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>UserAlbums</title>
</head>
<body>
<jsp:include page="/Pages/NavBar/title.jsp"> <jsp:param name="title" value=""/> </jsp:include>
<h2>Your Albums</h2>
    <c:forEach var="albumsImage" items="${albumsImageInfoList}">
            <div>${albumsImage.address}</div>|
            <a href="AlbumsChange?albumsImageId=${albumsImage.id}&action=deleteImage"> Click to delete the image</a>|
    </c:forEach>
<br><br>
    <c:forEach var="albumsVideo" items="${albumsVideoInfoList}">
            <div>${albumsVideo.address}</div>|
            <a href="AlbumsChange?albumsVideoId=${albumsVideo.id}&action=deleteVideo"> Click to delete the video</a>|
    </c:forEach>
<c:forEach var="albumsAudio" items="${albumsAudioInfoList}">
    <div>${albumsAudio.address}</div>|
    <a href="AlbumsChange?albumsAudioId=${albumsAudio.id}&action=deleteAudio"> Click to delete the video</a>|
</c:forEach>

<br><br>

</body>
</html>
