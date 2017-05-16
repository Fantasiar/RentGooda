<%--
  Created by IntelliJ IDEA.
  User: LingHanchen
  Date: 17/5/13
  Time: 20:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="../pages/css/bootstrap.min.css">
<script src="../pages/js/bootstrap.min.js"></script>
<script src="../pages/js/vendor/jquery-1.12.0.min.js"></script>
<style type="text/css">
    input{
        height: 40px;
        border: solid 1px gold;
        background-color: white;
    }
</style>
<script type="text/javascript" src="../pages/js/vendor/jquery-1.12.0.min.js"></script>
<div class="container" style="background-color: #f5f5f6;height: 600px;" >
    <form role="form" class="form-horizontal" style="margin-top: 30px">
        <div class="form-group">
            <label for="old_password" class="col-md-1 " style="margin-left: 20px;margin-top: 10px">当前密码:</label>
            <div class="col-md-4">
                <input id="old_password" type="password" style="height: 40px;border: solid 1px gold" class="form-control" placeholder="请输入旧密码">
            </div>
        </div>
        <div class="form-group">
            <label for="new_password" class="col-md-1 " style="margin-left: 20px;margin-top: 10px">新密码:</label>
            <div class="col-md-4">
                <input id="new_password" type="password" style="height: 40px;border: solid 1px gold" class="form-control" placeholder="请输入新的密码">
            </div>
        </div>
        <div class="form-group">
            <label for="conform_password" class="col-md-1 " style="margin-left: 20px;margin-top: 10px">确认密码:</label>
            <div class="col-md-4">
                <input id="conform_password" type="password" style="height: 40px;border: solid 1px gold" class="form-control" placeholder="请确认您的密码">
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-offset-2 col-md-3">
                <button type="submit" class="btn btn-primary" onclick="changePassword()">保存</button>
            </div>
        </div>
    </form>
</div>

<script type="text/javascript">
    function changePassword() {
        var oldPassword = $('#old_password').val();
        var newPassword = $('#new_password').val();
        $.ajax({
            url:'/changePassword',
            method:'POST',
            data:{
                'old':oldPassword,
                'new':newPassword
            }
        }).done(function (message) {
            alert(message);
        }).fail(function () {
            alert("failed");
        });
    }
</script>
