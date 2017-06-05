<%--
  Created by IntelliJ IDEA.
  User: qpen546
  Date: 23/05/2017
  Time: 1:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html lang="en"><!DOCTYPE html>
<head>
    <title>Blog</title>


    <!-- JQuery -->
    <script src="https://code.jquery.com/jquery-3.2.0.js"
            integrity="sha256-wPFJNIFlVY49B+CuAIrDr932XSb6Jk3J1M22M3E2ylQ=" crossorigin="anonymous"></script>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
          crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <!-- Bootstrap JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
            integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
            crossorigin="anonymous"></script>


    <script src="Pages/BlogPage/Blog.js"></script>
    <script>
        var page = '${page}';
    </script>
    <link rel="stylesheet" href="Pages/BlogPage/Blog.css" type="text/css">

</head>

<body>


<jsp:include page="/Pages/NavBar/title.jsp">
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