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

    <link rel="stylesheet" href="../pages/css/bootstrap.min.css">
    <link rel="stylesheet" href="../pages/css/core.css">
    <link rel="stylesheet" href="../pages/css/shortcode/shortcodes.css">
    <link rel="stylesheet" href="../pages/style.css">
    <link rel="stylesheet" href="../pages/css/responsive.css">
    <link rel="stylesheet" href="/pages/css/style-a8c43f98b3.css">
    <link rel="stylesheet" href="/pages/css/userinfo-13bf163bde.css">

    <style type="text/css">
        .container{
            width: 1000px;
            height:700px;
            margin-top: 120px;
            border: none;
        }
    </style>
</head>
<body>
<div class="container" style="margin-top: 0;height: auto;width: auto">
    <div><jsp:include page="nvi.jsp"/></div>
    <div class="breadcrumb-area">
        <div class="container" style="height: auto;width: auto">
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-home"></i></a></li>
                <li class="active">个人中心</li>
            </ol>
        </div>
    </div>
    <div class="g-bd">
        <div class="g-row">
            <div class="g-sub">
                <div class="m-userinfo">
                    <!-- 头像-->
                    <div class="w-avatar" id="j-sideAvatarWarp">
                        <img src="<%=user.getHead()%>" alt="头像" width="100px" height="100px" id="j-sideAvatar">
                    </div>
                    <!--昵称-->
                    <div class="w-nickname" id="j-sideNickname"><%=user.getNickName()%></div>
                </div>
                <!--左侧工具栏-->
                <div class="m-menu">
                    <a class="w-menu-item" id="person">个人信息</a>
                    <a class="w-menu-item " id="head">修改头像</a>
                    <a class="w-menu-item " id="password">帐号安全</a>
                    <a class="w-menu-item " id="myborrow">租借物品</a>
                    <a class="w-menu-item " id="myItems">我的物品</a>
                </div>
            </div>
            <!-- 显示收藏的商品 -->
            <div class="g-main" style="width: 800px;height: auto">
                <div class="m-userInfoTab">
                </div>
                <div class="tabContent active" id="j-userinfoForm">
                    <div class="m-userInfoForm" style="height: auto;width: auto">
                    </div>
                </div>
            </div>
        </div>
    </div>
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
