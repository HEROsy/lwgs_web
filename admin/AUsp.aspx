<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AUsp.aspx.cs" Inherits="admin_AUsws" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <script src="style/js/jquery-1.8.2.min.js"></script>
    <script src="style/js/jquery.form.js"></script>
    <script src="style/js/bootstrap.min.js"></script>
    <script src="style/js/js.js"></script>
    <link href="style/css/bootstrap.min.css" rel="stylesheet" />
     <script type="text/javascript">
         var upok = true;
         var upok1 = true;
         var finnish = false;
         var finnish1 = false;


         var ssp = null;
         var bsp = null;

         var st = null;
         var bt = null;

         window.onload = function ()
         {
             bindupchange();
             bindsend();
             ssp = document.getElementById("smallsp");
             bsp = document.getElementById("bigsp");
             InitUp();
         }

         function InitUp()
         {
             var a = document.getElementById("ufname").value;
             var b = document.getElementById("ufname1").value;

             if (a != "") {
                 finnish = true;
                 ssp.value = "已上传！";
             }

             if (b != "") {
                 finnish1 = true;
                 bsp.value = "已上传！";
             }
         }

         function pro_s()
         {
             var a = ssp.value;
             if (a == "") {
                 ssp.value = "文件上传中，请等待";
             } else {
                 if (a.length > 14) {
                     ssp.value = "文件上传中，请等待";
                 } else {
                     ssp.value = a + ".";
                 }
             }
             st=setTimeout("pro_s()", 1000);
         }

         function pro_b() {
             var a = bsp.value;
             if (a == "") {
                 bsp.value = "文件上传中，请等待";
             } else {
                 if (a.length > 14) {
                     bsp.value = "文件上传中，请等待";
                 } else {
                     bsp.value = a + ".";
                 }
             }
             bt = setTimeout("pro_b()", 1000);
         }
        
         function bindupchange() {
             var uf = document.getElementById("upfile");
             uf.onchange = function () {
                 if (!upok) { alert('上传中,请稍候...'); return false; }
                 if (finnish) { alert('请勿重复上传...'); return false;}
                 upok = false;
                 pro_s();
                 $("#ufrm").ajaxSubmit({
                     url: "ReceivFile.ashx",
                     type: "post",
                     success: function (data) {
                         data = data.replace("<PRE>", "").replace("</PRE>", "");
                         data = data.replace("<pre>", "").replace("</pre>", "");
                         var r = data.split(":");
                         if (r[0] == "no") {
                             alert(r[1]);
                             upok = true;
                             if (st!=null) {
                                 clearTimeout(st);
                             }
                             return false;
                         } else if (r[0] == "ok") {
                             document.getElementById("ufname").value = r[1];
                             if (document.getElementById("ufname1").value.replace(/\s+/g, "") == "") {
                                 document.getElementById("ufname1").value = r[1];
                             }
                             if (st != null) {
                                 clearTimeout(st);
                             }
                             ssp.value = "已上传！";
                             finnish = true;
                             document.getElementById("upbtn").disabled = true;
                             upok = true;
                             finnish = true;
                             return true;
                         }
                     },
                     erorr: function (data) {
                     }
                 })
             }


             var uf1 = document.getElementById("upfile1");
             uf1.onchange = function () {
                 if (!upok1) { alert('上传中,请稍候...'); return false; }
                 if (finnish1) { alert('请勿重复上传...'); return false; }
                 upok1 = false;
                 pro_b();
                 $("#ufrm1").ajaxSubmit({
                     url: "ReceivFile.ashx",
                     type: "post",
                     success: function (data) {
                         data = data.replace("<PRE>", "").replace("</PRE>", "");
                         data = data.replace("<pre>", "").replace("</pre>", "");
                         var r = data.split(":");
                         if (r[0] == "no") {
                             alert(r[1]);
                             if (bt!=null) {
                                 clearTimeout(bt);
                             }
                             upok1 = true;
                             return false;
                         } else if (r[0] == "ok") {
                             document.getElementById("ufname1").value = r[1];
                             var b = null;
                             if (b = document.getElementById("ufname").value.replace(/\s+/g, "") == "") {
                                 document.getElementById("ufname").value = r[1];
                             }
                             if (bt != null) {
                                 clearTimeout(bt);
                             }
                             bsp.value = "已上传!";
                             finnish1 = true;
                             document.getElementById("upbtn1").disabled = true;
                             upok1 = true;
                             finnish1 = true;
                             return true;
                         }
                     },
                     erorr: function (data) {
                     }
                 })
             }
         }

         function GetQueryString(name) {
             var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
             var r = window.location.search.substr(1).match(reg);
             if (r != null) return unescape(r[2]); return null;
         }

         function bindsend() {
             var btn = document.getElementById("send");
             btn.onclick = function () {
                 var spid = GetQueryString("spid");
                 if (spid==null) {
                     if (upok == false || upok1 == false) {
                         alert("文件上传中，请稍候！");
                         return false;
                     }
                 }

                 var name = document.getElementById("name").value;
                 var dis = document.getElementById("isshow").checked;
                 var sfilename = document.getElementById("ufname").value;
                 var bfilename = document.getElementById("ufname1").value;

                 //必填项
                 if (name.replace(/\s+/g, "") == "") { alert("请输入名称！"); return false; }
                 if (sfilename.replace(/\s+/g, "") == "" && bfilename.replace(/\s+/g, "") == "") { alert("请至少传入一种视频版本"); return false; }

                
                 var spid=GetQueryString("spid");
                 var _aty="";
                 if (spid==null) {
                     _aty="addsp";
                 }else
                 {
                     _aty="upsp";
                 }
                 $.ajax({
                     type: "post",
                     url: "AsyCenter.aspx",
                     data: {
                         aty:_aty,
                         name: name,
                         dis:dis,
                         sfilename:sfilename,
                         bfilename:bfilename,
                         spid:spid
                     },
                     success: function (data)
                     {
                         var r = data.split(":");
                         if (r[0] == "ok") {
                             alert("操作成功！");
                             window.location.reload();
                         } else {
                             alert("操作失败！");
                         }
                     },
                     error: function (data)
                     {

                     }
                 })
             }
         }

    </script>
</head>
<body>

    <div class="container-fluid">
        <div class="row-fluid">
            <div class="span12">
                <div class="page-header">
                    <h1>
                        <%=PageHead %>
                    </h1>
                </div>
            </div>
        </div>
    </div>

    <div class="container">

        <div class="row">
            <div class="span6">
                <label>视频名称</label><input type="text" id="name" value="<%=name %>" />
                <div class="row">
                    <div class="span12" style="padding: 31px 0">
                        <label style="float: left">首页显示</label><input type="checkbox" name="ishow" id="isshow" <%=ischecked %> style="float: left; margin-left: 20px" />
                    </div>
                </div>

                <div class="row">
                    <div class="span12" style="padding: 5px 0">
                        <label style="float:left;line-height:34px;">视频小尺寸版本：</label>
                        <input type="text" readonly="true" id="smallsp" style="float:left;margin:0 11px"/>
                        <form method="post" id="ufrm" style="width: 126px; height: 30px; display: block; overflow: hidden; position: relative;float:left;">
                            <input type="button" value="上传" id="upbtn" class="btn" style="width: 126px; height: 30px;" />
                            <input type="file" name="upfile" id="upfile" style="width: 126px; height: 30px; position: absolute; top: 0; left: 0; opacity: 0; filter: alpha(opacity=0);" />
                            <input type="hidden" id="ufname" value="<%=sfilepath %>" />
                        </form>
                    </div>
                </div>


                <div class="row">
                    <div class="span12" style="padding: 5px 0">
                        <label style="float:left;line-height:34px;">视频大尺寸版本：</label>
                        <input type="text" readonly="true" id="bigsp" style="float:left;margin:0 11px"/>
                        <form method="post" id="ufrm1" style="width: 126px; height: 30px; display: block; overflow: hidden; position: relative;float:left;">
                            <input type="button" value="上传" id="upbtn1" class="btn" style="width: 126px; height: 30px;" />
                            <input type="file" name="upfile" id="upfile1" style="width: 126px; height: 30px; position: absolute; top: 0; left: 0; opacity: 0; filter: alpha(opacity=0);" />
                            <input type="hidden" id="ufname1" value="<%=bfilepath %>" />
                        </form>
                    </div>
                </div>

                <div class="row">
                    <div class="span12">
                        <input type="button" id="send" value="<%=BtnValue %>" style="margin-top:15px" />
                    </div>
                </div>

            </div>
        </div>
    </div>

</body>
</html>
