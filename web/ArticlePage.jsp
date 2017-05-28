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
</head>
<body>

Title:${article.title};${article.post_time};<br>
<p>${article.content}</p>
<p>${article.tags}</p>
<a href="ChangeArticle?articleChange='true'&articleID=${article.article_ID}" >click to change this article</a>



</body>
</html>
