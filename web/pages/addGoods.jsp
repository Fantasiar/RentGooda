<%@ page import="RentGoods.User" %><%--
  添加商品-li
  Created by IntelliJ IDEA.
  User: li
  Date: 2017/4/26
  Time: 10:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加商品</title>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="/pages/css/bootstrap.min.css">
    <link rel="stylesheet" href="/pages/css/core.css">
    <link rel="stylesheet" href="/pages/css/shortcode/shortcodes.css">
    <link rel="stylesheet" href="/pages/style.css">
    <link rel="stylesheet" href="/pages/css/responsive.css">
    <link rel="stylesheet" href="/pages/css/upload.css">

</head>
<style type="text/css">
    body{
        text-align: center;
    }
    .shop-area{
        margin-top: 130px;
    }
    #container{
        text-align: center;
        margin: auto auto;
        width: 650px;
        height: 500px;
    }
    table{
        border-collapse:separate;
        border-spacing:10px;
    }
    #submit{
        width: 80px;
        height: 32px;
        background-color: gold;
        border: solid gold;
        border-radius: 10px;
        color: black;
    }
    #area{
        width: 400px;
        height: 220px;
        border-radius: 10px;
    }
    .content{
        border-radius: 10px;
    }

</style>
<div class="container">
<jsp:include page="nvi.jsp"/></div>
<div class="breadcrumb-area">
    <div class="container">
        <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-home"></i></a></li>
            <li class="active"><a href="#">个人中心</a></li>
        </ol>
    </div>
</div>
<div class="shop-area" align="center">
    <form action="/addGoods" method="post" enctype="multipart/form-data">
        <table>
            <tr>
                <td>物品名：</td>
                <td><input type="text" name="name" id="name" class="content"></td>
            </tr>
            <tr>
                <td>类型：</td>
                <td>
                    <select name="type" class="content" id="type">
                    <option value="sport">体育产品</option>
                    <option value="book">书籍</option>
                    <option value="IT">电子产品</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>成色：</td>
                <td><input type="text" name="fineness" id="fineness" class="content"></td>
            </tr>
            <tr>
                <td>描述：</td>
                <td><textarea name="description" id="area"></textarea></td>
            </tr>
            <tr>
                <td>图片上传：</td>
                <td><div id="T_upload"></div></td>
            <tr>
                <td>押金：</td>
                <td><input type="text" name="phone"id="deposite" class="content"></td>
            </tr>
                <td>价格：</td>
            <td><input type="text" name="phone" id="price" class="content"></td>
            </tr>
            <tr>
                <td colspan="2" align="center" ><input type="button" value="发布" id="submit" onclick=""></td>
            </tr>

        </table>

    </form>
</div>
<%
    User user = (User) session.getAttribute("User");
    if (user!=null){
%>
<jsp:include page="chatPart.jsp"/>
<%}%>
<jsp:include page="footer.jsp"/>
</div>
</body>
<!-- jquery latest version -->
<script src="/pages/js/jquery-1.7.2.min.js"></script>
<!-- Bootstrap framework js -->
<script src="../pages/js/bootstrap.min.js"></script>
<!-- All js plugins included in this file. -->
<script src="../pages/js/plugins.js"></script>
<!-- Main js file that contents all jQuery plugins activation. -->
<script src="../pages/js/T_upload.js"></script>
<script type="text/javascript" >
    $(function() {
        $.Tupload.init({
            url: "/addGoods",
            title	  : '',
            fileNum: 5, // 上传文件数量
            divId: "T_upload", // div  id
            accept: "image/jpeg,image/x-png", // 上传文件的类型
        });
    })
</script>
</html>
