<%--
  Created by IntelliJ IDEA.
  User: txie936
  Date: 29/05/2017
  Time: 12:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>UserProfile</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.10/components/modal.min.css"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.10/components/modal.min.js"></script>
    <script src="${pageContext.request.contextPath}/Pages/NavigationBar/NavigationBar.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Pages/NavigationBar/NavigationBar.css">
    <style>
        .rounded {
            border-radius: 50%;
            width: 100px;
            height: 100px;
        }
    </style>
    <script>
        $('#changeProfile').click(function () {
            $('.ui.modal')
                .modal()
            ;
        });
    </script>

</head>
<body>
<jsp:include page="${pageContext.request.contextPath}/Pages/NavigationBar/SideBar.jsp">
    <jsp:param name="SideBar" value=""/>
</jsp:include>

<div class="pusher full">
    <jsp:include page="${pageContext.request.contextPath}/Pages/NavigationBar/NavigationBar.jsp">
        <jsp:param name="NavigationBar" value=""/>
    </jsp:include>

    <img src="${userProfile.avatar}" class="rounded"/>
    <p>Username:${userProfile.username}</p>
    <p>Firstname:${userProfile.firstName}</p>
    <p>Lastname:${userProfile.lastName}</p>
    <p>Email:${userProfile.email}</p>
    <p>Birthday:${userProfile.birthDate}</p>
    <p>Gender:${userProfile.gender}</p>
    <div class="ui modal">
        <jsp:include page="/Pages/LoginPage/Login.jsp">
            <jsp:param name="title" value=""/>
        </jsp:include>
    </div>
    <button id="changeProfile"></button>
    <a href="ChangeProfile"><p>Change your profile</p></a>
    <li><a href="ChangePassword">Change your password</a></li>
</div>
</body>
</html>
