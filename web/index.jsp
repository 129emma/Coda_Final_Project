<%--
  Created by IntelliJ IDEA.
  User: qpen546
  Date: 25/05/2017
  Time: 9:21 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html class="full" lang="en">

<!-- Make sure the <html> tag is set to the .full CSS class. Change the background image in the full.css file. -->
<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Coda's blog</title>

  <!-- Bootstrap Core CSS -->
  <link href="css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom CSS -->
  <link href="css/basicSetting.css" rel="stylesheet">


  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
  <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
  <![endif]-->


</head>

<body>

<!-- Navigation -->
<nav class="navbar navbar-default navbar-dark bg-primary fixed-top" role="navigation">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand">Main Menu</a>
    </div>
    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li>
          <a href="#">About Coda</a>
        </li>
        <li>
          <a href="#">Team Story</a>
        </li>
        <li>
          <a href="#">Contact Us</a>
        </li>
      </ul>
      <!--  <form class="form-inline waves-effect waves-light col-xs-6 col-md-4 col-lg-1 ">
            <input class="form-control" type="text" placeholder="Search">
        </form>-->
    </div>



    <!-- /.navbar-collapse -->
  </div>
  <!-- /.container -->
</nav>

<!-- Page Content -->
<div class="container-fluid login">
  <div class="row">
    <div class="col-xs-4 col-md-4 col-lg-offset-4 login">
      <h1>Coda's Blog</h1>
      <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Magni, iusto, unde, sunt incidunt id sapiente rerum soluta voluptate harum veniam fuga odit ea pariatur vel eaque sint sequi tenetur eligendi.</p>

      <ul id="btn">
        <a  target="_blank" href="Registration" class="btn btn-md ">Sign up!</a>
        <a  target="_blank" href="Login" class="btn btn-md ">Login</a>
      </ul>

    </div>
  </div>
  <!-- /.row -->
</div>
<!-- /.container -->

<!-- jQuery -->
<script src="js/jquery.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="js/bootstrap.min.js"></script>

<!-- some scripts-->
<script src="js/basicAnimation.js"></script>

</body>

</html>
