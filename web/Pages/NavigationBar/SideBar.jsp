<%--
  Created by IntelliJ IDEA.
  User: qpen546
  Date: 6/06/2017
  Time: 11:39 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Navigation Bar</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.10/semantic.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Pages/NavigationBar/NavigationBar.css">


    <script
            src="https://code.jquery.com/jquery-3.2.1.min.js"
            integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.10/semantic.js"></script>
    <script src="${pageContext.request.contextPath}/Pages/NavigationBar/NavigationBar.js"></script>

</head>
<body class="full">

<!-- SideBar Menu-->
<div class="ui sidebar vertical menu">
    <img class="sideBarIcon" src="../../testImage/icon_white.png">
    <a href="Blog?page=home" class="item">
        Home
    </a>
    <a href="Blog?page=spotlight" class="item">
        Stoplight
    </a>
    <a href="Profile" class="item">
        Profile
    </a>
    <a href="Albums" class="item">
        Albums
    </a>
    <a href="Login?action=logout" class="item">
        Logout
    </a>
</div>

<!-- Page Content !-->
<div class="pusher">

    <div class="ui masthead borderless menu">
        <div class="ui container">
            <a class="toc item">
                <i class="sidebar icon"></i>
            </a>
            <div class="ui search">
                <div class="ui icon input">
                    <input class="prompt" type="text" placeholder="Searching friends">
                    <i class="search icon"></i>
                </div>
                <div class="results"></div>
            </div>
            <a href="Blog?page=home" class="item iconClass"><i class="large home icon"></i></a>
            <a href="Blog?page=spotlight" class="item iconClass"><i class="large world icon"></i></a>
            <a href="Profile" class="item iconClass"><i class="large user icon"></i></a>
            <a href="Albums" class="item iconClass"><i class="large camera retro icon"></i></a>
            <a href="Login?action=logout" class="item iconClass"><i class="large sign out icon"></i></a>
            <img class="teamIcon" src="../../testImage/icon_black.png">
        </div>

    </div>

</div>


</body>
</html>
