<%--
  Created by IntelliJ IDEA.
  User: txie936
  Date: 10/06/2017
  Time: 5:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Friends</title>
</head>
<body>


<div class="ui pointing menu">
    <a class="item active" id="getFollows">
        Follows<div class="floating ui label">${followsNumber}</div>
    </a>
    <a class="item" id="getFollowers">
       Followers<div class="floating ui label">${followersNumber}</div>
    </a>

</div>
<div class="ui segment" id="followInfo">

    <div class="ui large aligned divided list" id="follows">
        <c:forEach var="follow" items="${followsList}">
            <div class="item">
                <div class="right floated content">
                        ${follow.followStatus}
                </div>
                <img class="ui avatar image" src="${follow.avatar}">
                <div class="content">${follow.username}</div>
            </div>
        </c:forEach>
    </div>

    <div class="ui large aligned divided list" id="followers">

        <c:forEach var="follower" items="${followersList}">
            <div class="item">
                <div class="right floated content">
                        ${follower.followStatus}
                </div>
                <img class="ui avatar image" src="${follower.avatar}">
                <div class="content">${follower.username}</div>
            </div>
        </c:forEach>
    </div>
</div>
</body>
</html>
