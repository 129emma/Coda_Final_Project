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
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
    <title>userProfilePage</title>

    <link rel="stylesheet" href="http://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.10/semantic.css"/>
    <script
            src="https://code.jquery.com/jquery-3.2.1.min.js"
            integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.10/semantic.js" id="semanticJS"></script>
    <script src="${pageContext.request.contextPath}/Pages/BlogPage/Blog.js"></script>
    <script src="${pageContext.request.contextPath}/Pages/NavigationBar/NavigationBar.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Pages/BlogPage/Blog.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Pages/NavigationBar/NavigationBar.css">
    <script>
        var page = '${page}';
    </script>

</head>

<body>

<jsp:include page="${pageContext.request.contextPath}/Pages/NavigationBar/SideBar.jsp">
    <jsp:param name="SideBar" value=""/>
</jsp:include>

<div class="pusher full">
    <jsp:include page="${pageContext.request.contextPath}/Pages/NavigationBar/NavigationBar.jsp">
        <jsp:param name="NavigationBar" value=""/>
    </jsp:include>

    <!-- Page Content !-->

    <div class="ui text container article">
        <div class="ui shape">
            <div class="sides">
                <div class="active side">
                    <div class="ui card">
                        <div class="image">
                            <!--Background Image-->
                            <div class="ui image backGround">
                                <!--fixed size for this background,maximum height is 270px-->
                                <img src="http://themes.mysitemyway.com/echelon/wp-content/uploads/2010/05/colorful.jpg">
                            </div>
                            <!--User Icon-->
                            <div class="ui small image iconImage">
                                <img class="ui small image" src="${userInfo.avatar}">
                            </div>
                        </div>
                        <!--User Name-->
                        <div class="content">
                            <div class="header">${userInfo.username}</div>
                            <div class="description">
                                More coffee please!
                            </div>
                        </div>

                        <div class="ui fitted divider header"></div>

                        <div class="ui labeled icon borderless four item menu">
                            <a href="Blog?page=home" class="item cardChoice">
                                <div class="ui icon" data-tooltip="My Article">
                                    <i class="ion-ios-paper-outline"></i>
                                </div>
                            </a>
                            <a href="Blog?page=spotlight" class="item cardChoice">
                                <div class="ui icon " data-tooltip="Spotlight">
                                    <i class="ion-ios-navigate-outline"></i>
                                </div>

                            </a>

                            <a href="Article?action=create" class="item cardChoice">
                                <div class="ui icon" data-tooltip="Create">
                                    <i class="ion-ios-compose-outline"></i>
                                </div>
                            </a>
                            <a href="#" class="item" id="followInfo">
                                <div class="ui icon" data-tooltip="Follows">
                                    <i class="heart icon"></i>
                                </div>
                            </a>


                        </div>
                        <div class="extra content">
                            <div id="flipright" class="ui icon right floated button">
                                Profile
                                <i class="right long arrow icon"></i>
                            </div>
                        </div>
                    </div>


                </div> <!--End of First Side-->


                <!--Another Side-->

                <div class="side">

                    <div class="ui card">

                        <div class="image">
                            <!--Background Image-->
                            <div class="ui image backGround">
                                <!--fixed size for this background,maximum height is 270px-->
                                <img src="http://themes.mysitemyway.com/echelon/wp-content/uploads/2010/05/colorful.jpg">
                                <!--User Icon-->
                                <img class="ui small image iconImage" src="${userInfo.avatar}">
                            </div>
                        </div>
                        <div class="content">
                            <div class="description">
                                <p>First Name: ${userInfo.firstName}</p>
                                <p>Last Name: ${userInfo.lastName}</p>
                                <p>Gender: ${userInfo.gender}</p>
                                <p>Birthday: ${userInfo.birthDate}</p>
                                <p>Email: ${userInfo.email}</p>
                            </div>
                        </div>
                        <div class="extra content">
                            <a href="Profile" class="ui left floated icon button">
                                <i class="left setting icon"></i> Update
                            </a>

                            <div id="flipleft" class="ui right floated icon button">
                                Back
                                <i class="left long arrow icon"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <div class="ui text justified container">
        <div id="ArticleContainer">

        </div>


        <div class="ui center aligned vertical segment" id="Loader">
            <div class="ui icon message">
                <i class="notched circle loading icon"></i>
                <div class="content">
                    <div class="header">
                        Just one second
                    </div>
                    <p>We're loading the content for you.</p>
                </div>
            </div>

        </div>

        <a href="#topMenu">
            <div class="ui button topButton">
                top
            </div>
        </a>

    </div>

</div>

</body>
</html>