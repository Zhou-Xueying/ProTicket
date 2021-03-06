<%--
  Created by IntelliJ IDEA.
  User: ThinkPad
  Date: 2018/4/4
  Time: 0:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>缇可网</title>
    <link rel="shortcut icon" href="static/images/icon.png" type="image/x-icon" />
    <link href="static/bootstrap/css/bootstrap.css" rel="stylesheet">
    <link href='static/css/font-awesome.min.css' rel="stylesheet">
    <link href='static/css/animate.min.css' rel="stylesheet">
    <link href="static/css/cover.css" rel="stylesheet">
</head>
<body>
<nav class="navbar navbar-inverse  navbar-fixed-top">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#" style="color:#fff">ProTicket</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li class="active"><a href="#">缇可网，您的票务专家 <span class="sr-only">(current)</span></a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false" aria-haspopup="true">
                        <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="managerPage.jsp">待处理申请</a></li>
                        <li><a href="venuesData.jsp">场馆统计</a></li>
                        <li><a href="membersData.jsp">用户统计</a></li>
                        <li role="separator" class="divider"></li>
                        <li>
                            <a href="welcome.form">退出登录</a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
<div class="content container" style="margin-top: 100px;margin-bottom: 100px; max-width:1300px;">
    <div class="col-md-offset-2">
        <table border="1" style="margin-top: 50px; font-size: 20px; text-align: center;" id="table">
            <tr style="font-size: 25px; font-weight: 100;">
                <th>场馆编号</th>
                <th>名称</th>
                <th>活动总数</th>
                <th>完成订单总数</th>
                <th>售票总数</th>
                <th>总收入</th>
            </tr>
        </table>
    </div>
</div>
<footer style="text-align: center; margin: 10px;">
    <div class="container">
        <p>Copyright © 2018 ProTicket NJU Software</p>
    </div>
</footer>
<script src="static/jquery/jquery.js" type="text/javascript"></script>
<script>window.jQuery || document.write('<script src="/static/jquery/jquery.js"><\/script>')</script>
<script src="static/bootstrap/js/bootstrap.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        console.log("document.ready");
        $.ajax({
            url:'getVenues.form',
            dataType:'json',
            type:'GET',
            success:function (data) {
                console.log("success");
                for(var i=0;i<data.length;i++) {
                    var venueId = data[i].venueid;
                    var venueName = data[i].venuename;
                    var eventCount = data[i].eventcount;
                    var orderCount = data[i].ordercount;
                    var ticketCount = data[i].ticketcount;
                    var income = data[i].income;
                    appendDiv(venueId,venueName,eventCount,orderCount,ticketCount,income);
                }
            }
        });
        function appendDiv(venueId,venueName,eventCount,orderCount,ticketCount,income){
            console.log("appendDiv");
            var table = document.getElementById("table");
            var tr = document.createElement("tr");
            var td1 = document.createElement("td");
            td1.innerHTML = venueId;
            var td2 = document.createElement("td");
            td2.innerHTML = venueName;
            var td3 = document.createElement("td");
            td3.innerHTML = eventCount;
            var td4 = document.createElement("td");
            td4.innerHTML = orderCount;
            var td5 = document.createElement("td");
            td5.innerHTML = ticketCount;
            var td6 = document.createElement("td");
            td6.innerHTML = income;
            tr.appendChild(td1);
            tr.appendChild(td2);
            tr.appendChild(td3);
            tr.appendChild(td4);
            tr.appendChild(td5);
            tr.appendChild(td6);
            table.appendChild(tr);
        }
    });
</script>
</body>
</html>

