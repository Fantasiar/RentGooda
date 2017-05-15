<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Shop</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- favicon
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
<!--[if lt IE 8]>
<p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade
    your browser</a> to improve your experience.</p>
<![endif]-->
<script>

    //提交参数：关键字一个，排序方式：pup,pdown,dup,ddwon,分别表示按价格升序，降序，按时间，升序，降序
    var currentPage=1;
    var cunrentNum=0;//代表下一次打开的currentNum
    var sortMethod=$("#sortMethod").val();
    var NumInAPage=$("#NumInApage").val();
    var allNum=1;
    var getBegin=0;
    var getEnd=0;
    var allPageNum=parseInt(allNum/NumInAPage+1);

    //

    function getResult() {
        $.ajax({
            url:'/Query',
            method:'POST',
            data:{
                'keyword':$("#keyword").val(),
                'sort':$("#sortMethod").val(),
                'currentNum':cunrentNum,
                "NumInAPage":$("#NumInApage").val()
            }
        }).done(function (message) {
            update(message);
        }).fail(function () {
            alert("failed");
        });
    }

    function fanye(x) {
        if(x<1||x>allPageNum){
            return;
        }
        cunrentNum=(x-currentPage)*NumInAPage;
        currentPage=x;
        getResult();

    }
    //获取json数组，并更新相关内容

    function update(message) {
        var message=JSON.parse(message);
        var info=message['info'];
        allNum=info['allNum'];
        getBegin=info['begin'];
        getEnd=info['end'];
        allNum=info['allNum'];
        //需要①把一个个商品呈现出来，②页数的显示
        var goods=message['goods'];
        var goodsString="";
        for(var item in goods){
            goodsString+="<div class=\"col-md-3 col-sm-6\">\n" +
                "                                        <div class=\"product-wrapper mb-40\">\n" +
                "                                            <div class=\"product-img\">\n" +
                "                                                <a href=\"/showItem?id="+item['id']+"\"><img src=\""+item['cover']+"\" alt=\"\"/></a>\n" +
                "                                                <span class=\"new-label\">New</span>\n" +
                "                                            </div>\n" +
                "                                            <div class=\"product-content\">\n" +
                "                                                <div class=\"pro-title\">\n" +
                "                                                    <h3><a href=\"/showItem?id="+item['id']+"\">"+item['name']+"</a></h3>\n" +
                "                                                </div>\n" +
                "                                                <div class=\"price-reviews\">\n" +
                "                                                    <div class=\"price-box\">\n" +
                "                                                        <span class=\"price product-price\">"+item['price']+"元/天</span>\n" +
                "                                                    </div>\n" +
                "                                                </div>\n" +
                "                                            </div>\n" +
                "                                        </div>\n" +
                "                                    </div>";
        }
        $("#itemList").innerHTML=goodsString;
        $("#showing").innerHTML="当前显示"+getBegin+"——"+getEnd+",共搜到"+allNum+"个。";

        var listString="";
        listString="<li><a onclick='fanye(currentPage-1)'><i onclick='fanye(\"pre\")' class=\"fa fa-angle-left\"></i></a></li>";
        for(var i=1;i<=allPageNum;i++){
            if(i==currentPage){
                listString+="<li class=\"active\"><a"+i+"</a></li>";
            }
            else {
                listString+="<li><a onclick='fanye(i)'>"+i+"</a></li>";
            }
        }
        document.getElementById("pageNum").innerHTML=listString;
    }
    $(document).ready(function () {
            $("#sortMethod").change(
                function () {
                    sortMethod=$("#sortMethod").val();
                    getResult();
                }
            );
            $("#NumInAPage").change(
                function () {
                    NumInAPage=$("#NumInAPage").val();
                    getResult();
                }
            )
    }

    )
</script>


<!-- header start -->
<jsp:include page="nvi.jsp"></jsp:include>
<!-- header end -->
<div class="space-custom"></div>
<!-- breadcrumb start -->
<div class="breadcrumb-area">
    <div class="container">
        <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-home"></i></a></li>
            <li><a href="#">Library</a></li>
            <li class="active">Data</li>
        </ol>
    </div>
</div>
<!-- breadcrumb end -->
<!-- shop-area start -->
<div class="shop-area">
    <div class="container">
        <div class="row">


            <div class="col-md-12 col-sm-8">
                <!--右上的标题栏目-->

                <div class="shop-page-bar">
                    <div>
                        <div class="shop-bar">
                            <!-- Nav tabs -->
                            <!--<ul class="shop-tab f-left" role="tablist">-->
                            <!--<li role="presentation" class="active"><a href="#home" data-toggle="tab"><i-->
                            <!--class="fa fa-th-large" aria-hidden="true"></i></a></li>-->
                            <!--</ul>-->
                            <form class="selector-field f-left  hidden-xs col-md-4">
                                <div class="form-group">
                                    <div class="input-group">
                                        <input type="text" class="form-control" id="keyword" placeholder="请输入关键字">
                                        <div class="input-group-addon">搜索</div>
                                    </div>
                                </div>
                            </form>
                            <div class="selector-field f-left ml-20 hidden-xs">

                                <form action="#">
                                    <label>排序方式</label>
                                    <select name="select" id="sortMethod">
                                        <option value="pup">租金: 从低到高</option>
                                        <option value="pdown">租金: 从高到低</option>
                                        <option value="dup">上传日期: 由近及远</option>
                                        <option value="ddown">上传日期: 由远及近</option>

                                    </select>
                                </form>
                            </div>
                            <!--选择一页显示多少个-->
                            <div class="selector-field f-left ml-30 hidden-xs">
                                <form action="#">
                                    <label>单页显示</label>
                                    <select name="select" id="NumInAPage">
                                        <option value="12">12</option>
                                        <option value="16">16</option>
                                        <option value="20">20</option>
                                    </select>
                                </form>
                            </div>

                        </div>
                        <!-- Tab panes -->
                        <div class="tab-content">
                            <div role="tabpanel" class="tab-pane active" id="home">
                                <div class="row" id="itemList">
                                    <div class="col-md-3 col-sm-6">
                                        <div class="product-wrapper mb-40">
                                            <div class="product-img">
                                                <a href="#"><img src="img/product/5.jpg" alt=""/></a>
                                                <span class="new-label">New</span>
                                            </div>
                                            <div class="product-content">
                                                <div class="pro-title">
                                                    <h3><a href="product-details.html">Cras Neque Metus</a></h3>
                                                </div>
                                                <div class="price-reviews">
                                                    <div class="price-box">
                                                        <span class="price product-price">$262.00</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-3 col-sm-6">
                                        <div class="product-wrapper mb-40">
                                            <div class="product-img">
                                                <a href="#"><img src="img/product/5.jpg" alt=""/></a>
                                                <span class="new-label">New</span>
                                            </div>
                                            <div class="product-content">
                                                <div class="pro-title">
                                                    <h3><a href="product-details.html">Cras Neque Metus</a></h3>
                                                </div>
                                                <div class="price-reviews">
                                                    <div class="price-box">
                                                        <span class="price product-price">$262.00</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-3 col-sm-6">
                                        <div class="product-wrapper mb-40">
                                            <div class="product-img">
                                                <a href="#"><img src="img/product/5.jpg" alt=""/></a>
                                                <span class="new-label">New</span>
                                            </div>
                                            <div class="product-content">
                                                <div class="pro-title">
                                                    <h3><a href="product-details.html">Cras Neque Metus</a></h3>
                                                </div>
                                                <div class="price-reviews">
                                                    <div class="price-box">
                                                        <span class="price product-price">$262.00</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-3 col-sm-6">
                                        <div class="product-wrapper mb-40">
                                            <div class="product-img">
                                                <a href="#"><img src="img/product/5.jpg" alt=""/></a>
                                                <span class="new-label">New</span>
                                            </div>
                                            <div class="product-content">
                                                <div class="pro-title">
                                                    <h3><a href="product-details.html">Cras Neque Metus</a></h3>
                                                </div>
                                                <div class="price-reviews">
                                                    <div class="price-box">
                                                        <span class="price product-price">$262.00</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-3 col-sm-6">
                                        <div class="product-wrapper mb-40">
                                            <div class="product-img">
                                                <a href="#"><img src="img/product/5.jpg" alt=""/></a>
                                                <span class="new-label">New</span>
                                            </div>
                                            <div class="product-content">
                                                <div class="pro-title">
                                                    <h3><a href="product-details.html">Cras Neque Metus</a></h3>
                                                </div>
                                                <div class="price-reviews">
                                                    <div class="price-box">
                                                        <span class="price product-price">$262.00</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-3 col-sm-6">
                                        <div class="product-wrapper mb-40">
                                            <div class="product-img">
                                                <a href="#"><img src="img/product/5.jpg" alt=""/></a>
                                                <span class="new-label">New</span>
                                            </div>
                                            <div class="product-content">
                                                <div class="pro-title">
                                                    <h3><a href="product-details.html">Cras Neque Metus</a></h3>
                                                </div>
                                                <div class="price-reviews">
                                                    <div class="price-box">
                                                        <span class="price product-price">$262.00</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="content-sortpagibar">
                                <div class="product-count display-inline" id="showing">Showing 1 - 12 of 13 items</div>
                                <ul class="shop-pagi display-inline" id="pageNum">
   <!--底部的显示页码和按钮的部分-->     <li><a href="#"><i class="fa fa-angle-left"></i></a></li>
                                    <li class="active"><a href="#">1</a></li>
                                    <li><a href="#">2</a></li>
                                    <li><a href="#">3</a></li>
                                    <li><a href="#"><i class="fa fa-angle-right"></i></a></li>
                                </ul>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- shop-area end -->


<!-- footer start -->
<footer class="black-bg">
    <div class="footer-top-area ptb-60">
        <div class="container">
            <div class="row">
                <div class="col-md-3 col-sm-4">
                    <div class="footer-widget">
                        <h3 class="footer-title">Contact info</h3>
                        <div class="footer-contact">
                            <ul>
                                <li><em class="fa fa-map-marker"></em>8901 Marmora Road, Glasgow <span>D04 89 GR, New York</span>
                                </li>
                                <li><em class="fa fa-phone"></em>Telephones: (+1) 866-540-3229 <span>Fax: (+1) 866-540-3229</span>
                                </li>
                                <li><em class="fa fa-envelope-o"></em>Email: support@posthemes.com</li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-md-2 col-sm-4">
                    <div class="footer-widget">
                        <h3 class="footer-title">My account</h3>
                        <ul class="block-content">
                            <li><a href="#">My orders</a></li>
                            <li><a href="#">My credit slips</a></li>
                            <li><a href="#">Sitemap</a></li>
                            <li><a href="#">My addresses</a></li>
                            <li><a href="#">My personal info</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-2 col-sm-4">
                    <div class="footer-widget">
                        <h3 class="footer-title">Information</h3>
                        <ul class="block-content">
                            <li><a href="#">Contact us</a></li>
                            <li><a href="#">Discount</a></li>
                            <li><a href="#">Site map</a></li>
                            <li><a href="#">About us</a></li>
                            <li><a href="#">Custom service</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-2 col-sm-4 footer-sm">
                    <div class="footer-widget">
                        <h3 class="footer-title">OUR SERVICE</h3>
                        <ul class="block-content">
                            <li><a href="#">My orders</a></li>
                            <li><a href="#">My credit slips</a></li>
                            <li><a href="#">Sitemap</a></li>
                            <li><a href="#">My addresses</a></li>
                            <li><a href="#">My personal info</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-3 col-sm-4 footer-sm">
                    <div class="footer-widget">
                        <h3 class="footer-title">OPENING TIME</h3>
                        <div class="footer-time">
                            <p><span class="ft-content"><span class="day">Monday - Friday</span><span class="time">9:00 - 22:00</span></span>
                            </p>
                            <p><span class="ft-content"><span class="day">Saturday</span><span class="time">10:00 - 24:00</span></span>
                            </p>
                            <p><span class="ft-content"><span class="day">Sunday</span><span
                                    class="time">12:00 - 24:00</span></span></p>
                            <p><span class="ft-content"><span class="day">Thursday</span><span class="time">Free Shipping</span></span>
                            </p>
                            <p><span class="ft-content"><span class="day">Friday</span><span
                                    class="time">sale of 30%</span></span></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- footer-bootom-area start -->
    <div class="footer-bootom-area ptb-15">
        <div class="container">
            <div class="row">
                <div class="col-md-6 col-sm-6 col-xs-12">
                    <div class="copyright">
                        <p>Copyright &copy; 2017.Company name All rights reserved.<a target="_blank"
                                                                                     href="http://sc.chinaz.com/moban/">&#x7F51;&#x9875;&#x6A21;&#x677F;</a>
                        </p>
                    </div>
                </div>
                <div class="col-md-6 col-sm-6 col-xs-12">
                    <div class="payment">
                        <img src="img/payment.png" alt=""/>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- footer-bootom-area end -->
</footer>
<!-- footer end -->


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
