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
    <style>
        @import url(http://fonts.googleapis.com/css?family=Montserrat:400,700);
    </style>
</head>
<body>
<c:forEach var="article" items="${articleInfoList}">


    <div class="ui center aligned container responAvatar">
        <img class="ui raised tiny top aligned circular centered image userAvatar " src="${article.userAvatar}">
        <div class="followBtn">${article.followButton}</div>
    </div>

    <div class="ui segment keepContent">
        <div class="ui left close rail" style="width: 80px !important;">

            <div class="ui sticky" style="width: 80px !important;">
                <img class="ui raised tiny top aligned rounded image userAvatar " src="${article.userAvatar}">
            </div>
            <div class="ui flowing popup top left transition hidden">
                <div class="content">
                    <div class="header">${article.username}</div>

                    <div class="description">
                            ${article.followButton}
                    </div>
                </div>
            </div>
        </div>
        <div>
            <span style="align-content: center"><a href="${article.retrieveAddress}">${article.title}</a></span>
            <span class="ui red right ribbon label"><i class="spoon icon"></i> ${article.tags}</span>
        </div>
            ${article.preview}
        <div class="ui fitted divider"></div>
            ${article.postTime}
        <div class="ui attached right aligned segment">
            <span style="font-family: Montserrat, sans-serif">${article.likeNum} </span> &nbsp;&nbsp;<i
                class="ion-android-favorite-outline"></i>

        </div>

    </div>
</c:forEach>
</body>
</html>
