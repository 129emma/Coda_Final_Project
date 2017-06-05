<%--
  Created by IntelliJ IDEA.
  User: qpen546
  Date: 23/05/2017
  Time: 1:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
<head>
    <title>Blog</title>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <!-- JQuery -->
    <script src="https://code.jquery.com/jquery-3.2.0.js"
            integrity="sha256-wPFJNIFlVY49B+CuAIrDr932XSb6Jk3J1M22M3E2ylQ=" crossorigin="anonymous"></script>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
          crossorigin="anonymous">

    <!-- Bootstrap JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
            integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
            crossorigin="anonymous"></script>
</head>

<body>

<jsp:include page="/Pages/NavBar/title.jsp"> <jsp:param name="title" value=""/> </jsp:include>

<div class="container" id="containerProfile">

    <div class="col-xs-12 col-md-3 panel panel-default">
        <img class="img-circle img-responsive" src='${UserInfo.icon}' alt="avatar" id="image">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">Profile</h3>
            </div>
            <div class="panel-body" id="profile_content">
                <p><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> ${UserInfo.username}</p>
                <p><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> Location</p>
            </div>
        </div>
    </div>

    <div class="col-xs-12 col-md-9 panel panel-default" id="containerContent">
        <div style="margin-bottom: 20px"></div>
        <c:forEach var="article" items="${articleInfoList}">
            <div class="panel panel-default">
                <div class="panel-heading"><a href="${article.retrieveAddress}">${article.title}</a>${article.postTime}</div>
                <div class="panel-body">${article.content} </p></div>
                    <%--<c:forEach var="commentInfo" items="${commentInfoListOFAllArticle.get(article.articleID)}">--%>
                    <%--<div class="panel panel-default">--%>
                    <%--<div class="panel-heading"><a href="Article?articleID=${article.articleID}" >${commentInfo.username} </a>${commentInfo.postTime}</div>--%>
                    <%--<div class="panel-body">${commentInfo.content}</div>--%>
                    <%--</div>--%>
                    <%--</c:forEach>--%>
            </div>
        </c:forEach>
    </div>
</div>

<script>

</script>
</body>
</html>