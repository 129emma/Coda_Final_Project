<%--
  Created by IntelliJ IDEA.
  User: qpen546
  Date: 5/06/2017
  Time: 1:34 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
    <title>Welcome</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.10/semantic.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fullPage.js/2.9.4/jquery.fullpage.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/Pages/WelcomePage/Welcome.css">
    <script src="https://code.jquery.com/jquery-3.2.1.min.js" type="text/javascript"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.10/semantic.js" type="text/javascript"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/fullPage.js/2.9.4/jquery.fullpage.js"></script>


</head>
<body>
<div id="fullpage">
    <div class="section active" id="section0">
        <div class="ui middle aligned center aligned grid">
            <div class="column">
                <div class="ui text container">
                    <h1 class="ui inverted header">
                        Coda Team
                    </h1>
                    <h2>Do whatever you want when you want to.</h2>

                    <div class="twoButtons">
                        <div id="loginBtn" class="huge ui animated  inverted button" tabindex="0">
                            <a class="visible content">Login</a>
                            <div class="hidden content">
                                <i class="right arrow icon"></i>
                            </div>
                        </div>
                        <div id="registerBtn" class="huge ui animated  inverted button" tabindex="0">
                            <a class="visible content">Sign Up</a>
                            <div class="hidden content">
                                <i class="right arrow icon"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="ui small modal" id="login"></div>
    </div>
    <div class="section" id="section1">
        <div class="ui middle aligned center aligned grid">
            <h1>Our team</h1>
            <div class="ui small sequenced images">
                <img src="https://semantic-ui.com/images/avatar2/large/elyse.png" class="ui circular image">
                <img src="https://semantic-ui.com/images/avatar2/large/matthew.png" class="ui circular image">
                <img src="https://semantic-ui.com/images/avatar2/large/kristy.png" class="ui circular image">
                <img src="https://semantic-ui.com/images/avatar/large/jenny.jpg" class="ui circular image">
            </div>
        </div>
    </div>
    <div class="section" id="section2">
        <div class="ui middle aligned center aligned grid">
            <h1>Seriously, put anything you want here.</h1>
        </div>
        <div class="ui middle aligned center aligned grid">
            <div class="ui small sequenced icons">
                <i class="grey massive talk outline icon"></i>
                <i class="orange massive image icon"></i>
                <i class="yellow massive music icon"></i>
                <i class="green massive record icon"></i>
            </div>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/Pages/WelcomePage/Welcome.js"></script>
</body>
</html>
