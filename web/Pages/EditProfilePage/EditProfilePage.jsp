<%--
  Created by IntelliJ IDEA.
  User: yzhb363
  Date: 5/06/2017
  Time: 3:50 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Account Setting</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.10/semantic.css"/>
    <link rel="stylesheet" href="../../demo/navigationBar/NavigationBar.css">
    <link rel="stylesheet" href="../../demo/EditDetails/EditDetails.css">

    <script
            src="https://code.jquery.com/jquery-3.2.1.min.js"
            integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.10/semantic.js"></script>
    <script src="../../demo/navigationBar/NavigationBar.js"></script>


</head>
<body class="full">

<!--SideBar Menu-->
<div class="ui sidebar vertical menu">
    <img class="sideBarIcon" src="../../testImage/icon_white.png">
    <a class="item">
        option1
    </a>
    <a class="item">
        option2
    </a>
    <a class="item">
        option3
    </a>
</div>

<!-- Page Content !-->
<div class="pusher">


    <%--Menu--%>
    <div class="ui masthead borderless menu">
        <div class="ui container">
            <a class="toc item">
                <i class="sidebar icon"></i>
            </a>
            <div class="ui search">
                <div class="ui icon input">
                    <input class="prompt" type="text" placeholder="Searching friends">
                    <i class="search icon"></i>
                </div>
                <div class="results"></div>
            </div>
            <a class="item iconClass"><i class="large umbrella icon"></i></a>
            <a class="item iconClass"><i class="large world icon"></i></a>
            <a class="item iconClass"><i class="large cocktail icon"></i></a>
            <img class="teamIcon" src="../../testImage/icon_black.png">
        </div>
    </div>

    <%--Edit Profile--%>
    <div class="ui text container">
        <div class="ui raised segment">
            <div class="ui dividing header">
                <h2>Account Editing</h2>
            </div>

            <div class="ui dividing header">
                <h3>Change Password</h3>
            </div>
            <form class="ui form" id="form" action="ChangePassword" method="post">
                <div class="field">
                    <label>Password: </label><input type="password" name="password"
                                                    placeholder="Please Enter Your Password" style="width: 300px;"/>
                </div>
                <div class="field">
                    <label>New Password:</label> <input type="password" name="newPassword"
                                                        placeholder="Please Enter Your New Password"
                                                        style="width: 300px;"/></div>
                <div class="field">
                    <label>Re-enter New Password:</label> <input type="password" name="reNewPassword"
                                                                 placeholder="Please Re-Enter Your New Password"
                                                                 style="width: 300px;"/>
                </div>
                <input class="ui submit button" type="submit" value="Update"/>
            </form>
            <br>

            <div class="ui dividing header">
                <h3>Change Details</h3>
            </div>

            <!--id for update profile form should be changed-->
            <form class="ui form" id="#" action="ChangeProfile" method="post">

                <img src="${userInfo.icon}" class="rounded"/><a href="AvatarEdit?ChangeIcon=true">click to change your
                icon</a>
                <div class="field">
                    <label>Firstname:</label><input type="text" name="firstname" value="${userInfo.firstName}"
                                                    style="width: 300px;"/></div>
                <div class="field">
                    <label>Lastname:</label> <input type="text" name="lastname" value="${userInfo.lastName}"
                                                    style="width: 300px;"/></div>
                <div class="field">
                    <label>Email: </label><input type="email" name="email" value="${userInfo.email}"
                                                 style="width: 300px;"/></div>
                <div class="field">
                    <label>Birthday:</label> <input type="date" name="birthday" value="${userInfo.birthDate}"
                                                    style="width: 300px;"/></div>
                <div class="field">
                    <label>Gender:</label><select name="gender" style="width: 300px">
                    <option value="Female">Female</option>
                    <option value="Male">Male</option>
                </select>
                </div>
                <input class="ui submit button" type="submit" name="profileAction" value="update"/>
                <input class="ui submit button" type="submit" name="profileAction"
                       value="delete"/>
            </form>
        </div><!--end of edit segment-->

        <br>
        <div class="ui divider">
        </div>


    </div>

</div>


</body>
</html>
