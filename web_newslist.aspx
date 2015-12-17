<%@ Page Language="C#" AutoEventWireup="true" CodeFile="web_newslist.aspx.cs" Inherits="web_newslist" %>

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
    <title>雅安市劳务有限公司-文章列表页</title>
    <style type="text/css">
        div {
            font-family:"微软雅黑" !important;
            letter-spacing:1px;
        }
        img {
            display:block;
            float:left;
        }
        span {
            font-family:"微软雅黑" !important;
            letter-spacing:1px;
        }
        .left_tt1 {
            height: 50px;
            line-height: 50px;
            background-color: #fea321;
            color: #ffffff;
            font-size: 18px;
            font-weight: bold;
            letter-spacing: 3px;
        }

        .left_tt2 {
            height: 50px;
            line-height: 50px;
            background-color: #f26666;
            color: #ffffff;
            font-size: 18px;
            font-weight: bold;
            letter-spacing: 3px;
            margin-top:20px;
        }

        .left_tt1_d {
            height: 285px;
            background-color: #FFCB81;
        }

            .left_tt1_d span {
                display: block;
                height: 50px;
                line-height: 50px;
                color: #ffffff;
                border-bottom: 1px solid #FFD599;
                overflow:hidden;
                text-overflow:ellipsis;
                white-space:nowrap;
                width: 260px;
            }

        .left_tt2_d {
            height: 285px;
            background-color: #FC8181;
            margin-bottom: 30px;
        }

            .left_tt2_d span {
                display: block;
                height: 50px;
                line-height: 50px;
                color: #ffffff;
                border-bottom: 1px solid #FF8E8E;
                overflow:hidden;
                text-overflow:ellipsis;
                white-space:nowrap;
                width: 260px;
            }

        .bq1 {
            height: 15px;
            border-bottom: 1px solid #FFD599;
        }
        .bq2 {
            height: 15px;
            border-bottom: 1px solid #FF8E8E;
        }
        .r1:hover {
            background-color: #FFBD5F;
            transition: background-color 0.2s linear;
            -moz-transition: background-color 0.2s linear;
            -webkit-transition: background-color 0.2s linear;
            -o-transition: background-color 0.2s linear;
        }

        .r2:hover {
            background-color: #FA7777;
            transition: background-color 0.2s linear;
            -moz-transition: background-color 0.2s linear;
            -webkit-transition: background-color 0.2s linear;
            -o-transition: background-color 0.2s linear;
        }
        .r1:hover .dian{
            background-image:url(img/listd1.png);
        }
        .r2:hover .dian{
            background-image:url(img/listd2.png);
        }
        .dian {
            background-image:url(img/listd.png);
            background-repeat:no-repeat;
            width:40px;
            height:50px;
            float:left;
        }
        .leibie {
            height: 60px;
            border-bottom: 2px solid #FEA321;
        }

            .leibie span {
                line-height: 60px;
                font-size: 18px;
                font-weight: bold;
                letter-spacing: 3px;
                color: #fea321;
                display: block;
                margin-left: 3px;
            }
        .mtitle {
            line-height: 45px;
            display: block;
            float: left;
            width: 546px;
            margin-left: 11px;
            height:45px;
        }

        .msj {
            line-height: 45px;
            display: block;
            float: left;
            width: 100px;
            text-align: center;
            height:45px;
        }
        .liebiao {
            margin-top:20px;
            background-image:url(img/listback.jpg);
        }
        .m {
            height:45px;
        }
        .m:hover {
            background-color:#cac9c9;
            color:#ffffff;
            transition: background-color 0.2s linear;
            -moz-transition: background-color 0.2s linear;
            -webkit-transition: background-color 0.2s linear;
            -o-transition: background-color 0.2s linear;
        }
        .fenye {
            text-align: right;
            margin-top: 18px;
            margin-right: -20px;
        }
    </style>

    <script type="text/javascript">
        window.onload = function () {

        }
    </script>
</head>

<body>
    <uc1:web_head runat="server" ID="web_head" />
    <div style="width: 1000px; margin: auto">
        <div class="row-fluid" style="margin-top: 20px">
            <div class="span4">
                <div> <%--最新通知列表--%>
                    <div class="left_tt1"><img src="img/list1.png" />通知公告</div>
                    <div class="left_tt1_d">
                        <div class="bq1"></div>
                       <div class="r1" onmouseover="this.style.cursor='pointer'" onclick="window.location.href='#'"><div class="dian"></div><span>这里是通知公告这里是通知公告这里是通知公告这里是通知公告</span></div>
                       <div class="r1" onmouseover="this.style.cursor='pointer'" onclick="window.location.href='#'"><div class="dian"></div><span>这里是通知公告</span></div>
                       <div class="r1" onmouseover="this.style.cursor='pointer'" onclick="window.location.href='#'"><div class="dian"></div><span>这里是通知公告</span></div>
                       <div class="r1" onmouseover="this.style.cursor='pointer'" onclick="window.location.href='#'"><div class="dian"></div><span>这里是通知公告</span></div>
                       <div class="r1" onmouseover="this.style.cursor='pointer'" onclick="window.location.href='#'"><div class="dian"></div><span>这里是通知公告</span></div>
                    </div>
                </div>

                <div> <%--最新招工列表--%>
                    <div class="left_tt2"><img src="img/list2.png" />招工信息</div>
                    <div class="left_tt2_d">
                        <div class="bq2"></div>
                        <div class="r2" onmouseover="this.style.cursor='pointer'" onclick="window.location.href='#'"><div class="dian"></div><span>这里是招工信息这里是招工信息这里是招工信息这里是招工信息</span></div>
                        <div class="r2" onmouseover="this.style.cursor='pointer'" onclick="window.location.href='#'"><div class="dian"></div><span>这里是招工信息</span></div>
                        <div class="r2" onmouseover="this.style.cursor='pointer'" onclick="window.location.href='#'"><div class="dian"></div><span>这里是招工信息</span></div>
                        <div class="r2" onmouseover="this.style.cursor='pointer'" onclick="window.location.href='#'"><div class="dian"></div><span>这里是招工信息</span></div>
                        <div class="r2" onmouseover="this.style.cursor='pointer'" onclick="window.location.href='#'"><div class="dian"></div><span>这里是招工信息</span></div>
                    </div>
                </div>
            </div>

            <div class="span8">
                <div class="leibie"><span>当前类别（只要小类，因为大类小类都是一样的）</span></div>

                <div class="liebiao">
                    <div class="m" onmouseover="this.style.cursor='pointer'" onclick="window.location.href='#'"><span class="mtitle">我是标题，我是标题，我是标题</span><span class="msj">2015-12-88</span></div>
                    <div class="m" onmouseover="this.style.cursor='pointer'" onclick="window.location.href='#'"><span class="mtitle">我是标题，我是标题，我是标题</span><span class="msj">2015-12-88</span></div>
                    <div class="m" onmouseover="this.style.cursor='pointer'" onclick="window.location.href='#'"><span class="mtitle">我是标题，我是标题，我是标题</span><span class="msj">2015-12-88</span></div>
                    <div class="m" onmouseover="this.style.cursor='pointer'" onclick="window.location.href='#'"><span class="mtitle">我是标题，我是标题，我是标题</span><span class="msj">2015-12-88</span></div>
                    <div class="m" onmouseover="this.style.cursor='pointer'" onclick="window.location.href='#'"><span class="mtitle">我是标题，我是标题，我是标题</span><span class="msj">2015-12-88</span></div>
                    <div class="m" onmouseover="this.style.cursor='pointer'" onclick="window.location.href='#'"><span class="mtitle">我是标题，我是标题，我是标题</span><span class="msj">2015-12-88</span></div>
                    <div class="m" onmouseover="this.style.cursor='pointer'" onclick="window.location.href='#'"><span class="mtitle">我是标题，我是标题，我是标题</span><span class="msj">2015-12-88</span></div>
                    <div class="m" onmouseover="this.style.cursor='pointer'" onclick="window.location.href='#'"><span class="mtitle">我是标题，我是标题，我是标题</span><span class="msj">2015-12-88</span></div>
                    <div class="m" onmouseover="this.style.cursor='pointer'" onclick="window.location.href='#'"><span class="mtitle">我是标题，我是标题，我是标题</span><span class="msj">2015-12-88</span></div>
                    <div class="m" onmouseover="this.style.cursor='pointer'" onclick="window.location.href='#'"><span class="mtitle">我是标题，我是标题，我是标题</span><span class="msj">2015-12-88</span></div>
                    <div class="m" onmouseover="this.style.cursor='pointer'" onclick="window.location.href='#'"><span class="mtitle">我是标题，我是标题，我是标题</span><span class="msj">2015-12-88</span></div>
                    <div class="m" onmouseover="this.style.cursor='pointer'" onclick="window.location.href='#'"><span class="mtitle">我是标题，我是标题，我是标题</span><span class="msj">2015-12-88</span></div>
                </div>

                <div class="fenye">
                    <div class="container-fluid">
                        <div class="row-fluid">
                            <div class="span12">
                                <div class="pagination">
                                    <ul>
                                        <li>
                                            <a href="#">上一页</a>
                                        </li>
                                        <li>
                                            <a href="#">1</a>
                                        </li>
                                        <li>
                                            <a href="#">2</a>
                                        </li>
                                        <li>
                                            <a href="#">3</a>
                                        </li>
                                        <li>
                                            <a href="#">4</a>
                                        </li>
                                        <li>
                                            <a href="#">5</a>
                                        </li>
                                        <li>
                                            <a href="#">下一页</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <uc1:web_foot runat="server" ID="web_foot" />
</body>
</html>
