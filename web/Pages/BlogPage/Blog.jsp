<%--
  Created by IntelliJ IDEA.
  User: qpen546
  Date: 23/05/2017
  Time: 1:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>userProfilePage</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.10/semantic.css"/>
    <script
            src="https://code.jquery.com/jquery-3.2.1.min.js"
            integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.10/semantic.js"></script>
    <script src="${pageContext.request.contextPath}/Pages/BlogPage/Blog.js"></script>
    <script src="${pageContext.request.contextPath}/Pages/NavigationBar/NavigationBar.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Pages/BlogPage/Blog.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Pages/NavigationBar/NavigationBar.css">
</head>
<body>

<jsp:include page="${pageContext.request.contextPath}/Pages/NavigationBar/SideBar.jsp">
    <jsp:param name="SideBar" value=""/>
</jsp:include>

<div class="pusher full">
    <jsp:include page="${pageContext.request.contextPath}/Pages/NavigationBar/NavigationBar.jsp">
        <jsp:param name="NavigationBar" value=""/>
    </jsp:include>
    <script>
        var page = '${page}';
    </script>
    <!-- Page Content !-->

    <div class="ui text container">
        <div class="ui raised segment">
            <div class="left ui rail">
                <img class="userAvatar" src='${userInfo.avatar}'>
            </div>
            <ul class="userChoice">
                <li>
                    <div class="ui icon basic button" data-tooltip="Post">
                        <i class="large talk outline icon"></i>
                    </div>
                </li>
                <li>
                    <div class="ui icon basic button" data-tooltip="Photo">
                        <i class="large image icon"></i>
                    </div>
                </li>
                <li>
                    <div class="ui icon basic button" data-tooltip="Music">
                        <i class="large music icon"></i>
                    </div>
                </li>
                <li>
                    <div class="ui icon basic button" data-tooltip="Music">
                        <i class="large record icon"></i>
                    </div>
                </li>
                <li>
                    <div class="ui icon basic button" data-tooltip="Music">
                        <a href="Article?action=create"> <i class="large newspaper icon"></i></a>
                    </div>
                </li>
            </ul>

        </div>
    </div>

    <div id="ArticleContainer" class="ui text container">
    </div>

</div>
</body>
</html>