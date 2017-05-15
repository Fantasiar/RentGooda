<%@ page import="java.util.ArrayList" %>
<%@ page import="RentGoods.Goods" %>
<%@ page import="RentGoods.User" %>
<%--
Created by IntelliJ IDEA.
  User: LingHanchen
  Date: 17/5/11
  Time: 23:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%ArrayList<Goods> goods= (ArrayList<Goods>) request.getAttribute("items");%>
<link rel="stylesheet" href="../pages/css/bootstrap.min.css">
<script src="../pages/js/bootstrap.min.js"></script>
<script src="../pages/js/vendor/jquery-1.12.0.min.js"></script>
<style type="text/css">
    .pic{
        border: solid 1px lightgray;
        width: 100px;
        height: 100px;
        background-color: white;
        float: left;
    }

</style>
<body>
<ul class="list-group" style="width: 650px">
    <%
        for (Goods item : goods){
    %>
    <li class="list-group-item"  id="item" style="height:300px;margin-bottom: 5px;background-color: #f5f5f6 ">
        <div class="row">
            <div class="col-md-2 col-md-offset-1" >
                <label>商品编号:<%=item.getId()%></label>
            </div>
            <div class="col-md-4 col-md-offset-1">
                <label>创建日期：<%=item.getDateChanged()%></label>
            </div>
            <div class="col-md-2 col-md-offset-1">
                <%
                    switch (item.getState()){
                        case 0:
                %>
                <label>状态：待出租</label>
                <%
                    break;
                    case 1:
                %>
                <label>状态：待归还</label>
                <label>租借者用户名:<%=item.getBorrowerId()%></label>
                <%
                    break;
                    case 2:
                %>
                <label>状态：已归还</label>
                <%}%>
                <%--<label>状态：<%switch (item.getState()){case 0:out.println("待出租");break;case 1:out.println("待归还");break;case 2:out.println("已归还");break;}%></label>--%>
            </div>
        </div>
        <div class="row">
            <div class="col-md-2 col-md-offset-1">
                <div class="pic">
                    <img src="<%=item.getPictures().get(0)%>" alt="" width="100px" height="100px">
                </div>
            </div>
            <div class="col-md-4 col-md-offset-1">
                <div class="info ">
                    <label>物品名称：<%=item.getName()%></label><br>
                    <label>租金：<%=item.getPrice()%></label><br>
                    <label>押金：<%=item.getDeposit()%></label>
                </div>
            </div>
            <div class="col-md-2 col-md-offset-1" >
                <%switch (item.getState()){
                    case 0:
                %>
                <select id="<%=item.getId()%>">
                    <option value="" selected>请选择租赁对象</option>
                <%
                        for (User user:item.getApplyer()){

                %>
                    <option value="<%=user.getUserName()%>"><%=user.getNickName()%></option>
                <%}%>
                </select >
                <button type="button" class="btn btn-primary"  style="margin-top: 33px" onclick="lent('<%=item.getId()%>')">出租</button>
                <%
                    break;
                    case 1:
                %>
                <button type="button" class="btn btn-primary"  style="margin-top: 33px" onclick="confirm('<%=item.getId()%>')">归还</button>
                <button type="button" class="btn btn-primary" style="margin-top: 33px" onclick="chatWith('<%=item.getOwnerId()%>')">联系租借者</button>
                <%
                    break;
                    case 2:
                %>
                <%}%>
            </div>
        </div>
    </li>
    <%}%>
    <%--
    <li class="list-group-item" style="height:180px;margin-bottom: 5px;background-color: #f5f5f6 ">
        <div class="row">
            <div class="col-md-2 col-md-offset-1">
                <label>ID:0000001</label>
            </div>
            <div class="col-md-4 col-md-offset-1">
                <label>日期：2015.5.15</label>
            </div>
            <div class="col-md-2 col-md-offset-1">
                <label>状态：已出租</label>
            </div>
        </div>
        <div class="row">
            <div class="col-md-2 col-md-offset-1">
                <div class="pic">
                    <img src="" alt="" width="100px" height="100px">
                </div>
            </div>
            <div class="col-md-4 col-md-offset-1">
                <div class="info ">
                    <label>物品名称：篮球</label><br>
                    <label>租金：2元</label><br>
                    <label>价格：80元</label>
                </div>
            </div>
            <div class="col-md-2 col-md-offset-1">
                <button type="button" class="btn btn-primary" id="return" style="margin-top: 33px" onclick="">归还</button>
            </div>
        </div>
    </li>
    <li class="list-group-item" style="height:180px;margin-bottom: 5px;background-color: #f5f5f6 ">
        <div class="row">
            <div class="col-md-2 col-md-offset-1">
                <label>ID:0000001</label>
            </div>
            <div class="col-md-4 col-md-offset-1">
                <label>日期：2015.5.15</label>
            </div>
            <div class="col-md-2 col-md-offset-1">
                <label>状态：待出租</label>
            </div>
        </div>
        <div class="row">
            <div class="col-md-2 col-md-offset-1">
                <div class="pic">
                    <img src="" alt="" width="100px" height="100px">
                </div>
            </div>
            <div class="col-md-4 col-md-offset-1">
                <div class="info ">
                    <label>物品名称：篮球</label><br>
                    <label>租金：2元</label><br>
                    <label>价格：80元</label>
                </div>
            </div>
            <div class="col-md-2 col-md-offset-1">
                <select>
                    <option value="000002">Waner1</option>
                </select>
                <button type="button" class="btn btn-primary" style="margin-top: 33px" onclick="">出租</button>
            </div>
        </div>
    </li>
    <li class="list-group-item" style="height:180px;margin-bottom: 5px;background-color: #f5f5f6 ">
        <div class="row">
            <div class="col-md-2 col-md-offset-1">
                <label>ID:0000001</label>
            </div>
            <div class="col-md-4 col-md-offset-1">
                <label>日期：2015.5.15</label>
                <label>归还日期:2015.5.15</label>
            </div>
            <div class="col-md-2 col-md-offset-1">
                <label>状态：已归还</label>
            </div>
        </div>
        <div class="row">
            <div class="col-md-2 col-md-offset-1">
                <div class="pic">
                    <img src="" alt="" width="100px" height="100px">
                </div>
            </div>
            <div class="col-md-4 col-md-offset-1">
                <div class="info ">
                    <label>物品名称：篮球</label><br>
                    <label>租金：2元</label><br>
                    <label>价格：80元</label>
                </div>
            </div>
            <div class="col-md-2 col-md-offset-1">
            </div>
        </div>
    </li>
    <%----%>
</ul>

<script type="text/javascript">
    var select = null;
    var id = null;

    function lent(id) {
        var borrower = document.getElementById(id).value;
        alert(borrower);
        $.ajax({
            url:'/changeGoodsState',
            method:'POST',
            data:{
                borrower:borrower,
                goodsId:id,
                state:1
            }
        }).done(function () {
            alert("success");
        }).fail(function () {
            alert("fail");
        });
    }
    function confirm(id) {
        $.ajax({
            url:'/changeGoodsState',
            method:"POST",
            data:{
                goodsId:id,
                state:2
            }
        }).done(function () {
            alert("success");
        }).fail(function () {
            alert("fail");
        })
    };
    function deleteGoods(id) {
        $.ajax({
            url:'/deleteGoods',
            method:'POST',
            data:{
                goodsId:id
            }
        }).done(function () {
            alert(id);
        }).fail(function () {
            alert('fail');
        })
    };



</script>

</body>
</html>
