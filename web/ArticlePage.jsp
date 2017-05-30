<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: txie936
  Date: 29/05/2017
  Time: 9:53 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Article</title>
    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<div class="panel">
    <div class="panel-body">
        <div class="panel-info">
            Title:${article.title};${article.postTime};<br>
            <p>${article.content}</p>
            <p>${article.tags}</p>
        </div>
        <div class="panel">
            <c:forEach var="comment" items="${commentInfoList}">
                <p>${comment.username}</p>
                <p>${comment.content}</p>
                <p>${comment.deleteComment}</p>
            </c:forEach>
            <form action="Comment" method="POST">
                <textarea name="comment" rows="5" cols="50" placeholder="Enter your comments here"></textarea><br/>
                <input type="hidden" name="articleID" value="${articleID}">
                <button type="submit" name="action" value="create">Comment here</button>
            </form>
        </div>
    </div>
    <a href="ChangeArticle?articleChange=true&articleID=${article.articleID}">click to change this article</a>

</div>
</body>
</html>
