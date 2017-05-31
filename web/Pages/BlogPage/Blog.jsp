<%--
  Created by IntelliJ IDEA.
  User: qpen546
  Date: 23/05/2017
  Time: 1:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html class="full" lang="en">
<head>
    <title>Blog</title>

    <link rel="stylesheet" type="text/css" href="/Pages/BlogPage/Blog.css">
    <!-- JQuery -->
    <script src="https://code.jquery.com/jquery-3.2.0.js"
            integrity="sha256-wPFJNIFlVY49B+CuAIrDr932XSb6Jk3J1M22M3E2ylQ=" crossorigin="anonymous"></script>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
          crossorigin="anonymous">

    <!-- Bootstrap JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
            integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
            crossorigin="anonymous"></script>
</head>
<body>
<nav class="navbar navbar-top navbar-inverse">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"
                    aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand">Code Blog</a>
        </div>

        <div id="navbar" class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li><a href="Blog?page=home">Home</a></li>
                <li><a href="Blog?page=spotlight">Spotlight</a></li>
                <li><a href="Profile">Profile</a></li>
                <li><a href="Article?action=create"><p>Create article</p></a></li>
                <li><a href="Login?action=logout">Logout</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="container">
    <div class="col-xs-12 col-md-3 panel panel-default">
        <img class="img-circle img-responsive" src="" alt="avatar" id="image">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">Profile</h3>
            </div>
            <div class="panel-body" id="profile_content">
                <p><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> Full Name</p>
                <p><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> Location</p>
            </div>
        </div>
    </div>

    <div class="col-xs-12 col-md-9 panel panel-default">
        <div style="margin-bottom: 20px"></div>
        <c:forEach var="article" items="${articleInfoList}">
            <div class="panel panel-default">
                <div class="panel-heading"><a href="${article.retrieveAddress}">${article.title}</a>${article.postTime}</div>
                <div class="panel-body">${article.content} </p></div>
                    <%--<c:forEach var="commentInfo" items="${commentInfoListOFAllArticle.get(article.articleID)}">--%>
                    <%--<div class="panel panel-default">--%>
                    <%--<div class="panel-heading"><a href="Article?articleID=${article.articleID}" >${commentInfo.username} </a>${commentInfo.postTime}</div>--%>
                    <%--<div class="panel-body">${commentInfo.content}</div>--%>
                    <%--</div>--%>
                    <%--</c:forEach>--%>
            </div>
        </c:forEach>
    </div>
</div>
</body>
</html>