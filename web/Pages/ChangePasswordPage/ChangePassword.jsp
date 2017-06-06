<%--
  Created by IntelliJ IDEA.
  User: pqsky
  Date: 2017/5/23
  Time: 23:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Update Page</title>
</head>
<body>
<jsp:include page="/Pages/NavBar/title.jsp"> <jsp:param name="title" value=""/> </jsp:include>
<form id="form" action="ChangePassword" method="post">
    <fieldset>
        <legend>Your details</legend>
        <p>Username: <input type="text" name="username" placeholder="Please Enter Your Username" style="width: 300px;"/></P>
        <p>Password: <input type="password" name="password" placeholder="Please Enter Your Password" style="width: 300px;"/></p>
        <p>New Password: <input type="password" name="newPassword" placeholder="Please Enter Your New Password" style="width: 300px;"/></p>
        <%--<p>Re-enter New Password: <input type="password" name="reNewPassword" placeholder="Please Re-Enter Your New Password" style="width: 300px;"/></p>--%>
        <input type="submit" value="Update"/>
    </fieldset>
</form>
<div>
    <p style="color: red">${sessionScope.updateMessage}</p>
</div>
<a href="/Login"><p>Login</p></a>
<a href="/Registration"><p>Registration</p></a>
<a href="/Logout"><p>Logout</p></a>
</body>
</html>
