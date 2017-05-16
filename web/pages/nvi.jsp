<%@ page import="RentGoods.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%User user = (User) session.getAttribute("User");%>
<!-- All css files are included here. -->
<!-- Bootstrap framework main css -->
<%--<link rel="stylesheet" href="../pages/css/bootstrap.min.css">--%>
<!-- This core.css file contents all plugings css file. -->
<%--<link rel="stylesheet" href="../pages/css/core.css">--%>
<!-- Theme shortcodes/elements style -->
<%--<link rel="stylesheet" href="../pages/css/shortcode/shortcodes.css">--%>
<!-- Responsive css -->
<%--<link rel="stylesheet" href="../pages/css/responsive.css">--%>

<header class="header-pos blg">
    <div class="header-area header-middle">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-2 col-sm-3 col-xs-12">
                    <div class="logo">
                        <a href="/index.jsp"><img src="../pages/img/logo/logo.jpg" alt=""/></a>
                    </div>
                </div>
                <div class="col-md-10 col-sm-9 col-xs-12 text-right xs-center">
                    <div class="main-menu display-inline hidden-sm hidden-xs">
                        <nav>
                            <ul>
                                <li><a href="/index.jsp">主页</a></li>
                                <li><a href="shop.html">分类</a></li>
                                <%
                                    if (user == null){
                                        out.println("<li><a href='/signin'>登录</a></li>");
                                        out.println("<li><a href='/signin'>注册</a></li>");
                                    }else {
                                        out.println("<li><a href='/publish'>发布出租</a></li>");
                                        out.println("<li><a href='/UserManage'>个人中心</a></li>");
                                    }
                                %>
                            </ul>
                        </nav>
                    </div>
                    <div class="search-block-top display-inline">
                        <div class="icon-search"></div>
                        <div class="toogle-content">
                            <form action="/Search" id="searchbox">
                                <input type="text" placeholder="输入关键字" name="query"/>

                                <button class="button-search"></button>
                            </form>
                        </div>
                    </div>
                    <div class="setting-menu display-inline">
                        <div class="icon-nav current"></div>
                        <ul class="content-nav toogle-content">
                            <li class="currencies-block-top">
                                <div class="current"><b>我的账户</b></div>
                                <ul>
                                    <li><a href="/PersonalManage">个人中心</a></li>
                                    <li><a href="/logout">注销</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="mobile-menu-area visible-sm visible-xs">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="mobile-menu">
                        <nav id="mobile-menu-active">
                            <ul>
                                <li><a href="index.html">主页</a></li>
                                <li><a href="shop.html">分类</a></li>
                                <li><a href="#">发布出租</a></li>
                                <li><a href="#">个人中心</a></li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>
<div class="space-custom"></div>

<!-- jquery latest version -->
<%--<script src="../pages/js/vendor/jquery-1.12.0.min.js"></script>--%>
<!-- All js plugins included in this file. -->
<%--<script src="../pages/js/plugins.js"></script>--%>
<!-- Main js file that contents all jQuery plugins activation. -->
<%--<script src="../pages/js/main.js"></script>--%>
