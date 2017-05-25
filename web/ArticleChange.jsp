<%--
  Created by IntelliJ IDEA.
  User: txie936
  Date: 25/05/2017
  Time: 3:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form id="form" action="ChangeArticle">
    <fieldset>
        <legend>Your article</legend>
        <p>title: <input type="text" name="title" placeholder="Please Enter Your Username" style="width: 300px;"/></P>
        <p>content: <input type="text" name="content" placeholder="Please Enter Your Password" style="width: 300px;"/></p>
        <p>tag: <input type="text" name="tag" placeholder="Please Enter Your Password" style="width: 300px;"/></p>
        <input type="hidden" name="update" value="true">
        <%--<p>Re-enter New Password: <input type="password" name="reNewPassword" placeholder="Please Re-Enter Your New Password" style="width: 300px;"/></p>--%>
        <input type="submit" name="action" value="update"/> <input type="submit" name="action" value="delete"/>
    </fieldset>
</form>
</body>
</html>
