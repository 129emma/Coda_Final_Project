<%--
  Created by IntelliJ IDEA.
  User: yzhb363
  Date: 1/06/2017
  Time: 1:34 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Welcome Page</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.10/semantic.css" />
    <link rel="stylesheet" type="text/css" href="Welcome.css">
    <script
            src="https://code.jquery.com/jquery-3.2.1.min.js"
            integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.10/semantic.js"></script>


</head>

<body class="full">

<div class="ui middle aligned center aligned grid">
    <div class="column">
        <div class="ui text container">
            <h1 class="ui inverted header">
                Coda Team
            </h1>
            <h2>Do whatever you want when you want to.</h2>

            <div class="twoButtons">
                <div class="huge ui animated  inverted button" tabindex="0">
                    <a class="visible content" href="Login?action=login">Login</a>
                    <div class="hidden content">
                        <i class="right arrow icon"></i>
                    </div>
                </div>
                <div class="huge ui animated  inverted button" tabindex="0">
                    <a class="visible content" href="Login?action=register">Sign Up</a>
                    <div class="hidden content">
                        <i class="right arrow icon"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>



</body>
</html>
