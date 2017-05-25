<%--
  Created by IntelliJ IDEA.
  User: qpen546
  Date: 23/05/2017
  Time: 1:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Content Page</title>
</head>
<body>

<div>
    <p style="color: mediumslateblue">Hello ${sessionScope.username}, This is Blog page!</p>
</div>
<a href="/Update"><p>Change your password</p></a>
<a href="/Login"><p>Login</p></a>
<a href="/Registration"><p>Registration</p></a>
<a href="/Logout"><p>Logout</p></a>
<a href="/CreateArticle.jsp"><p>Create article</p></a>


<p>${title}</p>
<p>${content} </p><a href="ChangeArticle?articleChange='true'&articleID=${id}" >click to change</a>

</body>
</html>
