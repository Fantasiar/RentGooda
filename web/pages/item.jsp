<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="RentGoods.Goods" %>
<%@ page import="RentGoods.User" %>


<%--
  物品详情页
  Created by IntelliJ IDEA.
  User: haoyun
  Date: 2017/4/21
  Time: 21:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<%
    Goods item = (Goods) request.getAttribute("item");
    User user = (User)session.getAttribute("User");
%>
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title><%=item.getName()%>
    </title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- favicon
    ============================================ -->
    <link rel="shortcut icon" type="image/x-icon" href="img/favicon.png">

    <!-- All css files are included here. -->
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
    <!-- Bootstrap core CSS -->
    <link href="../pages/css/bootstrap.min.css" rel="stylesheet">


    <!-- Modernizr JS -->
    <script src="../pages/js/vendor/modernizr-2.8.3.min.js"></script>
</head>

<body>
<div class="container">
<!--header start--!>
<div><jsp:include page="nvi.jsp"/></div>
<!--header end--!>


<!-- breadcrumb start -->
<div class="breadcrumb-area">
    <div class="container">
        <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-home"></i></a></li>
            <li><a href="#"><%=item.getType()%>
            </a></li>
            <li class="active"><%=item.getName()%>
            </li>
        </ol>
    </div>
</div>
<!-- breadcrumb end -->
<!-- shop-area start -->
<div class="shop-area">
    <div class="container">
        <div class="row">
            <div class="col-xs-12 col-sm-6 col-md-5">
                <div class="product-zoom">
                    <!-- Tab panes -->
                    <%--这里是上面的大图 class = active 是时候，表示为被显示--%>
                    <div class="tab-content">
                        <%--这里需要有一个迭代遍历，将剩下的都遍历--%>
                        <c:forEach items="${item.getPictures()}" var="item" varStatus="status">
                            <div class="tab-pane <c:if test="${status.count==1}" >
                            active
</c:if>" id="${status.count}">
                                <div class="pro-large-img">
                                    <img src="${item}" alt=""/>
                                    <a class="popup-link" href="${item}">查看大图<i class="fa fa-search-plus"
                                                                                aria-hidden="true"></i></a>
                                </div>
                            </div>
                        </c:forEach>

                    </div>
                    <!-- Nav tabs -->
                    <%--这下面是小图，class=active时被显示，一次只显示4个--%>
                    <ul class="details-tab">

                        <c:forEach items="${item.getPictures()}" var="item" varStatus="status">
                            <li><a href="#${status.count}" data-toggle="tab"
                                    <c:if test="${status.count==1}">
                                        class="active"
                                    </c:if>
                            ><img src="${item}" alt=""/></a></li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
            <!--商品信息 -->
            <div class="col-xs-12 col-sm-6 col-md-7">
                <div class="product-details" >
                    <h2 class="pro-d-title"><%=item.getName()%>
                    </h2>
                    <div class="pro-ref container">
                        <div class="col-2">
                            <p>
                                <label>成色: </label>
                                <span><%=item.getFineness()%></span>
                            </p>
                            <p>
                                <label>价值: </label>
                                <span><%=item.getOriginprice()%></span>
                            </p>
                            <p>
                                <label>押金: </label>
                                <span><%=item.getDeposit()%></span>
                            </p>
                        </div>
                        <div class="col-2">
                            <p>
                                <label>数量: </label>
                                <span>2</span>
                            </p>
                            <p>
                                <label>出租方: </label>
                                <span><%=item.getOwnerId()%></span>
                            </p>
                            <p>
                                <label>地址: </label>
                                <span><%=item.getAddress()%></span>
                            </p>
                        </div>

                    </div>
                    <div class="price-box">
                        <p><span class="price product-price"> ￥<%=item.getPrice()%>/天</span></p>

                    </div>
                    <div class="short-desc">
                        <p><%=item.getDescription()%>
                        </p>
                    </div>
                    <div class="box-quantity">
                        <form action="#">
                            <label>数量</label>
                            <input type="number" value="1"/>
                            <button>添加到心愿单</button>
                        </form>
                    </div>
                    <br>
                    <div class="">
                        <form action="#" id="time">
                            <label>租赁天数</label>
                            <input type="text" placeholder="请输入租赁天数"/>
                        </form>
                    </div>

                    <br/>
                    <button type="button" class="btn btn-default" onclick="wantLent('<%=item.getId()%>','<%=item.getOwnerId()%>')">去租</button>
                    <button type="button" class="btn btn-default" onclick="<%=(user==null?"jumptoSignin()":"chatWith('"+item.getId()+"')")%>">联系主人</button>

                </div>
            </div>
        </div>
    </div>
</div>
<!-- shop-area end -->
<!-- pro-info-area start -->
<div class="pro-info-area ptb-80">
    <div class="container">
        <div class="pro-info-box">
            <!-- Nav tabs -->
            <ul class="pro-info-tab" role="tablist">
                <li class="active"><a href="#home3" data-toggle="tab">物品介绍</a></li>
                <li><a href="#profile3" data-toggle="tab">参数</a></li>
                <li><a href="#messages3" data-toggle="tab">评论</a></li>
            </ul>
            <!-- Tab panes -->
            <div class="tab-content">
                <div class="tab-pane active" id="home3">
                    <div class="pro-desc">
                        <p><%=item.getDescription()%>
                        </p>
                    </div>
                </div>
                <div class="tab-pane" id="profile3">
                    <div class="pro-desc">
                        <table class="table-data-sheet">
                            <tbody>
                            <tr class="odd">
                                <td>Compositions</td>
                                <td>Cotton</td>
                            </tr>
                            <tr class="even">
                                <td>Styles</td>
                                <td>Casual</td>
                            </tr>
                            <tr class="odd">
                                <td>Properties</td>
                                <td>Short Sleeve</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="tab-pane" id="messages3">
                    <div class="pro-desc">
                        <a href="#">第一条评论。。。。。。</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- pro-info-area end -->

    <%
        if (user!=null){
    %>
    <jsp:include page="chatPart.jsp"/>
    <%}%>

<!-- footer start -->
<div>
    <jsp:include page="footer.jsp"/>
</div>
</div>
<!-- footer end -->
<script type="text/javascript">
    function wantLent(goodsId,ownerId) {
        $.ajax({
            url:"/applylent",
            method:'POST',
            data:{
                goodsId:goodsId,
                ownerId:ownerId
            }
        }).done(function (mes) {
            if (mes == "signin"){
                window.location.href = '/signin';
            } else if (mes == "success"){
                alert("已向物主发出租赁请求");
            }
        }).fail(function () {
            alert('fail');
        });
    };
    function jumptoSignin() {
        window.location.href = '/signin';
    }
</script>
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
</body>
</html>
