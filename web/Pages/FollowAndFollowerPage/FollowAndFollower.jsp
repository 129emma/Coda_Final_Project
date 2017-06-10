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

<div class="ui segment">

<c:forEach var="follow" items="${followsList}">
    <div class="ui cards">
        <div class="card">
            <div class="content">
                <img class="right floated mini ui image" src="${follow.avatar}">
                <div class="header">
                        ${follow.username}
                </div>
                <div class="meta">
                        ${follow.bithDate}
                </div>
                <div class="description">
                   ${follow.avatar}
                </div>
            </div>
            <div class="extra content">
                <div class="ui two buttons">
                    <div class="ui basic red button">Unfollow</div>
                </div>
            </div>
        </div>
    </div>
        </c:forEach>

</div>

<%--<div class="ui left floated segment">--%>
    <%--This segment will appear to the left--%>
<%--</div>--%>

</body>
</html>
