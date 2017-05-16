<%@ page import="java.util.ArrayList" %>
<%@ page import="RentGoods.Goods" %><%--
  Created by IntelliJ IDEA.
  User: LingHanchen
  Date: 17/5/11
  Time: 23:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%ArrayList<Goods> borrows = (ArrayList)request.getAttribute("borrow");%>
<link rel="stylesheet" href="../pages/css/bootstrap.min.css">
<script src="../pages/js/bootstrap.min.js"></script>
<script src="../pages/js/vendor/jquery-1.12.0.min.js"></script>
<style type="text/css">
    .pic{
        border: none;
        width: 100px;
        height: 100px;
        background-color: white;
        float: left;

    }
</style>

<ul class="list-group" >
    <%
        for (Goods item : borrows){
    %>
    <li class="list-group-item" style="height:170px;margin-bottom: 8px;background-color: #f5f5f6 ">
        <div class="row" style="height: 40px">
            <div class="col-md-5 ">
                <label id="<%=item.getId()%>">商品编号：<%=item.getId()%></label>
            </div>
            <div class="col-md-4 ">
                <label>创建日期：<%=item.getDateChanged()%></label>
            </div>
            <div class="col-md-3">
                <label>状态：<%=(item.getState()==1)?"待归还":"已归还"%></label>
            </div>
        </div>
        <div class="row">
            <div class="col-md-2 ">
                <div class="pic" >
                    <img src="<%=item.getPictures().get(0)%>" alt="" width="100px" height="100px">
                </div>
            </div>
            <div class="col-md-4 col-md-offset-3" style="margin-top: 7px">
                <div class="info ">
                    <label>物品名称：<%=item.getName()%></label><br>
                    <label>租金：<%=item.getPrice()%></label><br>
                    <label>押金：<%=item.getDeposit()%></label>
                </div>
            </div>
            <div class="col-md-2 ">
                <%
                    if (item.getState()==1){
                %>
                <button type="button" class="btn btn-primary" style="margin-top: 25px" onclick="chatWith('<%=item.getOwnerId()%>')">联系物主</button>
                <%
                    }
                %>
            </div>
        </div>
    </li>
    <%}%>
</ul>


