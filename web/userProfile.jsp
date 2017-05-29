<%--
  Created by IntelliJ IDEA.
  User: txie936
  Date: 29/05/2017
  Time: 12:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>UserProfile</title>
    <style>
       .rounded { border-radius: 50%;
       width: 100px;
       height: 100px;}
    </style>

</head>
<body>
<img src="${userProfile.icon}" class="rounded" />
<p>Username:${userProfile.username}</p>
<p>Firstname:${userProfile.firstName}</p>
<p>Lastname:${userProfile.lastName}</p>
<p>Email:${userProfile.email}</p>
<p>Birthday:${userProfile.date_birth}</p>
<p>Gender:${userProfile.gender}</p>
<a href="ChangeProfile"><p>Change your profile</p></a>
<a href="Blog"><p>Blog page</p></a>
</body>
</html>
