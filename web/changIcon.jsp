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

</head>
<body>


<form action="/ChangeIcon" method="post" enctype="multipart/form-data">

    <label for="image">Choose one image:</label><input required type="file" id="image" accept=".jpg, .gif,.png" name="icon"/><br><br>
    <br><br>
    <input type="submit" value="icon"/>

</form>
</body>
</html>
