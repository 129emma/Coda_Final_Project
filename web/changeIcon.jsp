<%--
  Created by IntelliJ IDEA.
  User: txie936
  Date: 29/05/2017
  Time: 12:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>changeIcon</title>
    <style>
        .rounded { border-radius: 50%;
            width: 100px;
            height: 100px;}
    </style>

</head>
<body>

<img src="${userInfo.icon}" class="rounded" />
<form action="ChangeIcon" method="post" enctype="multipart/form-data">
    <label for="image">Choose one image:</label><input required type="file" id="image" accept=".jpg, .gif,.png" name="icon"/><br><br>
    <c:forEach var="localIcon" items="${iconList}">
        <div class="panel panel-default">
            <img src="${localIcon}" class="rounded" />
        </div>
    </c:forEach>
    <br><br>
    <input type="submit" value="Submit"/>
</form>
</body>
</html>
