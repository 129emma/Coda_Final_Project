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
    <title>Bootstrap Example</title>
    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="css/basicSetting.css" rel="stylesheet">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
    <h2>
        <p style="color: black">Hello ${sessionScope.username}, This is Blog page!</p>
    </h2>
    <a href="/ChangePassword">Change your password</a>|
    <a href="/Login">Login</a>|
    <a href="/Logout">Logout</a>
    <br>
    <a href="/CreateArticle.jsp"><p>Create article</p></a>
    <div class="panel-group">
        <c:forEach var="article" items="${articleList}">
        <div class="panel panel-default">
            <div class="panel-heading"><a href="Article?articleID=${article.article_ID}" >${article.title} </a>${article.post_time}</div>
            <div class="panel-body">${article.content} </p></div>
        </div>
        </c:forEach>
    </div>
</div>
</body>
</html>