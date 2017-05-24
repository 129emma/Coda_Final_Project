<%--
  Created by IntelliJ IDEA.
  User: qpen546
  Date: 23/05/2017
  Time: 1:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Content Page</title>
</head>
<body>

<div>
    <p style="color: mediumslateblue">Hello ${sessionScope.username}, This is content page!</p>
</div>
<a href="/Update"><p>Change your password</p></a>
<a href="/Login"><p>Login</p></a>
<a href="/Registration"><p>Registration</p></a>
<a href="/Logout"><p>Logout</p></a>
</body>
</html>
