<%--
  Created by IntelliJ IDEA.
  User: qpen546
  Date: 25/05/2017
  Time: 1:34 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Update Profile</title>
    <style>
        .rounded { border-radius: 50%;
            width: 100px;
            height: 100px;}
    </style>
</head>
<body>
<jsp:include page="/Pages/NavBar/title.jsp"> <jsp:param name="title" value=""/> </jsp:include>
<form id="form" action="ChangeProfile" method="post">
    <fieldset>
        <legend>Your details</legend>
        <img src="${userInfo.icon}" class="rounded" /><a href="AvatarEdit?ChangeIcon=true">click to change your icon</a>
        <p>Firstname: <input type="text" name="firstname" value="${userInfo.firstName}" style="width: 300px;"/></p>
        <p>Lastname: <input type="text" name="lastname" value="${userInfo.lastName}" style="width: 300px;"/></p>
        <p>Email: <input type="email" name="email"  value="${userInfo.email}" style="width: 300px;"/></p>
        <p>Birthday: <input type="date" name="birthday"  value="${userInfo.birthDate}" style="width: 300px;"/></p>

        Gender:<select name="gender">
            <option value="Female">Female</option>
            <option value="Male">Male</option>
        </select>
        <%--<p>Re-enter New Password: <input type="password" name="reNewPassword" placeholder="Please Re-Enter Your New Password" style="width: 300px;"/></p>--%>
        <input type="submit" name="profileAction" value="update"/> <input type="submit" name="profileAction" value="delete"/>
    </fieldset>
</form>

</body>
</html>
