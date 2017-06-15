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
        Follows
        <div class="floating ui label">${followsNumber}</div>
    </a>
    <a class="item" id="getFollowers">
        Followers
        <div class="floating ui label">${followersNumber}</div>
    </a>
</div>

<div id="followInfo">
    <div class="ui segment" id="followList">
        <div class="ui large aligned divided list" id="follows">
            <c:forEach var="follow" items="${followsList}">
                <div class="item">
                    <div class="right floated content">
                            ${follow.followStatus}
                    </div>
                    <a href="Blog?page=user&targetUser=${follow.username}"><img class="ui avatar image" src="${follow.avatar}"></a>
                    <div class="content">${follow.username}</div>
                </div>
            </c:forEach>
        </div>
    </div>
    <div class="ui icon message" id="noFollowInfo" style="display: none">
        <i class="frown icon"></i>
        <div class="content">
            <div class="header">
                You don't have any follows!
            </div>
            <a href='Blog?page=spotlight'><h4>Let's start follow someone!</h4></a>
        </div>
    </div>
</div>


<div id="followerInfo">
    <div class="ui segment" id="followerList">
        <div class="ui large aligned divided list" id="followers">

            <c:forEach var="follower" items="${followersList}">
                <div class="item">
                    <div class="right floated content">
                            ${follower.followStatus}
                    </div>
                    <a href="Blog?page=user&targetUser=${follower.username}"> <img class="ui avatar image" src="${follower.avatar}"></a>
                    <div class="content">${follower.username}</div>
                </div>
            </c:forEach>
        </div>
    </div>
    <div class="ui icon message" id="noFollowerInfo" style="display: none">
        <i class="frown icon"></i>
        <div class="content">
            <div class="header">
                You don't have any followers!
            </div>
            <a href='Article?action=create'><h4>Let's write some articles!</h4></a>
        </div>
    </div>
</div>

</body>
</html>
