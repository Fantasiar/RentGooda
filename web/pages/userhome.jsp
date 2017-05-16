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
    <!-- favicon
    ============================================ -->

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

    <!-- Modernizr JS -->
    <script src="js/vendor/modernizr-2.8.3.min.js"></script>
    <style type="text/css">
        .container{
            width: 1000px;
            height:700px;
            margin-top: 120px;
            border: none;
        }
        .left{
            width: 180px;
            height: 650px;
            margin: 15px;
            float: left;
            border: none;
        }
        .nav{
            width: 180px;
            background-color: lightgray;
        }
        .navli{
            text-align: center;
            font-size: small;
            font-family: 微软雅黑;
        }
        .right{
            width: 650px;
            height: 650px;
            margin: 15px;
            float: left;
            border: none;
        }
    </style>
</head>
<body>
<div class="container" style="margin-top: 0">
    <div><jsp:include page="nvi.jsp"/></div>
    <div class="g-bd" style="margin-top: 160px">
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
                    <a class="w-menu-item " id="myitems">租借物品</a>
                    <a class="w-menu-item " id="myborrow">我的物品</a>
                </div>
            </div>
            <!-- 显示收藏的商品 -->
            <div class="g-main">
                <div class="m-userInfoTab">
                </div>
                <div class="tabContent active" id="j-userinfoForm">
                    <div class="m-userInfoForm">
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
            $('.right').append(data);
        }).fail(function (data) {
            $(".right").append(data);
        });
    });
    $('#person').click(function () {
        $.get("/UserInfo").done(function (data) {
            $('.m-userInfoForm').empty();
            $('.m-userInfoForm').append(data);
        });
    })
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
</script>
</html>
