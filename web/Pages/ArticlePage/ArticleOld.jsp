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
    <title>Blog Page</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.10/semantic.css"/>
    <link rel="stylesheet" href="Article.css">
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.10/semantic.js"></script>
    <script src="Article.js"></script>
</head>
<body>
<jsp:include page="/Pages/NavBar/title.jsp">
    <jsp:param name="title" value=""/>
</jsp:include>
<div class="panel">
    <div class="panel-body">
        <div class="panel-info">
            Title:${articleInfo.title};${articleInfo.postTime};<br>
            <p>${articleInfo.content}</p>
            <p>${articleInfo.tags}</p>
        </div>
        <div class="ui minimal comments">
            <h3 class="ui dividing header">Comments</h3>
            <c:forEach var="comment" items="${commentInfoList}">
                <div class="comment">
                    <%--<a class="avatar">--%>
                        <%--<img src="/images/avatar/small/matt.jpg">--%>
                    <%--</a>--%>
                    <div class="content">
                        <a class="author">${comment.username}</a>
                        <div class="metadata">
                            <span class="date">${comment.postTime}</span>
                        </div>
                        <div class="text">
                                ${comment.content}
                        </div>
                        <div class="actions">
                            <a class="reply">Reply</a>
                            <a class="reply">${comment.deleteComment}</a>
                        </div>
                    </div>
                </div>
            </c:forEach>
            <form class="ui reply form" action="Comment" method="POST">
                <div class="field">
                    <textarea name="comment"></textarea>
                    <input type="hidden" name="articleID" value="${articleInfo.articleID}">
                </div>
                <div class="ui blue labeled submit icon button">
                    <i class="icon edit"></i>
                    <button type="submit" name="action" value="create">Comment</button>
                </div>
            </form>
        </div>
    </div>
    ${articleInfo.editArticle}<span>  <span>${articleInfo.deleteArticle}

</div>
</body>
</html>
