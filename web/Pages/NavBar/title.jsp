<%--
  Created by IntelliJ IDEA.
  User: txie936
  Date: 1/06/2017
  Time: 3:01 PM
  To change this template use File | Settings | File Templates.
--%>


<%--
<nav class="navbar navbar-top navbar-inverse">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"
                    aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand">Code Blog</a>
        </div>

        <div id="navbar" class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li><a href="Blog?page=home">Home</a></li>
                <li><a href="Blog?page=spotlight">Spotlight</a></li>
                <li><a href="Profile">Profile</a></li>
                <li><a href="Article?action=create"><p>Create article</p></a></li>
                <li><a href="Albums">Albums</a>></li>
                <li><a href="Login?action=logout">Logout</a></li>

            </ul>
        </div>
    </div>
</nav>--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Navigation</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.10/semantic.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.10/components/container.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.10/components/grid.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.10/components/icon.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.10/components/image.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.10/components/search.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.10/components/header.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.10/components/segment.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.10/components/sticky.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.10/components/transition.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.10/components/divider.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.10/components/reset.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.10/components/site.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.10/components/menu.css"/>

    <link rel="stylesheet" href="../../demo/navigationBar/NavigationBar.css">


    <script
            src="https://code.jquery.com/jquery-3.2.1.min.js"
            integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.10/semantic.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.10/components/visibility.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.10/components/sidebar.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.10/components/search.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.10/components/sticky.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.10/components/transition.js"></script>
    <script src="../../demo/navigationBar/NavagationBar.js"></script>
</head>

<body class="full">

<div class="ui sidebar inverted vertical menu">
    <img class="sideBarIcon" src="../../testImage/icon_white.png">
    <a class="item" href="Blog?page=home">
        Home
    </a>
    <a class="item" href="Blog?page=spotlight">
        Spotlight
    </a>
    <a class="item"  href="Login?action=logout">
       Logou
    </a>
</div>

<!-- Page Content !-->
<div class="pusher">
    <div class="ui inverted vertical masthead center aligned segment">
        <div class="ui container">
            <div class="ui large secondary inverted borderless pointing menu">
                <a class="toc item">
                    <i class="sidebar icon"></i>
                </a>
                <a class="active item" href="Blog?page=home"><i class=" big user icon"></i></a>
                <a class="item" href="Article?action=create"><i class="big umbrella icon"></i></a>
                <a class="item" href="Login?action=logout"><i class="big world icon"></i></a>
                <a class="item"><i class="big cocktail icon"></i></a>
                <img class="teamIcon" src="../../testImage/icon_white.png">
                <!--  <div class="right item">

                      &lt;!&ndash;<a class="ui inverted button">Log in</a>
                      <a class="ui inverted button">Sign Up</a>&ndash;&gt;
                  </div>-->
            </div>
        </div>
    </div>
</div>

