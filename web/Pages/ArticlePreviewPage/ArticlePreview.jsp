<%--
  Created by IntelliJ IDEA.
  User: qpen546
  Date: 3/06/2017
  Time: 2:07 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>ArticlePreview</title>
</head>
<body>

<c:forEach var="article" items="${articleInfoList}">
        <div class="ui segment keepContent">
            <div class="ui left close rail" style="width: 80px !important;">
                <div class="ui bound bottom sticky" style="width: 80px !important;">
                    <img class="ui raised tiny top aligned rounded image userAvatar userAvatarToHover" src="User-Info/${article.username}/avatar.jpg">
                </div>
                <div class="ui custom popup top transition hidden">
                    <div class="ui raised link card">
                        <div class="content">
                            <div class="header">Username</div>
                            <div class="meta">
                                <span class="category">Animals</span>
                            </div>
                            <div class="description">
                                <p></p>
                            </div>
                        </div>
                        <div class="extra content">
                            <div class="right floated author">
                                <i class="record icon"></i> Matt
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <h5 class="ui top attached segment">
                <a href="${article.retrieveAddress}">${article.title}</a> ${article.postTime}
            </h5>
            <div class="ui attached segment">
                <p>${article.preview}</p>
            </div>
                <%--<img class="ui attached segment" src="../../testImage/icon.jpg">--%>
            <div class="ui attached segment">
                <div class="ui left labeled button" tabindex="0">
                    <a class="ui basic right pointing label">
                        999
                    </a>
                    <div class="ui button">
                        <i class="heart icon"></i> Like
                    </div>
                </div>
            </div>
        </div>
</c:forEach>

</body>
</html>
