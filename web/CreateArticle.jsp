<%--
  Created by IntelliJ IDEA.
  User: txie936
  Date: 25/05/2017
  Time: 4:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form id="form" action="ChangeArticle">
    <fieldset>
        <legend>Your article</legend>
        <p>title: <input type="text" name="title" placeholder="Please Enter Your Title" style="width: 300px;"/></P>
        <p>content: <input type="text" name="content" placeholder="Please Enter Your Content" style="width: 300px;"/></p>
        <p>tag: <input type="text" name="tag" placeholder="Please Enter Your Tag" style="width: 300px;"/></p>
        <%--<p>Re-enter New Password: <input type="password" name="reNewPassword" placeholder="Please Re-Enter Your New Password" style="width: 300px;"/></p>--%>
        <input type="submit" name="create" value="Submit"/>
    </fieldset>
</form>
</body>
</html>
