<%@ Page Language="C#" AutoEventWireup="true" CodeFile="web_liuyan.aspx.cs" Inherits="web_liuyan" %>

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
    <title>雅安市劳务有限公司-信访留言</title>
    <style type="text/css">
        ::-webkit-input-placeholder {
            font-family: "微软雅黑";
            letter-spacing: 1px;
        }

        ::-moz-placeholder {
            font-family: "微软雅黑";
            letter-spacing: 1px;
        }
        /* firefox 19+ */
        :-ms-input-placeholder {
            font-family: "微软雅黑";
            letter-spacing: 1px;
        }
        /* ie */
        input:-moz-placeholder {
            outline: none;
        }

        ::-webkit-input-focus {
            outline: none;
        }

        ::-moz-focus {
            outline: none;
        }
        /* firefox 19+ */
        :-ms-focus {
            outline: none;
        }

        input:focus {
            outline: none;
        }

        .back {
            background-image: url(img/liuyanleft.jpg);
            background-repeat: no-repeat;
            background-position: center 0px;
            filter: "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod='scale')";
            -moz-background-size: 100% 100%;
            background-size: 100% 100%;
            height: 512px;
        }

        #i1 {
            margin: 79px 0 0 65px;
            height: 30px;
            width: 265px;
            border: none;
        }

        #i2 {
            margin: 11px 0 0 65px;
            height: 30px;
            width: 265px;
            border: none;
        }

        #i3 {
            height: 30px;
            width: 265px;
            border: none;
            margin: 11px 0 0 64px;
            background-color: #F8ECEC;
        }

        #i4 {
            margin: 10px 0 0 36px;
            border: none;
            resize: none;
            width: 284px;
            height: 218px;
            background: transparent;
        }

        #i5 {
            display: block;
            width: 300px;
            height: 35px;
            margin: 12px 0 0 35px;
        }

        #i0 {
            position: absolute;
            margin: 33px 0 0 270px;
        }

        .nogk {
            position: absolute;
            margin: 29px 0 0 289px;
        }

        #warndiv {
            width: 290px;
            margin-left: 14px;
            margin-top: -27px;
            position: absolute;
            display: none;
        }

        .lytitle {
            height: 50px;
            background-color: #FFAEAE;
        }

            .lytitle span {
                line-height: 50px;
                display: block;
                color: #ffffff;
                margin-left: 10px;
                overflow: hidden;
                text-overflow: ellipsis;
                white-space: nowrap;
            }

        .t1 {
            line-height: 40px;
            width: 191px;
            display: block;
            float: left;
            margin-left: 10px;
        }

        .t2 {
            line-height: 40px;
            width: 213px;
            display: block;
            float: left;
            text-align: center;
        }

        .t3 {
            line-height: 40px;
            width: 159px;
            display: block;
            float: left;
            text-align: center;
        }

        .lyx {
            height: 40px;
        }
        a {
          color: #FFAEAE !important;
        }
    </style>

    <script type="text/javascript">
        //功能说明：
        //留言可勾选是否公开，如果公开那么后台回复后就在前台公开显示回复，否则不公开显示回复，只显示留言标题和内容。
        //每条留言标题和内容均显示在前台，用户自己可输入自己的电话号码来查看回复。(一旦勾选保密，电话号码必填)
        //后台不可更改是否公开留言 但后台可删除留言，也可看到当前留言的公开信息来决定是否回复，但不能设置公开与否。
        //留言成功弹出提示:"留言成功，请等待管理员回复，回复的留言才会显示。"
        window.onload = function () {

            $('#i1').focus(function () {
                $('#warndiv').css("display", "block");
                $('#warndiv').attr("class", "alert");
                $("#warnspan")[0].innerHTML = "请输入姓名";
            });
            $('#i1').blur(function () {
                $('#warndiv').css("display", "none")
            });

            $('#i2').focus(function () {
                $('#warndiv').css("display", "block");
                $('#warndiv').attr("class", "alert alert-success");
                $("#warnspan")[0].innerHTML = "请输入联系电话";
            });
            $('#i2').blur(function () {
                $('#warndiv').css("display", "none")
            });

            $('#i3').focus(function () {
                $('#warndiv').css("display", "block");
                $('#warndiv').attr("class", "alert alert-info");
                $("#warnspan")[0].innerHTML = "请输入留言标题";
            });
            $('#i3').blur(function () {
                $('#warndiv').css("display", "none")
            });

            $('#i4').focus(function () {
                $('#warndiv').css("display", "block");
                $('#warndiv').attr("class", "alert alert-error");
                $("#warnspan")[0].innerHTML = "请输入留言内容";
            });
            $('#i4').blur(function () {
                $('#warndiv').css("display", "none")
            });

            $('#i0').focus(function () {
                $('#warndiv').css("display", "block");
                $('#warndiv').css("width", "934px");
                $('#warndiv').attr("class", "alert alert-error");
                $("#warnspan")[0].innerHTML = "若您勾选了不公开，电话号码将作为您日后查看留言回复的密码！！请认真填写电话号码！否则将无法看到回复内容！";
            });
            $('#i0').blur(function () {
                $('#warndiv').css("width", "290px")
                $('#warndiv').css("display", "none")
            });
        }

    </script>
</head>

<body>
    <uc1:web_head runat="server" ID="web_head" />
    <div style="width: 1000px; margin: auto">
        <div class="alert" id="warndiv">
            <button type="button" class="close" data-dismiss="alert"></button>
            <strong>提示 ! </strong><span id="warnspan">这里是提示信息</span>
        </div>
        <div class="row-fluid" style="margin-top: 30px; margin-bottom: 30px;">
            <div class="span5 back">
                <input id="i0" type="checkbox" /><span class="nogk">不公开</span>
                <input id="i1" placeholder="请输入您的大名" onfocus="name(this);" />
                <input id="i2" placeholder="请输入您的联系电话" />
                <input id="i3" placeholder="请输入留言标题" />
                <textarea id="i4">请输入内容...</textarea>
                <span id="i5" onmouseover="this.style.cursor='pointer'" onclick="javascript:void(0)"></span>
            </div>
            <div class="span7">
                <div style="margin-top: 16px;">
                    <div class="lytitle"><span>(张三)：这里是留言的标题，标题！</span></div>
                    <div class="lyx"><span class="t1">留言时间：2015-11-22</span><span class="t2">当前状态：公开</span><span class="t3" onmouseover="this.style.cursor='pointer'" onclick="window.open(web_lyxx.aspx)">查看详细</span></div>
                </div>
                <div style="margin-top: 16px;">
                    <div class="lytitle"><span>(李四)：这里是留言的标题，标题！</span></div>
                    <div class="lyx"><span class="t1">留言时间：2015-11-22</span><span class="t2">当前状态：公开</span><span class="t3" onmouseover="this.style.cursor='pointer'" onclick="window.open(web_lyxx.aspx)">查看详细</span></div>
                </div>
                <div style="margin-top: 16px;">
                    <div class="lytitle"><span>(张三)：这里是留言的标题，标题！</span></div>
                    <div class="lyx"><span class="t1">留言时间：2015-11-22</span><span class="t2">当前状态：保密</span><span class="t3" onmouseover="this.style.cursor='pointer'" onclick="window.open(web_lyxx.aspx)">查看详细</span></div>
                </div>
                <div style="margin-top: 16px;">
                    <div class="lytitle"><span>(张三)：这里是留言的标题，标题！</span></div>
                    <div class="lyx"><span class="t1">留言时间：2015-11-22</span><span class="t2">当前状态：公开</span><span class="t3" onmouseover="this.style.cursor='pointer'" onclick="window.open(web_lyxx.aspx)">查看详细</span></div>
                </div>
                <div style="margin-top: 16px;text-align:right;margin-right: -19px;">
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
