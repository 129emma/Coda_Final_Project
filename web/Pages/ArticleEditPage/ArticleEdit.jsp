<%--
  Created by IntelliJ IDEA.
  User: qpen546
  Date: 31/05/2017
  Time: 12:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form id="form" action="Article" method="post">
    <fieldset>
        <legend>Your article</legend>
        <p>title: <input type="text" name="title" placeholder="Please Enter Your Title" value="${articleInfo.title}" style="width: 300px;"/></P>
        <p>content: <textarea  name="content" placeholder="Please Enter Your Content" rows="50" cols="100">${articleInfo.content}</textarea></p>
        <p>tag: <input type="text" name="tag" placeholder="Please Enter Your Tag"  value="${articleInfo.tags}" style="width: 300px;"/></p>
        ${hiddenElement}
        ${submitElement}
        ${deleteElement}
    </fieldset>
</form>
