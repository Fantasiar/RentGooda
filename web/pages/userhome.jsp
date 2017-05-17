<%@ page import="RentGoods.User" %><%--
    用户主页
  Created by IntelliJ IDEA.
  User: haoyun
  Date: 2017/4/21
  Time: 21:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%User user = (User) session.getAttribute("User");%>
<html>
<head>
    <title>个人中心</title>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- All css files are included here. -->
    <!-- Bootstrap framework main css -->
    <link rel="stylesheet" href="../pages/css/bootstrap.min.css">
    <!-- This core.css file contents all plugings css file. -->
    <link rel="stylesheet" href="../pages/css/core.css">
    <!-- Theme shortcodes/elements style -->
    <link rel="stylesheet" href="../pages/css/shortcode/shortcodes.css">
    <!-- Theme main style -->
    <link rel="stylesheet" href="../pages/style.css">
    <!-- Responsive css -->
    <link rel="stylesheet" href="../pages/css/responsive.css">
    <!-- User style -->
    <link rel="stylesheet" href="../pages/css/custom.css">
    <link rel="stylesheet" href="/pages/css/style-a8c43f98b3.css">
    <link rel="stylesheet" href="/pages/css/userinfo-13bf163bde.css">

</head>
<body>
<div class="container" >
    <div><jsp:include page="nvi.jsp"/></div>
    <div class="g-bd" style="margin-top: 120px;">
        <div class="g-row" style="margin-left: 60px">
            <div class="g-sub col-md-2 " style="border: dotted 1px grey ">
                <div class="m-userinfo">
                    <!-- 头像-->
                    <div class="w-avatar" id="j-sideAvatarWarp" style="width:100px; height:100px; border-radius:50%; overflow:hidden;">
                        <img src="<%=user.getHead()%>" alt="头像" width="100px" height="100px" id="j-sideAvatar" style="background-color: white;border: none">
                    </div>
                    <!--昵称-->
                    <div class="w-nickname" id="j-sideNickname" style="color: black;font-size: medium"><%=user.getNickName()%></div>
                </div>
                <div style="border: dotted 1px white;margin-top: 5px;margin-bottom: -15px"></div>
                <!--左侧工具栏-->
                <div class="m-menu" >
                    <a class="w-menu-item" id="person" style="color: black;font-size: small;text-decoration: none">个人信息</a>
                    <a class="w-menu-item " id="head" style="color: black;font-size: small;text-decoration: none">修改头像</a>
                    <a class="w-menu-item " id="password" style="color: black;font-size: small;text-decoration: none">帐号安全</a>
                    <a class="w-menu-item " id="myborrow" style="color: black;font-size: small;text-decoration: none">租借物品</a>
                    <a class="w-menu-item " id="myItems" style="color: black;font-size: small;text-decoration: none">我的物品</a>
                </div>
            </div>
            <div class="g-main col-md-9" >
                <div class="tabContent active" id="j-userinfoForm" style="height: auto" >
                    <div class="m-userInfoForm" style="border: none;margin-top: -32px">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%---%>
        <div class="left">
            <ul class="nav">
                <li class="navli" id="person"><a style="color:black">个人资料</a></li>
                <li class="navli" id="head"><a style="color:black">头像设置</a></li>
                <li class="navli" id="password"><a style="color:black">密码设置</a></li>
            </ul>
        </div>
        <div class="right">
        </div>
        <%----%>
    <jsp:include page="chatPart.jsp"/>
</div>


</body>
<!-- jquery latest version -->
<script src="../pages/js/vendor/jquery-1.12.0.min.js"></script>
<!-- Bootstrap framework js -->
<script src="../pages/js/bootstrap.min.js"></script>
<!-- owl.carousel js -->
<script src="../pages/js/owl.carousel.min.js"></script>
<!-- owl.carousel js -->
<script src="../pages/js/jquery-ui.min.js"></script>
<!-- jquery.nivo.slider js -->
<script src="../pages/js/jquery.nivo.slider.pack.js"></script>
<!-- All js plugins included in this file. -->
<script src="../pages/js/plugins.js"></script>
<!-- Main js file that contents all jQuery plugins activation. -->
<script src="../pages/js/main.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $.ajax({
            url:"/UserInfo"
        }).done(function (data) {
            $('.m-userInfoForm').append(data);
        }).fail(function (data) {
            $(".m-userInfoForm").append(data);
        });
    });
    $('#person').click(function () {
        $.get("/UserInfo").done(function (data) {
            $('.m-userInfoForm').empty();
            $('.m-userInfoForm').append(data);
        });
    });
    $('#head').click(function () {
        $.ajax({
            url:"/getUserHead"
        }).done(function (data) {
            $('.m-userInfoForm').empty();
            $('.m-userInfoForm').append(data);
        });
    });
    $('#password').click(function () {
        $.ajax({
            url:"/getPassChange"
        }).done(function (data) {
            $('.m-userInfoForm').empty();
            $('.m-userInfoForm').append(data);
        });
    });
    $('#myItems').click(function () {
        $.get("/MyItems").done(function (data) {
            $('.m-userInfoForm').empty();
            $('.m-userInfoForm').append(data);
        });
    });
    $('#myborrow').click(function () {
        $.get("/Myborrow").done(function (data) {
            $('.m-userInfoForm').empty();
            $('.m-userInfoForm').append(data);
        });
    })
</script>
</html>
