<%@ page import="RentGoods.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>个人中心</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="/pages/css/imgareaselect-animated.css">
<script type="text/javascript" src="/pages/js/vendor/jquery-1.12.0.min.js"></script>
<script type="text/javascript" src="/pages/js/jquery.imgareaselect.min.js"></script>
<link rel="stylesheet" href="../pages/css/bootstrap.min.css">
<script src="../pages/js/bootstrap.min.js"></script>
</head>

<%User user = (User) session.getAttribute("User");%>
<style type="text/css">
    .bigpic {
        margin-left: 10px;
        margin-top: 15px;
        margin-bottom: 30px;
        border: none;
        background-color: white;
        z-index: 10000;
        display: block;
        height: 300px;
        width: 300px;
    }
    .smallpic {
        background-color: white;
        margin-left: 100px;
        margin-top: 100px;
        width: 100px;
        height: 100px;
        overflow: hidden;
        border: none;
        float: left;
        z-index: 10000;
        display: block;
    }
    .background1{
        position: fixed;
        display: block;
        top: 0;
        left: 0;
        opacity: 0.5;
        background: #5e5e5e;
        height: 100%;
        width: 100%;
    }
    #uploadArea{
        width: 550px;
        height: 450px;
        left: 29%;
        top: 100px;
    }
</style>
<body>
<div class="background1">
</div>
<div class="container" id="uploadArea" style="background-color: #f5f5f6;z-index: 10000;position: fixed">
    <div class="row">
        <div style="float: left;margin-left: 20px;margin-top: 15px">
            <div class="frame bigpic">
                <img id="photo" src="<%=user.getHead()%>"  >
            </div>
        </div>
        <div style="float: left">
            <div id="preview" class="smallpic" >
                <img id="view_photo" src="<%=user.getHead()%>" width="100px" height="100px">
            </div>
        </div>
    </div>
    <div class="row">
        <form action="/uploadHead" method="post" enctype="multipart/form-data">
            <input id="startX" name="x" type="hidden" readonly="readonly"/>
            <input id="startY" name="y" type="hidden" readonly="readonly"/>
            <input id="width" name="width" type="hidden" readonly="readonly"/>
            <input id="height" name="height" type="hidden" readonly="readonly"/>
            <div style="margin-left: 30px">
                <input id="upload" type="file" name="file" onchange="change(this)" style="background-color: #f5f5f6;border: none;">
            </div>
            <div class="col-md-2 col-md-offset-3">
                <input type="button" value="确认" class="btn btn-primary" id="headButton" style="width: 80px">
            </div>
            <div class="col-md-2 col-md-offset-2">
                <input type="button" value="取消" class="btn btn-primary" onclick="jump()" style="width: 80px">
            </div>
        </form>
    </div>
</div>

<script type="text/javascript">
    function jump() {
        window.location.href = "/UserManage";
    }
    var width = 0;
    var height = 0;
    function clacImgZoomParam( maxWidth, maxHeight, width, height ){
        var param = {top:0, left:0, width:width, height:height};
        console.log(param);
        if(maxWidth){
            rateWidth = width / maxWidth;
            rateHeight = height / maxHeight;
            if( rateWidth > rateHeight )
            {
                param.width =  maxWidth;
                param.height = Math.round(height / rateWidth);
                rate=rateWidth;
            }else
            {
                param.width = Math.round(width / rateHeight);
                param.height = maxHeight;
                rate=rateHeight;
            }
            /*param.left = Math.round((maxWidth - param.width) / 2);
             param.top = Math.round((maxHeight - param.height) / 2);*/
        }
        console.log(rate);
        return param;
    }

    function change(file){
        // Get a reference to the fileList
        var files = !!file.files ? file.files : [];
        // If no files were selected, or no FileReader support, return
        if (!files.length || !window.FileReader) return;

        // Create a new instance of the FileReader
        var reader = new FileReader();

        // Read the local file as a DataURL
        reader.readAsDataURL(files[0]);

        // When loaded, set image data as background of div
        reader.onloadend = function(){
            var img=$('#photo');
            var img1=$('.bigpic');
            var img2=$('#uploadArea');
            img1.css('width','100%');
            img1.css('height','100%');
            img2.css('width','100%');
            img2.css('height','100%');
            img.attr("src",this.result);
            $("#view_photo").attr("src",this.result);
            img.load(function(){
                // 加载完成
                var img=$('#photo');
                img.width('100%');
                img.height('100%');
                console.log(img.height()+','+img.width());

                width = img.width();
                height = img.height();
                var rect = clacImgZoomParam(300, 300, img.width(), img.height());
                img.width(rect.width);
                img.height(rect.height);
                $("#preview").width(img.width()/3);
                $("#preview").height(img.width()/3*selectrate);
                img2.css('width','550px');
                img2.css('height','450px%');
                img1.css('width','300px');
                img1.css('height','300px');
                init();
            });
        }
    }
    $(document).ready(function () {
        var img=$('#photo');
        img.css('width','300px');
        img.css('height','300px');
    })
    $('#headButton').click(
            function upload() {
                var formdata = new FormData();
                formdata.append('file', $('#upload')[0].files[0]);
                formdata.append('x', $('#startX').val())
                formdata.append('y', $('#startY').val())
                formdata.append('width', $('#width').val())
                formdata.append('height', $('#height').val())
                formdata.append('imgWidth',width);
                formdata.append('imgHeight',height);
                $.ajax({
                    url: '/uploadHead',
                    type: "POST",
                    data: formdata,
                    processData: false,
                    contentType: false
                }).done(function () {
                    window.location.href = '/UserManage';
                }).fail(function () {
                    alert('false');
                });
            });
    function upload() {
        var formdata = new FormData();
        formdata.append('file', $('#upload')[0].files[0]);
        formdata.append('x', $('#startX').val())
        formdata.append('y', $('#startY').val())
        formdata.append('width', $('#width').val())
        formdata.append('height', $('#height').val())
        $.ajax({
            url: '/uploadHead',
            type: "POST",
            data: formdata,
            processData: false,
            contentType: false
        }).done(function () {
            alert('success');
        }).fail(function () {
            alert('false');
        });
    };
    selectrate=1;
    rate=1;
    function preview(img, selection) {
        if (!selection.width || !selection.height)
            return;
        var img=$("#view_photo");
        var scaleX =  $("#preview").width() / selection.width;
        var scaleY =  $("#preview").height() / selection.height;

        $('#preview img').css({
            width : Math.round(scaleX *  $("#photo").width()),
            height : Math.round(scaleY * $("#photo").height()),
            marginLeft : -Math.round(scaleX * selection.x1),
            marginTop : -Math.round(scaleY * selection.y1)
        });

        $("#startX").val(Math.round(selection.x1*rate));
        $("#startY").val(Math.round(selection.y1*rate));
        $("#width").val(Math.round(selection.width*rate));
        $("#height").val(Math.round(selection.height*rate));
    }

    $(function() {
        init();
    });
    function init(){
        var width=$('#photo').width();
        var height=$('#photo').height();
        $('#photo').imgAreaSelect({
            aspectRatio : "1:1",
            handles : true,
            fadeSpeed : 200,
            onSelectChange : preview,
            //x1: 0, y1: 0, x2: 240, y2: 240
        });
    }
</script>
</body>
</html>
