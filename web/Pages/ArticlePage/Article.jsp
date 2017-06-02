
<%--
  Created by IntelliJ IDEA.
  User: txie936
  Date: 29/05/2017
  Time: 9:53 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Article</title>



</head>
<body>
<jsp:include page="/Pages/NavBar/title.jsp"> <jsp:param name="title" value=""/> </jsp:include>

<div class="panel">
    <div class="panel-body">
        <div class="panel-info">
            Title:${articleInfo.title};${articleInfo.postTime};<br>
            <p>${articleInfo.content}</p>
            <p>${articleInfo.tags}</p>
        </div>
        <div class="panel">
            <c:forEach var="comment" items="${commentInfoList}">
                <p>${comment.username}</p>
                <p>${comment.content}</p>
                <p>${comment.deleteComment}</p>
            </c:forEach>
            <form action="Comment" method="POST">
                <textarea name="comment" rows="5" cols="50" placeholder="Enter your comments here"></textarea><br/>
                <input type="hidden" name="articleID" value="${articleInfo.articleID}">
                <button type="submit" name="action" value="create">Comment here</button>
            </form>
        </div>
    </div>
    ${articleInfo.editArticle}<span>  <span>${articleInfo.deleteArticle}

</div>
</body>
</html>
