<%@ Page Language="C#" AutoEventWireup="true" CodeFile="web_lyxx.aspx.cs" Inherits="web_lyxx" %>

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
    <title>留言详情</title>
    <style type="text/css">
        .xx {
            display:block;
            line-height: 30px;
        }
        div {
            font-family:"微软雅黑" !important;
            letter-spacing:1px !important;
        }
        .zy {
            font-weight:bold;
            color:#FB4D4C;
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
        <div class="row-fluid" style="margin-top: 30px;margin-bottom:30px; text-align:center;"> <%--如果有密码先显示这个--%>
           <span style="margin-right:10px;">请输入密码:（您留言时留下的电话号码）</span><input /><button class="btn-small btn-primary" style="margin-left:10px;margin-right:10px;">查看留言</button>
        </div>
        <div class="row-fluid" style="margin-top: 30px;margin-bottom:30px;min-height:500px;"> <%--如果没密码，或输入密码成功就显示这个--%>           
            <span class="xx zy">留言人姓名：XX</span>
            <span class="xx zy">留言标题：XXXXXXXXXXXXXXXXX</span>
            <span class="xx zy">留言内容：</span>
            <div class="xx">留言内容留言内容留言内容留言内容留言内容留言内容留言内容留言内容留言内容留言内容留言内容留言内容留言内容留言内容留言内容</div>
            <span class="xx zy">留言时间：2015-11-11</span>
            <span class="xx zy">管理员回复：</span>
            <div class="xx">管理员回复管理员回复管理员回复管理员回复管理员回复管理员回复管理员回复管理员回复管理员回复管理员回复管理员回复管理员回复管理员回复</div>
        </div>
    </div>
    <uc1:web_foot runat="server" ID="web_foot" />
</body>
</html>
