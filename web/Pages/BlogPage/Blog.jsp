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
    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="css/basicSetting.css" rel="stylesheet">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="Blog.js"></script>
</head>
<body>
<h2>${userProfile.username} Welcome to coda</h2>
<nav class="navbar navbar-default navbar-dark bg-primary fixed-top" role="navigation">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse"
                    data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand">Main Menu</a>
        </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li><a href="Blog?page=home">Home</a></li>
                <li><a href="Blog?page=spotlight">Spotlight</a></li>
                <li><a href="Profile">Profile</a></li>
                <li><a href="Article?action=create"><p>Create article</p></a></li>
                <li><a href="Logout">Logout</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="container">
    <div class="panel-group">
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