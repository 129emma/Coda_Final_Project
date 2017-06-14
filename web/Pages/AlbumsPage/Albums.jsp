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
        <div class="ui segment"  id="gallery" style="display: none">

            <div class="ui pointing menu">
                <a class="item active" id="showUsers">
                    Yours
                </a>
                <a class="item" id="showSpotlight">
                    Spotlight
                </a>
            </div>

            <!--this div for show up all the image/video/audio-->
        <div class="ui basic segment responsiveMenu">
            <div class="ui labeled borderless icon menu">
                <a class="item" onclick="loadUserImage()">
                    <img class="ui centered image" src="Icons/photo.png">
                    <%--<i class="ion-ios-camera-outline albumIcons"></i>
                    <p>Photo</p>--%>
                </a>
                <a class="item" onclick="loadUserAudio()">
                    <img class="ui centered image" src="Icons/music.png">
                    <%--<i class="ion-ios-musical-notes albumIcons"></i>
                    <p>Music</p>--%>
                </a>
                <a class="item" onclick="loadUserVideo()">
                    <img class="ui centered image" src="Icons/video.png">
                    <%-- <i class="ion-ios-videocam-outline albumIcons"></i>
                    <p>Videos</p>--%>

                </a>
                <a class="item" onclick="loadUserYoutube()">
                    <img class="ui centered image" src="Icons/youtube.png">
                    <%--<i class="ion-social-youtube-outline"></i>--%>
                </a>
            </div>
        </div>


            <!--this div for show up all the image/video/audio-->
            <!-- all images should be resized for fitting container , and size for small images is 150px-->
            <div class="ui right close rail">
                <div class="ui vertical labeled borderless icon menu">
                    <a class="item" onclick="loadUserImage()">
                        <img class="ui centered image" src="Icons/photo.png">
                        <%--<i class="ion-ios-camera-outline albumIcons"></i>
                        <p>Photo</p>--%>
                    </a>
                    <a class="item" onclick="loadUserAudio()">
                        <img class="ui centered image" src="Icons/music.png">
                        <%--<i class="ion-ios-musical-notes albumIcons"></i>
                        <p>Music</p>--%>
                    </a>
                    <a class="item" onclick="loadUserVideo()">
                        <img class="ui centered image" src="Icons/video.png">
                        <%-- <i class="ion-ios-videocam-outline albumIcons"></i>
                        <p>Videos</p>--%>
                    </a>
                    <a class="item" onclick="loadUserYoutube()">
                        <img class="ui centered image" src="Icons/youtube.png">
                        <%--<i class="ion-social-youtube-outline"></i>--%>
                    </a>
                </div>
            </div>

   <div class="ui segment">
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

<script>

    function loadUserImage() {

        loadInfo('Image');

    }

    function loadUserVideo() {

        loadInfo('Video');

        refresh();
    }

    function loadUserAudio() {

        loadInfo('Audio');

    }
    function loadUserYoutube() {

        loadInfo('Youtube');

    }
    function loadInfo(info) {
        $('#gallery').hide();
        $('#loading').show();
        $.ajax({
            url: '/Albums',
            type: 'POST',
            data: {action: info},
            success: function (data) {
                var content=data.substring(data.indexOf("<div id='"+info+"'>"), data.indexOf("<div id='"+info+"End'>"));
                $('#content').html(content);
                var userContentID="#user"+info+"List";
                var spotlightContentID="#spotlight"+info+"List";

                if(!$.trim( $(userContentID).html()).length){
                    $(userContentID).html("<div style='text-align:center'><img src='https://media0.giphy.com/media/vLq5FWMjfN47S/giphy.gif'  alt='Loading'></div>");
                }

                if(!$.trim( $(spotlightContentID).html()).length){

                    $(spotlightContentID).html("<div style='text-align:center'><img src='https://media0.giphy.com/media/vLq5FWMjfN47S/giphy.gif'  alt='Loading'></div>");
                }

                $("#showUsers").addClass("active").off().click(function () {
                    $(userContentID).show();
                    $(spotlightContentID).hide();
                });
                $("#showSpotlight").removeClass("active").off().click(function () {
                    $(userContentID).hide();
                    $(spotlightContentID).show();
                });
                refresh();
                $('#gallery').show();
                $('#loading').hide();
                $(userContentID).show();
                $(spotlightContentID).hide();
            }
        });
    }



    function refresh() {
        handler = {
            activate: function() {
                if(!$(this).hasClass('dropdown browse')) {
                    $(this)
                        .addClass('active')
                        .closest('.ui.menu')
                        .find('.item')
                        .not($(this))
                        .removeClass('active')
                    ;
                }
            }
        };
        $('.menu .item').on('click', handler.activate)
        ;
    }

</script>
</body>
</html>
