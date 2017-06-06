<%--
  Created by IntelliJ IDEA.
  User: qpen546
  Date: 29/05/2017
  Time: 12:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Comment</title>
</head>
<body>
<jsp:include page="/Pages/NavBar/title.jsp"> <jsp:param name="title" value=""/> </jsp:include>
<form action="Comment" method="POST">
    <fieldset>
        <legend>Edit Comment</legend>
        <p><label for="editor">content: </label><textarea id="editor" name="content" rows="10" cols="100"></textarea></p>
        <input type="submit" name="action" value="create"/>
    </fieldset>
</form>
</body>
</html>
