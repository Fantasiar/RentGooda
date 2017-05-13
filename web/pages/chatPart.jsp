<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="RentGoods.User" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: LingHanchen
  Date: 17/5/11
  Time: 14:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" type="text/css" href="../pages/css/styles.css">
<script type="application/javascript" src="../pages/js/vendor/jquery-1.12.0.min.js"></script>
<div class="chatPart">
    <div class="chatPart_close">
        <img src="../pages/img/icons/close.ico" height="20px">
    </div>
<div class="sidebar-content">
    <%
        User user = (User) session.getAttribute("User");
        if(user != null){
            String DB_URl = request.getServletContext().getInitParameter("DB_URL");
            String root = request.getServletContext().getInitParameter("username");
            String password = request.getServletContext().getInitParameter("password");
            Connection connection = DriverManager.getConnection(DB_URl,root,password);
            String query = "select withWho from chatInfo where userName=?";
            PreparedStatement pstat = connection.prepareStatement(query);
            pstat.setString(1,user.getUserName());
            ResultSet set = pstat.executeQuery();
            while(set.next()){
                query = "select nickname,head from userinfo where userName=?";
                pstat = connection.prepareStatement(query);
                pstat.setString(1,set.getString("withWho"));
                ResultSet person = pstat.executeQuery();
                person.next();
    %>
    <div class="contact" id="<%=set.getString("withWho")%>">
        <img src="<%=".."+person.getString("head")%>" class="contact__photo" height="34px" width="34px"/>
        <span class="contact__name" ><%=person.getString("nickname")%></span>
        <span class="contact__status"></span>
        <img src="../pages/img/icons/delete.ico" height="16px" class="contact__delete">
    </div>
    <%
        }
    }
    %>
</div>
<div class="chat">
    <span class="chat__back"></span>
    <div class="chat__person">
        <span class="chat__online"></span>
        <span class="chat__name"></span>
    </div>
    <div class="chat__messages">
    </div>
    <input type="text" class="chat__input" placeholder="Your message" />
</div>
</div>
<div class="chat_icon">
    <img src="../pages/img/icons/chat.png" height="30px">
</div>
<script type="application/javascript">
    var chat = {};
    var record = {};
    chat.socket = null;
    chat.ready = false;
    chat.name = <%=user==null?null:"'"+user.getUserName()+"'"%>;
    chat.chatWith = null;
    $(document).ready(function () {
        $('.chatPart').hide();
        $('.chat').hide();
        if (true){
            function connection() {
                if (window.WebSocket != undefined){
                    chat.socket = new WebSocket("ws://"+window.location.host+"/chat");
                }else if (window.MozWebSocket != undefined){
                    chat.socket = new MozWebsocket("wss://"+window.location.host+"/chat");
                }else {
                    alert('Error: WebSocket is not supported by this browser');
                }
                chat.socket.onopen = function () {
                    var json = {};
                    json.method = 'History';
                    chat.socket.send(JSON.stringify(json));
                }
                chat.socket.onmessage = function (message) {
                    var json = JSON.parse(message.data);
                    for (var i in json){
                        if (record[i] == undefined){
                            record[i] = json[i];
                        }else {
                            record[i] += json[i];
                        }
                        if(i==chat.chatWith || i==chat.name){
                            $('.chat__messages').append(json[i]);
                        }else if(chat.ready == true){
                            document.getElementById(i)
                        }
                    }
                    chat.ready = true;
                    $('.chat__messages').scrollTop($('.chat__messages')[0].scrollHeight);
                }
                chat.socket.onclose = function () {
                }
                chat.socket.onerror = function (error) {

                }
                $('.chat__input').keydown(function (event) {
                    if(event.keyCode == 13){
                        var content = $('.chat__input').val();
                        if(content != ''){
                            $('.chat__input').val('');
                            var sender = "<div class='chat__msgRow'><div class='chat__message mine'>"
                                +content+"</div></div>";
                            var json2 = {};
                            json2.method = 'chat';
                            json2.fromWho = chat.chatWith;
                            json2.toWho = chat.name;
                            json2.mainInfo = sender;
                            chat.socket.send(JSON.stringify(json2));
                            var json1 = {};
                            json1.method = 'chat';
                            json1.fromWho = chat.name;
                            json1.toWho = chat.chatWith;
                            json1.mainInfo = "<div class='chat__msgRow'><div class='chat__message notMine'> "
                                +content+"</div></div>";
                            chat.socket.send(JSON.stringify(json1));
                        }
                    }
                });
            }
            connection();
            $('.chat__back').click(function () {
                $('.chat').hide();
                chat.chatWith = null;
            });
            $(".contact").click(function () {
                $('.chat').show();
                chat.chatWith = $(this).attr('id');
                nickname = $(this).find('.contact__name').text();
                $(this).find('.contact__status').attr('id','contact__status');
                $('.chat__messages').empty();
                $('.chat__messages').append(record[chat.chatWith]);
                $('.chat__name').empty();
                $('.chat__name').append(nickname);
            });
            $('.chat_icon').click(function () {
                $('.chatPart').show();
                $('.chat_icon').hide();
            });
            $('.chatPart_close').click(function () {
                $('.chatPart').hide();
                $('.chat_icon').show();
            });
            $('.contact__delete').click(function () {
                $('.chat').hide();
                chat.chatWith = null;
                var json = {};
                json.method = 'delete';
                json.delete = $(this).parent('.contact').attr('id');
                chat.socket.send(JSON.stringify(json));
                $(this).parent('.contact').remove();
            });
        }else {

        }
    });
</script>

