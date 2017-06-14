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
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
    <title>UserAlbums</title>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.10/semantic.css"/>
    <link rel="stylesheet" href="http://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">

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

    <div class="ui container my" id="imageGallery">
        <div class="ui segment" id="gallery" style="display: none">

            <div class="ui pointing menu">
                <a class="item active" id="showUsers">
                    Yours
                </a>
                <a class="item" id="showSpotlight">
                    Spotlight
                </a>
            </div>

            <div class="ui right close rail">


                <div class="ui vertical labeled icon menu">
                    <a class="item" onclick="loadUserImage()">
                        <i class="photo icon"></i>
                        Photos
                    </a>
                    <a class="item" onclick="loadUserAudio()">
                        <i class="video camera icon "></i>
                        Music
                    </a>
                    <a class="item" onclick="loadUserVideo()">
                        <i class="video play icon"></i>
                        Videos
                    </a>
                    <a class="item" onclick="loadUserYoutube()">
                        <i class="youtube play icon"></i>
                        Youtube
                    </a>
                </div>
            </div>

            <div class="ui segment" id="multimediaSegment">
                <div id="content">
                </div>
            </div>

        </div>
        <div class="ui center aligned vertical segment" id="loading">
            <div class="ui icon message">
                <i class="notched circle loading icon"></i>
                <div class="content">
                    <div class="header">
                        Just one second
                    </div>
                    <p>We're loading the content for you.</p>
                </div>
            </div>

        </div>
    </div>

</div>
</body>
</html>
