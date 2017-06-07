<%--
  Created by IntelliJ IDEA.
  User: yzhb363
  Date: 5/06/2017
  Time: 3:50 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Account Setting</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.10/semantic.css"/>
    <script
            src="https://code.jquery.com/jquery-3.2.1.min.js"
            integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.10/semantic.js"></script>

    <script src="${pageContext.request.contextPath}/Pages/NavigationBar/NavigationBar.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Pages/NavigationBar/NavigationBar.css">
    <style>
        .rounded:hover{

            cursor:pointer
        }

        .rounded{
            width:100px;
            height:100px;
        }
        .img{
            display: inline-block;
            margin: 5px;

        }
        .options{
            width: 620px;
        }

        .label{
            width: 26px;
            height: 23px;
            cursor: hand;
            margin-top: 10px;
        }

        .ui.medium.image{
            width: 200px;
            height: 200px;
            margin-top: 50px;
        }
        .avatarInfo{
            margin-left: 30px;
            width: 100%;
            height: 100%;
        }
    </style>

</head>
<body>
<jsp:include page="${pageContext.request.contextPath}/Pages/NavigationBar/SideBar.jsp">
    <jsp:param name="SideBar" value=""/>
</jsp:include>
<div class="pusher full">
    <jsp:include page="${pageContext.request.contextPath}/Pages/NavigationBar/NavigationBar.jsp">
        <jsp:param name="NavigationBar" value=""/>
    </jsp:include>
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
                    <label>Password: </label><input type="password" name="password" placeholder="Please Enter Your Password" style="width: 300px;"/>
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
                <img src="${userProfile.avatar}" title="Click to change" id="userIcon" class="rounded" onclick="showWindow2()"/>
                <div class="field">
                    <label>Firstname:</label><input type="text" name="firstname" value="${userProfile.firstName}"
                                                    style="width: 300px;"/></div>
                <div class="field">
                    <label>Lastname:</label> <input type="text" name="lastname" value="${userProfile.lastName}"
                                                    style="width: 300px;"/></div>
                <div class="field">
                    <label>Email: </label><input type="email" name="email" value="${userProfile.email}"
                                                 style="width: 300px;"/></div>
                <div class="field">
                    <label>Birthday:</label> <input type="date" name="birthday" value="${userProfile.birthDate}"
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



//new one
    <div class="ui modal">
        <i class="close icon"></i>
        <div class="header">
            Profile Picture
        </div>
        <div class="image content">
            <div class="ui medium image">
                <img id="icon" src="${userProfile.avatar}">
            </div>
            <div class="avatarInfo">
                <div class="ui header">Icon gallery</div>
                <div class="options">
                <c:forEach var="localIcon" items="${iconList}">
                <div class="img">
                <img src="${localIcon}" class="rounded" id="${localIcon}" />
                </div>
                </c:forEach>
                <br><br>
                </div>
                <div class="ui header" >Choose from local:</div>

    <div class="myForm" >
    <form action="AvatarEdit" id="avatarForm" method="post" style="margin: 0" enctype="multipart/form-data">
        <div>
            <input type="hidden" name="result" id="result">
            <a title="Choose local file"><label for="imageFile" class="myLabel">
                <img class="label" src="https://cdn2.iconfinder.com/data/icons/perfect-flat-icons-2/512/Documents_files_pictogram_symbol_icon_folder.png" >
            </label>
                <input style="display: none" type="file" id="imageFile" accept=".jpg, .gif,.png" name="icon"/></a>
        </div>
       </form>
      </div>
              </div>
        </div>
        <div class="actions">
            <div class="ui red deny button">
                Cancel
            </div>
            <div id="submitAvatarChange" class="ui positive right icon button">
                Confirm
                <i class="checkmark icon"></i>
            </div>
        </div>
    </div>

//old one
    <%--<div class="ui basic modal">--%>
        <%--<div class="myHeader">--%>
            <%--Your avatar--%>
        <%--</div>--%>
        <%--<div class="content">--%>
            <%--<div  class="center" >--%>
                <%--<img src="${userProfile.avatar}" id="icon" name="userIcon" class="rounded" />--%>
            <%--</div>--%>
            <%--<div class="center">--%>
                <%--<p>Default options</p>--%>
            <%--</div>--%>

            <%--<div class="options">--%>
                    <%--<c:forEach var="localIcon" items="${iconList}">--%>
                        <%--<div class="img">--%>
                            <%--<img src="${localIcon}" class="rounded" id="${localIcon}" />--%>
                        <%--</div>--%>
                    <%--</c:forEach>--%>
                    <%--<br><br>--%>
            <%--</div>--%>

            <%--<form action="AvatarEdit" id="avatarForm" method="post" enctype="multipart/form-data">--%>
                <%--<div style="margin: auto;width: 100px">--%>
                    <%--<input type="hidden" name="result" id="result">--%>
                    <%--<a title="Choose local file"><label for="imageFile" class="myLabel">--%>
                        <%--<img class="label" src="https://cdn2.iconfinder.com/data/icons/perfect-flat-icons-2/512/Documents_files_pictogram_symbol_icon_folder.png" >--%>
                    <%--</label>--%>
                        <%--<input style="display: none" type="file" id="imageFile" accept=".jpg, .gif,.png" name="icon"/></a>--%>
                <%--</div>--%>

            <%--</form>--%>
        <%--</div>--%>
        <%--<div class="actions">--%>
            <%--<div class="ui red basic cancel inverted button"><i class="remove icon"></i>Cancel</div>--%>
            <%--<div class="ui green ok inverted button" id="submitAvatarChange"><i class="checkmark icon"></i>Confirm</div>--%>
        <%--</div>--%>
    <%--</div>--%>
</div>
<script>

function showWindow() {
    $('.ui.basic.modal')
        .modal('show')
    ;
}
function showWindow2() {
    $('.ui.modal')
        .modal('show')
    ;
}
$("#submitAvatarChange").click(function () {
    $("#avatarForm").submit();
});
    $( ".rounded" ).each(function() {
        $(this).click( function(){
            $("#icon").attr('src',$(this).attr('src'));
            $('input[type=hidden]').val($(this).attr('src'));
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

    $('input[type=file]').change(function () {
        readURL(this);
        $('input[type=hidden]').val("");
    })

</script>

</body>
</html>
