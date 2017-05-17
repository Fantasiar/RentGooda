<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: LingHanchen
  Date: 17/5/7
  Time: 00:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="java.util.ArrayList" %>
<%@ page import="RentGoods.Goods" %>
<%@ page import="RentGoods.User" %>

<% ArrayList<Goods> book = (ArrayList<Goods>) request.getAttribute("book");%>
<% ArrayList<Goods> IT = (ArrayList<Goods>) request.getAttribute("IT");%>
<% ArrayList<Goods> sport = (ArrayList<Goods>) request.getAttribute("sport");%>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>熙物——校园物品租借</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- favicon
    ============================================ -->
    <link rel="shortcut icon" type="image/x-icon" href="../pages/img/favicon.png">

    <!-- All css files are included here. -->
    <!-- Bootstrap framework main css -->
    <link rel="stylesheet" href="../pages/css/bootstrap.min.css">
    <!-- This core.css file contents all plugings css file. -->
    <link rel="stylesheet" href="../pages/css/core.css">
    <!-- Theme shortcodes/elements style -->
    <link rel="stylesheet" href="../pages/css/shortcode/shortcodes.css">
    <!-- Theme main style -->
    <link rel="stylesheet" href="../pages/css/style.css">
    <!-- Responsive css -->
    <link rel="stylesheet" href="../pages/css/responsive.css">
    <!-- User style -->
    <link rel="stylesheet" href="../pages/css/custom.css">

    <!-- Modernizr JS -->
    <script src="../pages/js/vendor/modernizr-2.8.3.min.js"></script>
</head>

<body>
<div>
    <jsp:include page="nvi.jsp"/>
</div>
<!-- slider-container start -->
<div class="slider-container">
    <!-- Slider Image 首页轮播图-->
    <div id="mainSlider" class="nivoSlider slider-image">
        <img src="../pages/img/slider/11.jpg" alt="" title="#htmlcaption1">
        <img src="../pages/img/slider/22.jpg" alt="" title="#htmlcaption1">
    </div>
    <!-- Slider Caption 第一个轮播图 -->
    <div id="htmlcaption1" class="nivo-html-caption slider-caption-1">
        <div class="container">
            <div class="slide1-text">
                <div class="middle-text">
                    <div class="cap-dec cap-2 wow bounceInRight" data-wow-duration="1.2s" data-wow-delay="0.2s">
                        <h2 style="color: rgb(203,203,203)">闲置物品重新焕发生机！</h2>
                    </div>
                    <div style="color: rgba(255,255,255,20)" class="cap-text wow bounceInRight" data-wow-duration="1.2s" data-wow-delay="0.3s">
                        将闲置物品通过熙物借出去，不仅能让躺在抽屉里的它重新派上用场，还能收获租金，岂不美哉！
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Slider Caption 第二个轮播图 -->
    <div id="htmlcaption2" class="nivo-html-caption slider-caption-2">
        <div class="container">
            <div class="slide1-text">
                <div class="middle-text">
                    <div class="cap-dec cap-1 wow bounceInRight" data-wow-duration="0.9s" data-wow-delay="0s">
                        <h2>A BRAND</h2>
                    </div>
                    <div class="cap-dec cap-2 wow bounceInRight" data-wow-duration="1.2s" data-wow-delay="0.2s">
                        <h2>NEW ARRIVALS</h2>
                    </div>
                    <div class="cap-text wow bounceInRight" data-wow-duration="1.2s" data-wow-delay="0.3s">
                        Fascinating outdoor lounge chair with wooden chairs for outdoor ideas with outdoor chaise lounge
                        chair.
                    </div>
                    <div class="cap-readmore wow bounceInUp" data-wow-duration="1.3s" data-wow-delay=".5s">
                        <a href="#">Shopping</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- slider-container end -->
<!-- banner-area start -->
<div class="banner-area pt-70">
    <div class="container">
        <div class="row">
            <div class="col-md-6 col-sm-6">
                <div class="single-banner"></div>
            </div>
            <div class="col-md-6 col-sm-6">
                <div class="single-banner"></div>
            </div>
        </div>
    </div>
</div>
<!-- banner-area end -->
<!-- new-arrival-area start -->
<div class="new-arrival-area pt-100">
    <div class="container">
        <div class="row">
            <div class="section-title text-center mb-20">
                <h2>分类</h2>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="product-tab">
                    <!-- Nav tabs -->
                    <ul class="custom-tab text-center mb-40">
                        <li class="active"><a href="#book" data-toggle="tab">书籍</a></li>
                        <li><a href="#sport" data-toggle="tab"> 运动</a></li>
                        <li><a href="#IT" data-toggle="tab">科技</a></li>
                    </ul>
                    <!-- Tab panes -->
                    <div class="row">
                        <div class="tab-content">
                            <div class="tab-pane active" id="book">
                                <div class="product-carousel">
                                    <!--这下面本来要有四列-->
                                    <!--一列有两个商品-->

                                    <!--商品一-->
                                    <%int i = 0;//来记录循环次数%>
                                    <c:forEach items="${book}" var="io" varStatus="s" step="2">
                                        <%Goods A = book.get(i * 2);%>
                                        <%Goods B = book.get(i * 2 + 1);%>
                                        <div class="col-md-12">
                                            <div class="product-wrapper mb-40">
                                                <div class="product-img">
                                                    <a href="/showItem?id=<%=A.getId()%>"><img
                                                            src="<%=A.getPictures().get(0)%>" alt="" height="300px"
                                                            width="300px"/></a>
                                                    <span class="new-label">新品上市</span>
                                                </div>
                                                <div class="product-content">
                                                    <div class="pro-title">
                                                        <h3><a href="/showItem?id=<%=A.getId()%>"><%=A.getName()%>
                                                        </a></h3>
                                                    </div>

                                                    <!--这里显示价格-->
                                                    <div class="price-reviews">
                                                        <div class="price-box">
                                                            <span class="price product-price">租金：<%=A.getPrice()%>元/天</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="product-wrapper mb-40">
                                                <div class="product-img">
                                                    <a href="/showItem?id=<%=B.getId()%>"><img
                                                            src="<%=B.getPictures().get(0)%>" alt="" height="300px"
                                                            width="300px"/></a>
                                                    <span class="new-label">新品上市</span>
                                                </div>
                                                <div class="product-content">
                                                    <div class="pro-title">
                                                        <h3><a href="/showItem?id=<%=B.getId()%>"><%=B.getName()%>
                                                        </a></h3>
                                                    </div>

                                                    <!--这里显示价格-->
                                                    <div class="price-reviews">
                                                        <div class="price-box">
                                                            <span class="price product-price">租金：<%=B.getPrice()%>元/天</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                        <%i++;%>
                                    </c:forEach>


                                </div>
                            </div>
                            <div class="tab-pane" id="sport">
                                <div class="product-carousel">
                                    <%i = 0;//来记录循环次数%>
                                    <c:forEach items="${book}" var="io" varStatus="s" step="2">
                                        <%Goods A = sport.get(i * 2);%>
                                        <%Goods B = sport.get(i * 2 + 1);%>
                                        <div class="col-md-12">
                                            <div class="product-wrapper mb-40">
                                                <div class="product-img">
                                                    <a href="/showItem?id=<%=A.getId()%>"><img
                                                            src="<%=A.getPictures().get(0)%>" height="300px"
                                                            width="300px" alt=""/></a>
                                                    <span class="new-label">新品上市</span>
                                                </div>
                                                <div class="product-content">
                                                    <div class="pro-title">
                                                        <h3><a href="/showItem?id=<%=A.getId()%>"><%=A.getName()%>
                                                        </a></h3>
                                                    </div>

                                                    <!--这里显示价格-->
                                                    <div class="price-reviews">
                                                        <div class="price-box">
                                                            <span class="price product-price">租金：<%=A.getPrice()%>元/天</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="product-wrapper mb-40">
                                                <div class="product-img">
                                                    <a href="/showItem?id=<%=B.getId()%>"><img
                                                            src="<%=B.getPictures().get(0)%>" height="300px"
                                                            width="300px" alt=""/></a>
                                                    <span class="new-label">新品上市</span>
                                                </div>
                                                <div class="product-content">
                                                    <div class="pro-title">
                                                        <h3><a href="/showItem?id=<%=B.getId()%>"><%=B.getName()%>
                                                        </a></h3>
                                                    </div>

                                                    <!--这里显示价格-->
                                                    <div class="price-reviews">
                                                        <div class="price-box">
                                                            <span class="price product-price">租金：<%=B.getPrice()%>元/天</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                        <%i++;%>
                                    </c:forEach>

                                </div>
                            </div>
                            <div class="tab-pane" id="IT">
                                <div class="product-carousel">
                                    <%i = 0;//来记录循环次数%>
                                    <c:forEach items="${book}" var="io" varStatus="s" step="2">
                                        <%Goods A = IT.get(i * 2);%>
                                        <%Goods B = IT.get(i * 2 + 1);%>
                                        <div class="col-md-12">
                                            <div class="product-wrapper mb-40">
                                                <div class="product-img">
                                                    <a href="/showItem?id=<%=A.getId()%>"><img
                                                            src="<%=A.getPictures().get(0)%>" height="300px"
                                                            width="300px" alt=""/></a>
                                                    <span class="new-label">新品上市</span>
                                                </div>
                                                <div class="product-content">
                                                    <div class="pro-title">
                                                        <h3><a href="/showItem?id=<%=A.getId()%>"><%=A.getName()%>
                                                        </a></h3>
                                                    </div>

                                                    <!--这里显示价格-->
                                                    <div class="price-reviews">
                                                        <div class="price-box">
                                                            <span class="price product-price">租金：<%=A.getPrice()%>元/天</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="product-wrapper mb-40">
                                                <div class="product-img">
                                                    <a href="/showItem?id=<%=A.getId()%>"><img src="<%=B.getPictures().get(0)%>" alt=""/></a>
                                                    <span class="new-label">新品上市</span>
                                                </div>
                                                <div class="product-content">
                                                    <div class="pro-title">
                                                        <h3><a href=/showItem?id=<%=B.getId()%>><%=B.getName()%>
                                                        </a></h3>
                                                    </div>

                                                    <!--这里显示价格-->
                                                    <div class="price-reviews">
                                                        <div class="price-box">
                                                            <span class="price product-price">租金：<%=B.getPrice()%>元/天元/天</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                        <%i++;%>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%
    User user = (User) session.getAttribute("User");
    if (user!=null){
%>
<jsp:include page="chatPart.jsp"/>
<%}%>

<div>
    <jsp:include page="footer.jsp"/>
</div>


<!-- jquery latest version -->
<script src="../pages/js/vendor/jquery-1.12.0.min.js"></script>
<!-- Bootstrap framework js -->
<script src="../pages/js/bootstrap.min.js"></script>
<!-- ajax-mail js发邮件的，删掉 -->

<script src="../pages/js/owl.carousel.min.js"></script>
<!-- jquery.nivo.slider js -->
<script src="../pages/js/jquery.nivo.slider.pack.js"></script>
<!-- All js plugins included in this file. -->
<script src="../pages/js/plugins.js"></script>
<!-- Main js file that contents all jQuery plugins activation. -->
<script src="../pages/js/main.js"></script>
</body>
</html>
