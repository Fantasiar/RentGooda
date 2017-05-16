<%@ page import="RentGoods.User" %><%--

  Created by IntelliJ IDEA.
  User: haoyun
  Date: 2017/4/26
  Time: 11:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="../pages/css/bootstrap.min.css">
<script src="../pages/js/bootstrap.min.js"></script>
<script src="../pages/js/vendor/jquery-1.12.0.min.js"></script>
<%User user = (User) session.getAttribute("User");%>
    <style type="text/css">
        input{
            width: 500px;
            height: 40px;
            background-color: white;
            border: solid 1px gold;
        }
    </style>
    <script type="text/javascript" src="../pages/js/vendor/jquery-1.12.0.min.js"></script>
<div class="container" style="margin-top: 30px;margin-left:100px;height: auto">
    <form class="form-horizontal" role="form">
        <div class="form-group">
            <label for="nickname" class="col-md-1 " style="margin-left: 20px;margin-top: 10px">昵称</label>
            <div class="col-md-4">
                <input type="text" id="nickname" style="height: 40px;border: solid 1px gold" class="form-control" placeholder="请输入您的昵称" value="<%=user.getNickName()%>">
            </div>
        </div>
        <div class="form-group">
            <label for="studentID" class="col-md-1 " style="margin-left: 20px;margin-top: 10px">学号</label>
            <div class="col-md-4">
                <input type="text" id="studentID" style="height: 40px;border: solid 1px gold" class="form-control" placeholder="请输入您的学号" value="<%=user.getStudentID()%>">
            </div>
        </div>
        <div class="form-group">
            <label for="school" class="col-md-1 " style="margin-left: 20px;margin-top: 10px">学校</label>
            <div class="col-md-4">
                <input type="text" id="school" style="height: 40px;border: solid 1px gold" class="form-control" placeholder="请输入您的学校" value="<%=user.getSchool()%>">
            </div>
        </div>
        <div class="form-group">
            <label for="telephone" class="col-md-1 " style="margin-left: 20px;margin-top: 10px">手机号</label>
            <div class="col-md-4">
                <input type="text" id="telephone" style="height: 40px;border: solid 1px gold" class="form-control" placeholder="请输入您的手机号" value="<%=user.getTelephone()%>">
            </div>
        </div>
        <div class="form-group">
            <label for="email" class="col-md-1 " style="margin-left: 20px;margin-top: 10px">Email</label>
            <div class="col-md-4">
                <input type="text" id="email" style="height: 40px;border: solid 1px gold" class="form-control" placeholder="请输入您的Email" value="<%=user.getEmail()%>">
            </div>
        </div>
        <div class="form-group">
            <label for="sex" class="col-md-1 " style="margin-left: 20px;margin-top: 10px">性别</label>
            <%int sex = user.getSex();%>
            <div class="col-md-4" >
                <select  id="sex" class="form-control" style="height: 40px;border: solid 1px gold">
                    <option value="0" <%=(sex==0)?"selected='selected'":""%>>保密</option>
                    <option value="1" <%=(sex==1)?"selected='selected'":""%>>男</option>
                    <option value="2" <%=(sex==2)?"selected='selected'":""%>>女</option>
                </select>
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-offset-3 col-md-3">
                <button type="submit" class="btn btn-primary" onclick="changUserInfo()">提交</button>
            </div>
        </div>
    </form>
   <%-- <div class="">
        <table style="border-collapse:separate; border-spacing:10px 30px;">

            <tr>
                <td>性别:</td>
                <td>
                    <%int sex = user.getSex();%>
                    <select id="sex" style="background-color: white;border: solid 1px gold">
                        <option value="0" <%=(sex==0)?"selected='selected'":""%>>保密</option>
                        <option value="1" <%=(sex==1)?"selected='selected'":""%>>男</option>
                        <option value="2" <%=(sex==2)?"selected='selected'":""%>>女</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center"><input type="button" value="提交" onclick="changUserInfo()" class="fixbutton"></td>
            </tr>
        </table>
    </div>
     --%>
    <%--
    昵称:<input type="text" id="nickname" class="content"><br>
    学号:<input type="text" id="studentID" class="content"><br>
    学校:<input type="text" id="school" class="content"><br>
    手机号:<input type="text" id="telephone" class="content"><br>
    Email:<input type="email" id="email" class="content"><br>
    性别:<select id="sex"><option value="0">保密</option><option value="1">男</option><option value="2">女</option></select>
    <input type="button" value="提交" onclick="changUserInfo()" class="fixbutton">
    --%>
</div>
<script type="text/javascript">
    function changUserInfo() {
        var user = {};
        user.nickname = $('#nickname').val();
        user.studentID= $('#studentID').val();
        user.school = $('#school').val();
        user.telephone = $('#telephone').val();
        user.email = $('#email').val();
        user.sex = $('#sex').val();
        $.ajax({
            url:'/UserInfoManage',
            method:'POST',
            data:{
                'nickname':user.nickname,
                'studentid':user.studentID,
                'school':user.school,
                "telephone":user.telephone,
                'email':user.email,
                'sex':user.sex
            }
        }).done(function (message) {
            alert(message);
        }).fail(function () {
            alert("failed");
        });
    }
</script>
