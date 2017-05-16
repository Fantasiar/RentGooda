<%@ page import="RentGoods.User" %><%--

  Created by IntelliJ IDEA.
  User: haoyun
  Date: 2017/4/26
  Time: 11:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%User user = (User) session.getAttribute("User");%>
    <style type="text/css">
        .info{
            width: 650px;
            height: 500px;
            background-color: #f5f5f6;
        }
        input{
            width: 500px;
            height: 40px;
            background-color: white;
            border: solid 1px gold;
        }
        .rtable{
            margin-left: 15px;
        }
        .fixbutton{
            width: 64px;
            height: 32px;
            background-color: gold;
        }
    </style>
    <script type="text/javascript" src="../pages/js/vendor/jquery-1.12.0.min.js"></script>
<div class="info">
    <div class="rtable">
        <table style="border-collapse:separate; border-spacing:10px 30px;">
            <tr>
                <td>昵称:</td>
                <td><input type="text" id="nickname" class="content" value="<%=user.getNickName()%>"></td>
            </tr>
            <tr>
                <td>学号:</td>
                <td><input type="text" id="studentID" class="content" value="<%=user.getStudentID()%>"></td>
            </tr>
            <tr>
                <td>学校:</td>
                <td><input type="text" id="school" class="content" value="<%=user.getSchool()%>"></td>
            </tr>
            <tr>
                <td>手机号:</td>
                <td><input type="text" id="telephone" class="content" value="<%=user.getTelephone()%>"></td>
            </tr>
            <tr>
                <td>Email:</td>
                <td><input type="email" id="email" class="content" value="<%=user.getEmail()%>"></td>
            </tr>
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
