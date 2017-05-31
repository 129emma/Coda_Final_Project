<%--
  Created by IntelliJ IDEA.
  User: txie936
  Date: 30/05/2017
  Time: 2:15 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Add Image</title>
</head>
<body>

<form action="AlbumsChange" method="post" enctype="multipart/form-data">
    <p>click to add image <input type="file" id="imageFile" accept=".jpg, .gif,.png" name="icon"/><br></p>
    <input type="submit" name="submit">
</form>
<c:if test = "${error != null}">
    <p>${error}</p>
</c:if>



</body>
</html>
