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

    <script src="${pageContext.request.contextPath}/Pages/NavigationBar/NavigationBar.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Pages/NavigationBar/NavigationBar.css">
    <script>
        var page = '${page}';
    </script>

</head>
<body>

<jsp:include page="${pageContext.request.contextPath}/Pages/NavigationBar/SideBar.jsp">
    <jsp:param name="SideBar" value=""/>
</jsp:include>

<div class="pusher full">
    <jsp:include page="${pageContext.request.contextPath}/Pages/NavigationBar/NavigationBar.jsp">
        <jsp:param name="NavigationBar" value=""/>
    </jsp:include>

    <!-- Page Content !-->
<div class="ui container">
    <div class="ui text justified container">
        <div class="ui segment">
            <ul class="userChoice">
                <li>
                    <div class="ui icon basic button" data-tooltip="Post">
                        <i class="grey big talk outline icon"></i>
                    </div>
                </li>
                <li>
                    <div class="ui icon basic button" data-tooltip="Photo">
                        <i class="orange big image icon"></i>
                    </div>
                </li>
                <li>
                    <div class="ui icon basic button" data-tooltip="Music">
                        <i class="yellow big music icon"></i>
                    </div>
                </li>
                <li>
                    <div class="ui icon basic button" data-tooltip="Video">
                        <i class="green big record icon"></i>
                    </div>
                </li>
                <li>
                    <div class="ui icon basic button" data-tooltip="Article">
                        <a href="Article?action=create"> <i class="blue big newspaper icon"></i></a>
                    </div>
                </li>
            </ul>

        </div>
    </div>

    <div id="ArticleContainer" class="ui text justified container">
    </div>
</div>
</div>
</body>
</html>