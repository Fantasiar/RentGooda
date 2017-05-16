<%--
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
    <!-- favicon
    ============================================ -->
    <link rel="shortcut icon" type="image/x-icon" href="img/favicon.png">

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

    <!-- Modernizr JS -->
    <script src="js/vendor/modernizr-2.8.3.min.js"></script>
</head>
<style type="text/css">
    body{
        text-align: center;
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
<body>
<div><jsp:include page="nvi.jsp"/></div>

<div class="shop-area" align="center">
    <form action="/addGoods" method="post" enctype="multipart/form-data">
        <table>
            <tr>
                <td>物品名：</td>
                <td><input type="text" name="name" class="content"></td>
            </tr>
            <tr>
                <td>类型：</td>
                <td>
                    <select name="type" class="content">
                    <option>体育产品</option>
                    <option>书籍</option>
                    <option>电子产品</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>成色：</td>
                <td><input type="text" name="fineness" class="content"></td>
            </tr>
            <tr>
                <td>描述：</td>
                <td><textarea name="description" id="area"></textarea></td>
            </tr>
            <tr>
                <td>图片上传：</td>
                <td><input type="file" name="photo" style="border-radius: 10px;text-align: center"></td>
            </tr>
            <tr>
                <td>地址：</td>
                <td><input type="text" name="owner" class="content"></td>
            </tr>
            <tr>
                <td>押金：</td>
                <td><input type="text" name="phone" class="content"></td>
            </tr>
                <td>价格：</td>
            <td><input type="text" name="phone" class="content"></td>
            </tr>
            <tr>
                <td colspan="2" align="center" ><input type="submit" value="发布" id="submit"></td>
            </tr>

        </table>

    </form>
</div>
<script type="text/javascript" src="../pages/js/T_upload.js">
    $(function() {
//			var md = "product";
//			var pid = "asdasdasdasdasd";
        $.Tupload.init({
//				url: "product/uploadImage2?md=" + md + "&pid=" + pid,
            title	  : "宝贝图片大小不能超过500kb,为使避免图片上传出现问题，请尽量选择完毕图片后再上传",
            fileNum: 5, // 上传文件数量
            divId: "T_upload", // div  id
            accept: "image/jpeg,image/x-png", // 上传文件的类型
            //fileSize  :51200000,     // 上传文件的大小
            //onSuccess: function(data, i) {
            /*var temp =eval('(' + data.currentTarget.response + ')')
             if(temp.fileName != undefined){
             $("#img_src"+i).attr('value',temp.fileName);
             $("#img_src"+i).attr('name',"upload_img");
             }*/
            //},
            onDelete: function(i) {
                /*var img_val = $("#img_src"+i).attr("value");
                 if(img_val != '' && img_val != undefined){
                 var md = "product";
                 var img= $.page.getImgUrl(img_val);
                 $.ajax({
                 type:"POST",
                 url: "base/delPic" ,
                 data : {img:img,id: pid,md:md},
                 success: function(rel){}
                 });
                 }*/
            }
        });
    })
</script>
<div><jsp:include page="footer.jsp"/></div>
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
<script src="../pages/js/T_upload.js"></script>
<script src="../pages/js/jquery-ui.min.js"></script>
</html>
