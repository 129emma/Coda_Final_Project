<%--
  Created by IntelliJ IDEA.
  User: xingjianche
  Date: 05/06/2017
  Time: 12:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Blog Page</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.10/semantic.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Pages/ArticlePage/Article.css">
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.10/semantic.js"></script>
    <script src="${pageContext.request.contextPath}/Pages/ArticlePage/Article.js"></script>

    <script src="${pageContext.request.contextPath}/Pages/NavigationBar/NavigationBar.js"></script>
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
    <div id="ArticleContainer" class="ui text justified container">
        <div class="ui raised segment keepContent">
            <h5 class="ui top attached segment">
                ${articleInfo.title}<span class="ui right">${articleInfo.postTime}</span>
            </h5>
            <div class="ui attached segment">
                <p>${articleInfo.content}</p>
            </div>
            <%--<img class="ui attached segment" src="../../testImage/icon.jpg">--%>
            <div class="ui attached segment">
                ${articleInfo.editArticle}
                ${articleInfo.deleteArticle}
                <div class="ui right labeled button" tabindex="0">
                    <a class="ui basic right pointing label">
                        999
                    </a>
                    <div class="ui button">
                        <i class="heart icon"></i> Like
                    </div>
                </div>
            </div>

            <%--<div class="overlay">--%>
            <%--<div class="ui labeled icon vertical menu">--%>
            <%--<a class="item"><i class="twitter icon"></i> Tweet</a>--%>
            <%--<a class="item"><i class="facebook icon"></i> Share</a>--%>
            <%--<a class="item"><i class="mail icon"></i> E-mail</a>--%>
            <%--</div>--%>
            <%--</div>--%>

            <div class="ui comments">
                <h3 class="ui dividing header">Comments</h3>
                <c:forEach var="comment" items="${commentInfoList}">
                    <div class="comment">
                        <a class="ui avatar">
                            <img src="User-Info/${comment.username}/avatar.jpg">
                        </a>
                        <div class="content">
                            <a class="author">${comment.username}</a>
                            <div class="metadata">
                                <span class="date">${comment.postTime}</span>
                            </div>
                            <div class="text">
                                    ${comment.content}
                            </div>
                            <div class="actions">
                                <a id="replyBtn" class='reply'><i class="reply icon" ></i></a>
                                ${comment.editBtn}
                                ${comment.deleteBtn}
                            </div>
                        </div>
                    </div>
                </c:forEach>
                <form class="ui reply form" action="Comment" method="POST">
                    <div class="field">
                        <textarea name="comment"></textarea>
                        <input type="hidden" name="articleID" value="${articleInfo.articleID}">
                    </div>
                    <button class="ui blue submit icon button" type="submit" name="action" value="create"><i
                            class="icon edit"></i>Comment
                    </button>
                </form>
            </div>
        </div>
    </div>

        <div class="ui segment modal" id="editComment">
            <form action="Comment" method="POST">
                <fieldset>
                    <legend>Edit Comment</legend>
                    <p><label for="editor">content: </label><textarea id="editor" name="content" rows="10" cols="100"></textarea></p>
                    <input type="submit" name="action" value="update"/>
                </fieldset>
            </form>
        </div>
</body>
</html>

