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
<html>
<head>
    <title>UserAlbums</title>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.10/semantic.css"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.10/semantic.js"></script>
    <script src="${pageContext.request.contextPath}/Pages/NavigationBar/NavigationBar.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Pages/NavigationBar/NavigationBar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Pages/AlbumsPage/Albums.css">
    <script src="${pageContext.request.contextPath}/Pages/AlbumsPage/Albums.js"></script>

</head>
<body onload="loadUserImage()">
<jsp:include page="${pageContext.request.contextPath}/Pages/NavigationBar/SideBar.jsp">
    <jsp:param name="SideBar" value=""/>
</jsp:include>
<div class="pusher full">
    <jsp:include page="${pageContext.request.contextPath}/Pages/NavigationBar/NavigationBar.jsp">
        <jsp:param name="NavigationBar" value=""/>
    </jsp:include>

    <div class="ui my container" id="imageGallery">
        <div class="ui dividing header">
            <h1>Gallery</h1>
        </div>
        <div class="ui segment"> <!--this div for show up all the image/video/audio-->
            <!-- all images should be resized for fitting container , and size for small images is 150px-->
            <div class="ui right close rail">
                <div class="ui vertical labeled icon menu">
                    <a class="item" onclick="loadUserImage()" >
                        <i class="photo icon" ></i>
                        Photos
                    </a>
                    <a class="item" onclick="loadUserAudio()">
                        <i class="video camera icon " ></i>
                        Music
                    </a>
                    <a class="item" onclick="loadUserVideo()">
                        <i class="video play icon" ></i>
                        Videos
                    </a>
                    <a class="item" onclick="loadUserYoutube()">
                        <i class="youtube play icon" ></i>
                        Youtube
                    </a>
                </div>
            </div>

            <div id="content">
            </div>
            <div class="ui center aligned vertical segment" id="loading">
                <div>
                    <img src="http://cdn7.evimed.net/wp-content/uploads/2017/02/loading.gif" style="width:100px" alt="Loading">
                </div>

            </div>

        </div>
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
