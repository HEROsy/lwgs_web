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
        /*通知公告：json_tzgg 字段：id,bclass,sclass,titles
       *招工信息：json_zgxx 字段：id,bclass,sclass,titles
       *类名：sclassname
       *分页内容获取：
       *　　　　请求地址：AsyCenter.aspx
       *        请求参数：type:'newspageData';sclass:'5';pagesize:'12';pageindex:页码
       *        返回json 数据字段：id,titles,fbtimes,bclass,sclass
       */
        var json_tzgg;
        var json_zgxx;
        var html;
        var pagebox;
        var pageindex;
        window.onload = function () {
            html = "";
            tzgg();
            zgxx();
            pagebox = document.getElementById("liebiao");
            GFyh(1);
            zx();
            }

        function decode(str) {
            str = decodeURIComponent(str.replace(/\+/g, '%20'));
            return str;
        }
        
        function tzgg() {
            //json_tzgg = document.getElementById("json_tz").value;
            var sel_id = document.getElementById("tzgg");
            try {
                var data = eval("(" + json_tzgg + ")");
            } catch (e) {

            }
            html = "";
            for (var i = 0; i < data.length; i++) {
                html = html + "<div class='r1' onmouseover='this.style.cursor='pointer'' onclick=window.location.href='web_newsshow.aspx?bid=" + decode(data[i].bclass) + "&sid=" + decode(data[i].sclass) + "&nid=" + decode(data[i].id) + "'>"
                          + "<div class='dian'></div><span>" + decode(data[i].titles) + "</span></div>";
            }
            sel_id.innerHTML = html;
        }

        function zgxx() {
            //json_zgxx = document.getElementById("json_zg").value;
            var sel_id = document.getElementById("zgxx");
            try {
                var data = eval("(" + json_zgxx + ")");
            } catch (e) {

            }
            html = "";
            for (var i = 0; i < data.length; i++) {
                html = html + "<div class='r2' onmouseover='this.style.cursor='pointer'' onclick=window.location.href='web_newsshow.aspx?bid=" + decode(data[i].bclass) + "&sid=" + decode(data[i].sclass) + "&nid=" + decode(data[i].id) + "'>"
                          + "<div class='dian'></div><span>" + decode(data[i].titles) + "</span></div>";
            }
            sel_id.innerHTML = html;
        }

        function wenben(id,bclass,sclass,titles,fbtimes) {
             var b = "<div class='m' onmouseover='this.style.cursor='pointer'' onclick=window.location.href='web_newsshow.aspx?bid=" + bclass + "&sid=" + sclass + "&nid=" + id + "'>"
             +"<span class='mtitle'>" + titles + "</span><span class='msj'>" + fbtimes + "</span></div>";
             return b;
        }

        function InitPages(pagebox, totalcount, pageindex) {
            pagebox.innerHTML = "";

            totalpage = parseInt(totalpage);
            pageindex = parseInt(pageindex);

            var totalpage = 0;
            var pagenum = 5;		//最多有几条页码条
            var pagesize = 12;		//一页最多现实几条数据
            if (parseInt(totalcount) < pagesize) {
                totalpage = 1;
            } else {
                if (parseInt(totalcount) % pagesize > 0) {
                    totalpage = parseInt(totalcount / pagesize) + 1;
                } else {
                    totalpage = parseInt(totalcount / pagesize)
                }
            }
            var middleindex = parseInt(pagenum / 2) + 1;
            var newobj = null;
            if (pageindex == 1) {
                newobj = Create("上页", "disabled");
                pagebox.appendChild(newobj);
            } else {
                newobj = Create("上页", "");
                pagebox.appendChild(newobj);
            }

            //if (pageindex == 1) {
            //    newobj = Create("第一页", "disabled");
            //    pagebox.appendChild(newobj);
            //} else {
            //    newobj = Create("第一页", "");
            //    pagebox.appendChild(newobj);
            //}

            if (totalpage < pagenum) {
                for (var i = 1; i < totalpage + 1; i++) {
                    if (i != pageindex) {
                        newobj = Create(i, "");
                        pagebox.appendChild(newobj);
                    } else {
                        newobj = Create(i, "active");
                        pagebox.appendChild(newobj);
                    }
                }
            } else {
                if (pageindex <= middleindex) {
                    for (var i = 1; i < pagenum + 1; i++) {
                        if (i != pageindex) {
                            newobj = Create(i, "");
                            pagebox.appendChild(newobj);
                        } else {
                            newobj = Create(i, "active");
                            pagebox.appendChild(newobj);
                        }
                    }
                } else {
                    var offsetindex = middleindex - 1;
                    var beginindex = pageindex - offsetindex;
                    var endindex = 0;
                    if (parseInt(pageindex) + offsetindex < totalpage) {
                        endindex = parseInt(pageindex) + offsetindex;
                    } else {
                        endindex = beginindex + (totalpage - beginindex);
                    }

                    for (var i = beginindex; i < endindex + 1; i++) {
                        if (i != pageindex) {
                            newobj = Create(i, "");
                            pagebox.appendChild(newobj);
                        } else {
                            newobj = Create(i, "active");
                            pagebox.appendChild(newobj);
                        }
                    }
                }
            }

            //if (parseInt(pageindex) >= totalpage) {
            //    newobj = Create("最后一页", "disabled");
            //    pagebox.appendChild(newobj);
            //} else {
            //    newobj = Create("最后一页", "");
            //    pagebox.appendChild(newobj);
            //}

            if (parseInt(pageindex) >= totalpage) {
                newobj = Create("下页", "disabled");
                pagebox.appendChild(newobj);
            } else {
                newobj = Create("下页", "");
                pagebox.appendChild(newobj);
            }


            function Create(inname, classtype) {
                var obj = null;
                var oli = document.createElement("li");
                var oa = document.createElement("a");

                if (classtype != "") { oli.className = classtype; }

                oa.innerHTML = inname;
                oa.href = "javascript:void(0)";
                if ((inname + "").indexOf("页") < 0) {
                    oa.style.width = 15 + "px";
                }
                oa.onclick = function () {
                    pageclick(oa);
                }
                oli.appendChild(oa);

                return oli;
            }

            function pageclick(sender) {
                var pe = sender.parentElement.className;
                if (pe == "disabled" || pe == "active") { return false; }
                var _value = sender.innerHTML;
                switch (_value) {
                    case "上页":
                        GFyh(pageindex - 1);
                        InitPages(pagebox, totalpage, pageindex - 1);
                        break;
                    case "下页":
                        GFyh(pageindex + 1);
                        InitPages(pagebox, totalpage, pageindex + 1);
                        break;
                    //case "第一页":
                    //    GetData(1);
                    //    InitPages(pagebox, totalpage, 1);
                    //    break;
                    //case "最后一页":
                    //    GetData(totalpage);
                    //    InitPages(pagebox, totalpage, totalpage);
                    //    break;
                    default:
                        GFyh(_value);
                        InitPages(pagebox, totalpage, _value);

                }
            }
        }

        function GFyh(pageindex) {
            $.ajax({
                type: "post",
                url: "AsyCenter.aspx",
                data: {
                    type: "newspageData",
                    sclass: "5",
                    pagesize: "12",
                    pageindex: pageindex
                },
                success: function (data) {
                    var json_wb = null;
                    try {
                        json_wb = eval("(" + data + ")");
                    } catch (e) {
                        document.getElementById("wenben").innerHTML = "";
                    }
                    html = "";
                    for (var i = 0; i < json_wb.length; i++) {
                        if(i==0){
                        } else {
                            html = html + wenben(decode(json_wb[i].id), decode(json_wb[i].bclass), decode(json_wb[i].sclass), decode(json_wb[i].fbtimes), decode(json_wb[i].titles));
                        }
                    }
                    document.getElementById("wenben").innerHTML = html;
                    InitPages(pagebox,json_wb[0].count, pageindex);
                },
                error: function () {

                }
            })
        }

    </script>
</head>

<body>
    <input type="hidden" id="json_tz" value="<%=json_tzgg %>" />;
    <input type="hidden" id="json_zg" value="<%=json_zgxx %>" />;
    <uc1:web_head runat="server" ID="web_head" />
    <div style="width: 1000px; margin: auto">
        <div class="row-fluid" style="margin-top: 20px">
            <div class="span4">
                <div> <%--最新通知列表--%>
                    <div class="left_tt1"><img src="img/list1.png" />通知公告</div>
                    <div class="left_tt1_d">
                        <div class="bq1"></div>
                        <div id="tzgg">

                        </div>
                    </div>
                </div>

                <div> <%--最新招工列表--%>
                    <div class="left_tt2"><img src="img/list2.png" />招工信息</div>
                    <div class="left_tt2_d">
                        <div class="bq2"></div>
                       <div id="zgxx">

                       </div>
                    </div>
                </div>
            </div>

            <div class="span8">
                <div class="leibie"><span>当前类别（只要小类，因为大类小类都是一样的）<%--<%=sclassname %>--%></span></div>

                <div class="liebiao" id="wenben">

                </div>

                <div class="fenye">
                    <div class="container-fluid">
                        <div class="row-fluid">
                            <div class="span12">
                                <div class="pagination">
                                    <ul id="liebiao">

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
