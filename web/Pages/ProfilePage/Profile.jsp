<%--
  Created by IntelliJ IDEA.
  User: xingjianche
  Date: 06/06/2017
  Time: 6:04 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Profile</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.10/semantic.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/Pages/ProfilePage/Profile.css">
    <link rel="stylesheet" href="http://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">

    <script src="https://code.jquery.com/jquery-3.2.1.min.js" type="text/javascript"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.10/semantic.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/Pages/ProfilePage/Profile.js"></script>
</head>
<body>
<div class="ui people shape">
    <div class="sides">
        <div class="side active">
            <div class="ui card">
                <div class="image">
                    <img src="https://semantic-ui.com/images/avatar/large/steve.jpg">
                </div>
                <div class="content">
                    <div class="header">xingjian</div>
                    <div class="description">
                        A fictional character designed to resemble someone familiar to readers.
                    </div>
                </div>
                <div class="extra content">
                    <div id="flipright" class="ui icon button">
                        View Details
                        <i class="right long arrow icon"></i>
                    </div>
                </div>
            </div>
        </div>
        <div class="side">
            <div class="ui card">
                <div class="image">
                    <img src="https://semantic-ui.com/images/avatar/large/steve.jpg">
                </div>
                <div class="content">
                    <a class="header">Xingjian Che</a>
                    <div class="meta">
                        ${userProfile.username}
                    </div>
                    <div class="description">
                        <p>Email: ${userProfile.email}</p>
                        <p>Birthday: ${userProfile.birthDate}</p>
                        <p>Gender: ${userProfile.gender}</p>
                    </div>
                </div>
                <div class="extra content">
                    <div id="flipleft" class="ui icon button">
                        Back
                        <i class="left long arrow icon"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
