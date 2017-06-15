<%--
  Created by IntelliJ IDEA.
  User: yzhb363
  Date: 5/06/2017
  Time: 3:50 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
    <title>Account Setting</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.10/semantic.css"/>
    <script
            src="https://code.jquery.com/jquery-3.2.1.min.js"
            integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.10/semantic.js"></script>
    <%--<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>--%>
    <script src="${pageContext.request.contextPath}/Pages/NavigationBar/NavigationBar.js"></script>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/Pages/NavigationBar/NavigationBar.css">
    <style>
        .rounded:hover {
            cursor: pointer
        }

        .rounded {
            width: 100px;
            height: 100px;
        }

        .img {
            display: inline-block;
            margin: 5px;

        }

        .center, .header, .avatar {
            text-align: center;
        }

        .avatarInfo {
            width: 100%;
            height: 100%;
        }

        .avatar {
            width: 200px;
            height: 200px;
            margin: auto;
        }

        .ui.header {
            margin: 0;
        !important;
        }

        #avatarForm {
            display: inline-block;
        !important;
        }

    </style>
    <script>
        var username = '${userProfile.username}';
        var googleUser = '${googleUser}';
    </script>
    <script src="${pageContext.request.contextPath}/Pages/UserProfilePage/PQ.js"></script>
    <script>
        $(document).ready(function () {
            $.ajax({
                url: "/User-Info/gin/avatar.jpg",
                success: function (data) {
                }
            });
        });

    </script>
</head>
<body>

<div class="pusher">
    <jsp:include page="${pageContext.request.contextPath}/Pages/NavigationBar/NavigationBar.jsp">
        <jsp:param name="NavigationBar" value=""/>
    </jsp:include>
    <%--Edit Profile--%>
    <div class="ui text container">
        <div class="ui raised segment">

            <!--id for update profile form should be changed-->
            <div class="ui fitted horizontal divider">Change Details</div>
            <div>
                <img src="${userProfile.avatar}" class="rounded" title="click to change avatar"
                     onclick="showWindow2()"/>
            </div>
            <%--<button class="ui button"  id="userIcon"  onclick="showWindow2()">change</button>--%>

            <form class="ui form" id="#" action="Profile" method="post">
                <div class="field">
                    <label>Username:</label><input id="newUsername" type="text" name="username"
                                                   value="${userProfile.username}" style="max-width: 300px"/></div>
                <div id="usernameMessageContainer"
                     style="margin-top: 0 !important; max-width: 300px; padding: 10px 15px !important;"
                     class="ui message hidden">
                    <p id="usernameMessage"></p>
                </div>
                <div class="field">
                    <label>Firstname:</label><input type="text" name="firstName" value="${userProfile.firstName}"
                                                    style="max-width: 300px"/>
                </div>
                <div class="field">
                    <label>Lastname:</label> <input type="text" name="lastName" value="${userProfile.lastName}"
                                                    style="max-width: 300px"/></div>
                <div class="field">
                    <label>Email: </label><input type="email" name="email" value="${userProfile.email}"
                                                 style="max-width: 300px"/></div>
                <div class="field">
                    <label>Birthday:</label> <input type="date" name="birthday" value="${userProfile.birthDate}"
                                                    style="max-width: 300px"/></div>
                <div class="field">
                    <label>Gender:</label><select name="gender" style="max-width: 300px">
                    <option value="Female">Female</option>
                    <option value="Male">Male</option>
                </select>
                </div>
                <input id="updateBtn" class="ui submit button" type="submit" name="profileAction" value="Update"/>
                <input class="ui submit button" type="submit" name="profileAction"
                       value="Delete"/>
            </form>
            <br/>
            <div id="passwordDivider" class="ui fitted horizontal divider" style="display: none;">Change Password</div>
            <form class="ui form" id="passwordForm" action="ChangePassword" method="post" style="display: none;">
                <div class="field">
                    <label>Password: </label><input id="password" type="password" name="password"
                                                    placeholder="Please Enter Your Password" style="width: 300px;"/>
                </div>
                <div class="field">
                    <label>New Password:</label> <input id="newPassword" type="password" name="newPassword"
                                                        placeholder="Please Enter Your New Password"
                                                        style="width: 300px;"/></div>
                <div class="field">
                    <label>Re-enter New Password:</label> <input id="reNewPassword" type="password" name="reNewPassword"
                                                                 placeholder="Please Re-Enter Your New Password"
                                                                 style="width: 300px;"/>
                </div>
                <div id="passwordMessageContainer"
                     style="margin-top: 0 !important; max-width: 300px; padding: 10px 15px !important;"
                     class="ui message hidden">
                    <p id="passwordMessage"></p>
                </div>
                <button id="passwordBtn" class="ui submit button" type="button" value="Update">Update</button>
            </form>
        </div>
        <br>
    </div>
</div>

<div class="ui modal">
    <i class="close icon"></i>
    <div class="header">
        Avatar
    </div>
    <div class="image content">

        <div class="avatarInfo">
            <div>
                <div class="center">
                    <img class="avatar" id="icon" src="${userProfile.avatar}">
                </div>

                <br>
                <div class="center">
                    <div class="ui fitted horizontal divider">Options</div>
                    <c:forEach var="localIcon" items="${iconList}">
                        <div class="img">
                            <img src="${localIcon}" class="rounded" id="${localIcon}"/>
                        </div>
                    </c:forEach>
                    <br>
                    <p></p>
                    <%--<div class="ui button" >--%>
                    <%--<i class="folder open icon"></i>Choose file--%>
                    <%--</div>--%>
                    <button class="ui blue labeled icon small button" id="fileButton">
                        <i class="inverted upload icon"></i>
                        Upload
                    </button>
                    <form action="AvatarEdit" id="avatarForm" method="post" style="margin: 0"
                          enctype="multipart/form-data">
                        <input type="hidden" name="result" id="result" value="${userProfile.avatar}">
                        <input style="display: none" type="file" id="imageFile" accept=".jpg, .gif,.png"
                               name="icon"/>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <div class="actions">
        <div class="ui deny button">
            Cancel
        </div>
        <div id="submitAvatarChange" class="ui positive right icon button">
            <i class="list icon"></i>
            Save
        </div>
    </div>
</div>

</div>
<script>

    $('#fileButton').click(function () {
        $('#imageFile').click();
    });
    function showWindow2() {
        $('.ui.modal')
            .modal('show')
        ;
    }

    $("#submitAvatarChange").click(function () {
        $("#avatarForm").submit();

    });

    $(".rounded").each(function () {
        $(this).click(function () {
            var src = $(this).attr('src');
            $("#icon").attr('src', src);
            $('input[type=hidden]').val(src);
        });
    });


    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $('#icon').attr('src', e.target.result);
            };
            reader.readAsDataURL(input.files[0]);
        }
    }


    $('#imageFile').change(function () {
        readURL(this);
    })

</script>

</body>
</html>
