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
    <script src="${pageContext.request.contextPath}/Pages/NavigationBar/NavigationBar.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Pages/NavigationBar/NavigationBar.css">
    <script src="${pageContext.request.contextPath}/Pages/UserProfilePage/EditProfile.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Pages/UserProfilePage/EditProfile.css">
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

            <!--id for update profile form should be changed-->
            <div class="ui fitted horizontal divider">Change Details</div>
            <div >
                <img src="${userProfile.avatar}" class="rounded" title="click to change avatar" onclick="showWindow2()"/>
            </div>
            <%--<button class="ui button"  id="userIcon"  onclick="showWindow2()">change</button>--%>

            <form class="ui form" id="profileForm" action="Profile" method="post">
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
                <input  type="hidden" name="profileAction" id="profileAction">
            </form>
            <button class="ui green button" id="updateBtn">Update</button>
            <button class="ui red button"  id="deleteBtn">Delete</button>
            <div class="ui fitted horizontal divider">Change Password</div>



            <form class="ui form" id="passwordForm" action="ChangePassword" method="post">
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
                <button class="ui green submit button" type="submit" id="passwordBtn">Update</button>
            </form>
            <br>

        </div><!--end of edit segment-->
        <br>
        <div class="ui divider">
        </div>
    </div>

    <div class="ui modal" id="iconWindow">
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
                        <button class="ui blue labeled icon small button" id="fileButton">
                            <i class="inverted upload icon"></i>
                           Upload
                        </button>
                        <form action="AvatarEdit" id="avatarForm" method="post" style="margin: 0" enctype="multipart/form-data">
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
            <button id="submitAvatarChange" class="ui positive right icon button">
                <i id="saveIcon" class="list icon"></i>
                Save
            </button>
        </div>
    </div>

<div class="ui small modal" id="deleteWindow">
    <div class="header">Delete your account</div>
    <div class="content">Are you sure you want to delete your account and all files?</div>
    <div class="actions">
        <div class="ui negative button">No</div>
        <button class="ui positive right labled icon button" id="deleteAccountBtn">Yes<i class="checkmark icon"></i> </button>
    </div>
</div>

</div>
</body>
</html>
