<%--
  Created by IntelliJ IDEA.
  User: qpen546
  Date: 23/05/2017
  Time: 1:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Blog</title>


    <!-- JQuery -->
    <script src="https://code.jquery.com/jquery-3.2.0.js"
            integrity="sha256-wPFJNIFlVY49B+CuAIrDr932XSb6Jk3J1M22M3E2ylQ=" crossorigin="anonymous"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.10/semantic.js"></script>
    <script src="${pageContext.request.contextPath}/Pages/BlogPage/Blog.js"></script>
    <script>
        var page = '${page}';
    </script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Pages/BlogPage/Blog.css" type="text/css">

</head>

<body>


<jsp:include page="${pageContext.request.contextPath}/Pages/NavigationBar/NavigationBar.jsp">
    <jsp:param name="title" value=""/>
</jsp:include>

<div class="container" id="container">
    <div class="col-xs-12 col-md-9 panel panel-default" >
        <div id="ContentContainer"></div>
        <i class="fa fa-circle-o-notch fa-spin" style="margin: auto; font-size:24px" id="Loader"></i>
    </div>
</div>

</body>
</html>