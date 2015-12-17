<%@ Control Language="C#" AutoEventWireup="true" CodeFile="web_head.ascx.cs" Inherits="web_head" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="css/swkj.css" rel="stylesheet" />
    <link href="css/swkjbt.css" rel="stylesheet" />
    <script src="js/jquery-1.8.2.min.js"></script>
    <script src="js/swkj.js"></script>
    <title>fff</title>
    <style type="text/css">
        span {
            font-family:"微软雅黑";
            letter-spacing:2px;
        }
        .top_main {
            width:100%;
            height:60px;
            background-color:#303030;
        }
        .hang {
            display:block;
            float:left;
        }
        .swkjh1 {
            font-size:20px;
        }
        .swkjh2 {
            font-size:16px;
        }
        .top_span_1 {
            letter-spacing: 5px;
            width: 190px !important;
            margin-left: 22px !important;
            color: #ffffff;
            font-weight: bold;
            line-height: 60px;
        }
        .top_span_2 {
            width:82px !important;
            color:#dfdfdf;
            line-height:60px;
            text-align:center;
        }
            .top_span_2:hover {
                background-color: #FB4D4C;
                transition: background-color 0.1s linear;
                -moz-transition: background-color 0.1s linear;
                -webkit-transition: background-color 0.1s linear;
                -o-transition: background-color 0.1s linear;
                color: #ffffff;
            }
        .top_span_3 {
            clear: both;
            display: block;
            text-align: center;
            width: 100%;
            color: #919191;
            margin-top: 10px;
            margin-left:0px !important;
        }
    </style>

    <script type="text/javascript">

    </script>
</head>
<body>
    <div class="top_main">
        <div class="row-fluid" style="width: 1000px; margin: auto;">
            <div class="span4">
                <img src="img/web_logo.jpg" class="hang" /><span class="top_span_1 hang swkjh2">雅安市劳务有限公司</span></div>
            <div class="span8">
                <span class="top_span_2 hang" onmouseover="this.style.cursor='pointer'" onclick="window.location.href='#'">回到首页</span>
                <span class="top_span_2 hang" onmouseover="this.style.cursor='pointer'" onclick="window.location.href='#'">关于我们</span>
                <span class="top_span_2 hang" onmouseover="this.style.cursor='pointer'" onclick="window.location.href='#'">通知公告</span>
                <span class="top_span_2 hang" onmouseover="this.style.cursor='pointer'" onclick="window.location.href='#'">招工信息</span>
                <span class="top_span_2 hang" onmouseover="this.style.cursor='pointer'" onclick="window.location.href='#'">法律法规</span>
                <span class="top_span_2 hang" onmouseover="this.style.cursor='pointer'" onclick="window.location.href='#'">表格下载</span>
                <span class="top_span_2 hang" onmouseover="this.style.cursor='pointer'" onclick="window.location.href='#'">信访留言</span>
            </div>
        </div>
    </div>
    <div style="width:100%;height:102px;border-bottom:1px solid #dfdfdf"><span class="top_span_3">雅安市劳务有限公司，国有独资公司，专业从事境内劳务派遣业务。</span></div>
</body>
</html>