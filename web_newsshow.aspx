<%@ Page Language="C#" AutoEventWireup="true" CodeFile="web_newsshow.aspx.cs" Inherits="web_newsshow" %>

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
    <title>雅安市劳务有限公司(这里是文章标题不能包含" - ")</title>
    <style type="text/css">
        #maindiv {
            width: 1000px;
            margin: auto;
        }

        .sxpian {
            display: block !important;
            margin-top: 5px;
        }

        .showtitle {
            min-height: 35px;
            width: 1000px;
        }

            .showtitle span {
                line-height: 35px;
                font-size: 20px;
                letter-spacing: 2px;
                color: #F24D4D;
                font-weight: bold;
                width: 800px;
                display: block;
                margin-left: 100px;
                text-align: center;
            }

        a:hover {
            text-decoration: none !important;
        }

        a {
            letter-spacing: 2px !important;
        }

        li {
            letter-spacing: 2px !important;
        }

        .showtitle_sx {
            margin-top: -10px;
            height: 40px;
        }

        .sx1 {
            width: 700px;
            height: 30px;
            float: left;
        }

            .sx1 span {
                display: block;
                float: left;
                margin-left: 100px;
                line-height: 20px;
                letter-spacing: 1px;
                color: #8B8989;
            }

        .sx2 {
            width: 270px;
            float: left;
            margin-left: -15px;
        }

        .show_nr {
            font-family: 微软雅黑 !important;
            letter-spacing: 1px !important;
            width: 800px;
            margin: 20px 0 50px 100px;
            font-size: 16px;
            text-align: justify !important;
            min-height:105px;
        }

        .fxspan {
            width: 60px !important;
            line-height: 18px;
            display: block !important;
            float: left !important;
        }
    </style>

    <script type="text/javascript">

        window.onload = function () {
            bodyheight();
        }
        window.onresize = function () {
            bodyheight();
        }

        function bodyheight() {
            var llq_height;
            var body_height;
            llq_height = document.documentElement.clientHeight;
            body_height = llq_height - 323;
            document.getElementById("maindiv").style.minHeight = body_height + "px";
        }
    </script>
</head>

<body>
    <uc1:web_head runat="server" ID="web_head" />
    <div id="maindiv"> <%--注意看这页的title说明--%>
        <div class="row-fluid" style="margin-top: 10px">
            <div class="span12">
                <ul class="breadcrumb">
                    <li>
                        <a href="Default.aspx">首页</a> <span class="divider">/</span>
                    </li>
                    <li>
                        <a href="#">只有小类</a> <span class="divider">/</span>
                    </li>
                </ul>
            </div>
        </div>

        <div class="row-fluid" style="margin-top: 10px">
            <div class="span12">
                <div class="showtitle"><span>文章标题</span></div>
                <hr />
                <div class="showtitle_sx">
                    <div class="sx1"><span>发布时间：2015-12-11</span><span>发布者：网站管理员</span></div>
                    <div class="sx2">
                        <div class="bshare-custom">
                            <span class="fxspan">分享到：</span>
                            <a title="分享到QQ空间" class="bshare-qzone"></a>
                            <a title="分享到微信" class="bshare-weixin" href="javascript:void(0);"></a>
                            <a title="分享到腾讯微博" class="bshare-qqmb" href="javascript:void(0);"></a>
                            <a title="分享到QQ好友" class="bshare-qqim" href="javascript:void(0);"></a>
                            <a title="分享到新浪微博" class="bshare-sinaminiblog"></a>
                            <a title="更多平台" class="bshare-more bshare-more-icon more-style-addthis"></a>
                        </div>
                        <script type="text/javascript" charset="utf-8" src="http://static.bshare.cn/b/buttonLite.js#style=-1&amp;uuid=&amp;pophcol=3&amp;lang=zh"></script>
                        <script type="text/javascript" charset="utf-8" src="http://static.bshare.cn/b/bshareC0.js"></script>
                    </div>
                </div>
                <div class="show_nr">
                   这里是内容，这里是内容
                </div>
            </div>
        </div>

        <div class="row-fluid" style="margin-top: 10px">
            <div class="span12">
                <ul class="breadcrumb">
                    <li class="sxpian">
                        <span class="divider"><a href="#">上一篇： 文章标题</a></span>
                    </li>
                    <li class="sxpian">
                        <span class="divider"><a href="#">下一篇： 文章标题</a></span>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <uc1:web_foot runat="server" ID="web_foot" />
</body>
</html>
