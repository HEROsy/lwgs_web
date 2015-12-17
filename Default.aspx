<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Src="~/common/web_head.ascx" TagPrefix="uc1" TagName="web_head" %>
<%@ Register Src="~/common/web_foot.ascx" TagPrefix="uc1" TagName="web_foot" %>



<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="css/swkj.css" rel="stylesheet" />
    <link href="css/swkjbt.css" rel="stylesheet" />
    <script src="js/jquery-1.8.2.min.js"></script>
    <script src="js/swkj.js"></script>
    <title>雅安市劳务有限公司官网</title>
    <style type="text/css">
        .t_center {
            text-align:center;
        }
        .zg1 {
            display:block;
            float:left;
            width:60px;
            height:60px;
            background-image:url(img/zg1.png);
            background-repeat:no-repeat;
            line-height:60px;
            text-align:center;
            color:#ffffff;
            font-size:18px;
            font-weight:bold;
        }
        .zg2 {
            line-height: 60px;
            display: block;
            float: left;
            color: #7E7B7B;
            margin-left: 10px;
            width: 325px;
            overflow:hidden;
            text-overflow:ellipsis;
            white-space:nowrap;
        }

        .zg3 {
            line-height: 60px;
            display: block;
            float: left;
            color: #7E7B7B;
            margin-left: 10px;
            letter-spacing: 0px;
        }

        .zg {
            height: 60px;
            border-bottom: 1px solid #F7F7F7;
        }

            .zg:hover {
                background-color: #fea321;
                transition: background-color 0.1s linear;
                -moz-transition: background-color 0.1s linear;
                -webkit-transition: background-color 0.1s linear;
                -o-transition: background-color 0.1s linear;
            }
            .zg:hover span{
                color: #ffffff;
            }
            .zg:hover .zg1{
                background-image:url(img/zg1_hover.png);
                color:#f26666;
            }

        .zgn {
            height: 60px;
            width: 428px;
            float: left;
        }


        .tz1 {
            display:block;
            float:left;
            width:60px;
            height:60px;
            background-image:url(img/tz1.png);
            background-repeat:no-repeat;
            line-height:60px;
            text-align:center;
            color:#ffffff;
            font-size:18px;
            font-weight:bold;
        }
        .tz2 {
            line-height: 60px;
            display: block;
            float: left;
            color: #7E7B7B;
            margin-left: 10px;
            width: 325px;
            overflow:hidden;
            text-overflow:ellipsis;
            white-space:nowrap;
        }

        .tz3 {
            line-height: 60px;
            display: block;
            float: left;
            color: #7E7B7B;
            margin-left: 10px;
            letter-spacing: 0px;
        }

        .tz {
            height: 60px;
            border-bottom: 1px solid #EAEAEA;
        }

            .tz:hover {
                background-color: #f26666;
                transition: background-color 0.1s linear;
                -moz-transition: background-color 0.1s linear;
                -webkit-transition: background-color 0.1s linear;
                -o-transition: background-color 0.1s linear;
            }
            .tz:hover span{
                color: #ffffff;
            }
            .tz:hover .tz1{
                background-image:url(img/tz1_hover.png);
                color:#f26666;
            }

        .tzn {
            height: 60px;
            width: 428px;
            float: left;
        }
        .middle {
            width: 100%; 
            height:574px;  
            background-image:url(img/middle.jpg);
            background-repeat:no-repeat;
            background-position:center 0px;      
        }
        .bbt {
            display:block;
            float:left;
            width:60px;
            height:60px;
            background-image:url(img/bbt.png);
            background-repeat:no-repeat;
        }
        .bt {
            height: 60px;
            border-bottom: 1px solid #EAEAEA;
        }

            .bt:hover {
                background-color: #f26666;
                transition: background-color 0.1s linear;
                -moz-transition: background-color 0.1s linear;
                -webkit-transition: background-color 0.1s linear;
                -o-transition: background-color 0.1s linear;
            }
            .bt:hover span{
                color: #ffffff;
            }
            .bt:hover .bbt{
                background-image:url(img/bbt_hover.png);
            }
        .bm {
            display: inline-block;
            float: right;
        }
            .bm span {
                display: block;
                background-color: #fea321;
                color: #ffffff;
                width: 100px;
                text-align: center;
                line-height: 40px;
                margin-top: 17px;
            }
            .bm span:hover {
                background-color: #f26666;
                transition: background-color 0.2s linear;
                -moz-transition: background-color 0.2s linear;
                -webkit-transition: background-color 0.2s linear;
                -o-transition: background-color 0.2s linear;
            }
    </style>

    <script type="text/javascript">
        /*招工信息：json_zgxx 字段：id titles bclass sclass fbtimes
        *通知公告：json_tzgg 字段：id titles bclass sclass fbtimes
        *法律法规：json_flfg 字段：id titles bclass sclass  fbtimes
        *以上新闻标题链接地址：web_newsshow.aspx?bid=bclass&sid=sclass&nid=id
        *
        *
        */
        var json_zgxx;
        var json_tzgg;
        var json_flfg;
        var html;
        window.onload = function () {
            html = "";
            zgxx();
            tzgg();
            flfg();
        }
       
        function decode(str) {
            str = decodeURIComponent(str.replace(/\+/g, '%20'));
            return str;
        }

        function zgxx() {
            json_zgxx = document.getElementById("json_zg").value;
            var sel_id = document.getElementById("zgxx");
                try {
                var data = eval("(" + json_zgxx + ")");
                } catch (e) {

                } 
            html="";
            for (var i = 0; i < data.length; i++) {
                html = html + "<div class='zg' onmouseover='this.style.cursor='pointer'' onclick=window.location.href='web_newsshow.aspx?bid=" + decode(data[i].bclass) + "&sid=" + decode(data[i].sclass) + "&nid=" + decode(data[i].id) + "'>"
                                + "<span class='zg1'>" + (i + 1) + "</span><div class='zgn'><span class='zg2'>" + decode(data[i].titles) + "</span>"
                                + "<span class='zg3'>" + decode(data[i].fbtimes) + "</span></div></div>";
            }
            sel_id.innerHTML = html;
        }

        function tzgg() {
            json_tzgg = document.getElementById("json_tz").value;
            var sel_id = document.getElementById("tzgg");
            try {
                var data = eval("(" + json_tzgg + ")");
            } catch (e) {

            }
            html = "";
            for (var i = 0; i < data.length; i++) {
                html = html + "<div class='tz' onmouseover='this.style.cursor='pointer'' onclick=window.location.href='web_newsshow.aspx?bid=" + decode(data[i].bclass) + "&sid=" + decode(data[i].sclass) + "&nid=" + decode(data[i].id) + "'>"
                          + "<span class='tz1'>" + (i + 1) + "</span><div class='tzn'><span class='tz2'>" + decode(data[i].titles) + "</span><span class='tz3'>" + decode(data[i].fbtimes) + "</span></div></div>";
            }
            sel_id.innerHTML = html;
        }

        function flfg() {
            json_flfg = document.getElementById("json_fl").value;
            var sel_id = document.getElementById("flfg");
            try {
                var data = eval("(" + json_flfg + ")");
            } catch (e) {

            }
            html = "";
            for (var i = 0; i < data.length; i++) {
                html = html + "<div class='bt' onmouseover='this.style.cursor='pointer'' onclick=window.location.href='web_newsshow.aspx?bid=" + decode(data[i].bclass) + "&sid=" + decode(data[i].sclass) + "&nid=" + decode(data[i].id) + "'>"
                              + "<span class='bbt'></span><div class='tzn'><span class='tz2'>" + decode(data[i].titles) + "</span>"
                              + "<span class='tz3'>" + decode(data[i].fbtimes) + "</span></div></div>";
            }
            sel_id.innerHTML = html;
        }
    </script>
</head>
<body>
    <input type="hidden" id="json_zg" value="<%=json_zgxx %>" />;
    <input type="hidden" id="json_tz" value="<%=json_tzgg %>" />;
    <input type="hidden" id="json_fl" value="<%=json_flfg %>" />;
    <uc1:web_head runat="server" ID="web_head" />
    <div style="width: 1000px; margin: auto">
         <%--招工信息列表--%>
        <div>
            <div class="row-fluid" style="margin-top: 30px">               
                <div class="span12 t_center" style="display: inline-block;">
                    <img src="img/title1.png"  onmouseover="this.style.cursor='pointer'" onclick="window.location.href='#'" style="margin-left: 100px;" />
                    <div class="bm"><span onmouseover="this.style.cursor='pointer'" onclick="window.location.href='#'">考试报名</span></div>
                </div>
            </div>

            <div class="row-fluid" style="margin-top: 30px">

                <div class="span6">
                    <img src="img/zgleft.jpg" />
                </div>
                <div class="span6" id="zgxx">
                   
                </div>
            </div>
        </div>
    </div>

    <div style="width: 100%; height:540px; background-color:#f5f5f5;">
        <div style="width: 1000px; margin: auto">
            <%--通知公告列表--%>
            <div class="row-fluid" style="margin-top: 50px">
                <div class="span12 t_center" style="display: inline-block;margin-top:40px;">
                    <img src="img/title2.png"  onmouseover="this.style.cursor='pointer'" onclick="window.location.href='#'" style="margin-left: 100px;" />
                    <div class="bm"><span onmouseover="this.style.cursor='pointer'" onclick="window.location.href='#'">办公OA</span></div>
                </div>
            </div>

            <div class="row-fluid" style="margin-top: 30px">
                <div class="span6" id="tzgg">

                </div>
                <div class="span6">
                    <img src="img/tzright.jpg" />
                </div>
            </div>
        </div>
        </div>

    <div class="middle">
        <div></div>
     </div> <%--领导风采--%>

    <div style="width: 100%; height: 540px; background-color: #efefef;">
        <div style="width: 1000px; margin: auto;background-image:url(img/shuxian.png);background-repeat:no-repeat;background-position:center 0px;">
            <div class="row-fluid">
                <div class="span6 t_center" style="margin-top: 40px;">
                    <img src="img/title3.png" onmouseover="this.style.cursor='pointer'" onclick="window.location.href='#'" />
                </div>
                <div class="span6 t_center" style="margin-top: 40px;">
                    <img src="img/title4.png" onmouseover="this.style.cursor='pointer'" onclick="window.location.href='#'" />
                </div>
            </div>

            <div class="row-fluid" style="margin-top: 30px">
                <div class="span6" id="flfg"> <%--法律法规--%>
                   
                </div>

                <div class="span6"> <%--表格下载--%>
                    <div class="bt" onmouseover="this.style.cursor='pointer'" onclick="window.location.href='#'">
                        <span class="bbt"></span><div class="tzn"><span class="tz2">这里是标题是标题是标题这里是标题是标题是标题这里是标题是标题是标题</span><span class="tz3">2015/12/12</span></div>
                    </div>
                    <div class="bt" onmouseover="this.style.cursor='pointer'" onclick="window.location.href='#'">
                        <span class="bbt"></span><div class="tzn"><span class="tz2">这里是标题是标题是标题</span><span class="tz3">2015/12/12</span></div>
                    </div>
                    <div class="bt" onmouseover="this.style.cursor='pointer'" onclick="window.location.href='#'">
                        <span class="bbt"></span><div class="tzn"><span class="tz2">这里是标题是标题是标题</span><span class="tz3">2015/12/12</span></div>
                    </div>
                    <div class="bt" onmouseover="this.style.cursor='pointer'" onclick="window.location.href='#'">
                        <span class="bbt"></span><div class="tzn"><span class="tz2">这里是标题是标题是标题</span><span class="tz3">2015/12/12</span></div>
                    </div>
                    <div class="bt" onmouseover="this.style.cursor='pointer'" onclick="window.location.href='#'">
                        <span class="bbt"></span><div class="tzn"><span class="tz2">这里是标题是标题是标题</span><span class="tz3">2015/12/12</span></div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <uc1:web_foot runat="server" ID="web_foot" />
</body>
</html>
