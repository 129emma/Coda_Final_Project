<%--
  Created by IntelliJ IDEA.
  User: qpen546
  Date: 6/06/2017
  Time: 11:39 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<body class="full">
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
</body>
