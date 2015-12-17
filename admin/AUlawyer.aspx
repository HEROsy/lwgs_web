<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AUlawyer.aspx.cs" Inherits="admin_AUsws" %>

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
         window.onload = function ()
         {
             bindupchange();
             bindbc();
             bindsend();
             InitSelectandimg();
         }

         function InitSelectandimg()
         {
             var uid = GetQueryString("uid");
             if (uid!=null) {
                 var sv = document.getElementById("ssws").value;
                 var ssws = document.getElementById("dw");
                 for (var i = 0; i < ssws.options.length; i++) {
                     if (ssws.options[i].value==sv) {
                         ssws.options[i].selected = true;
                         break;
                     }
                 }

                 var img = document.getElementById("ufname").value;
                 if (img!="") {

                 document.getElementById("preimg").src = "../img/upload/" + img;;
                 }
             }
         }
        
         function bindupchange() {
             var uf = document.getElementById("upfile");
             uf.onchange = function () {
                 if (!upok) { alert('正在上传...'); return false; }
                 upok = false;
                 $("#ufrm").ajaxSubmit({
                     url: "ReceivFile.ashx",
                     type: "post",
                     success: function (data) {
                         data = data.replace("<PRE>", "").replace("</PRE>", "");
                         var r = data.split(":");
                         if (r[0] == "no") {
                             alert(r[1]);
                             upok = true;
                             return false;
                         } else if (r[0] == "ok") {
                             document.getElementById("ufname").value = r[1];
                             document.getElementById("preimg").src = "../img/upload/" + r[1];
                             upok = true;
                             return true;
                         }
                     },
                     erorr: function (data) {
                     }
                 })
             }
         }

         function bindbc() {
             var data_classstr = document.getElementById("swsvalue").value;
             var data_class = null;
             try {
                 data_class = eval("(" + data_classstr + ")");
             } catch (e) {
                 return false;
             }

             var bc = document.getElementById("dw");
             bc.length = 0;
             bc.options.add(new Option("请选择!", "-1"));
             for (var i = 0; i < data_class.length; i++) {
                 bc.options.add(new Option(decodeURIComponent(data_class[i].names), decodeURIComponent(data_class[i].id)));
             }
         }

         function bindsend() {
             var btn = document.getElementById("send");
             btn.onclick = function () {
                 var name = document.getElementById("name").value;
                 var pic = document.getElementById("ufname").value;
                 var dw = document.getElementById("dw");
                 var dw_value = dw.options[dw.selectedIndex].value;
                 var px = document.getElementById("px").value;
                 var contents = document.getElementById("ebox").value;

                 //必填项
                 if (name.replace(/\s+/g, "") == "") { alert("请输入姓名！"); return false; }
                 if (dw_value == "-1") { alert('请选择分类！'); return false; }
                 if (contents.replace(/\s+/g, "") == "") { alert("请输入正文内容！"); return false; }
                 //只能数字
                 if (!/^[0-9]*$/.test(px)) { alert("排序只能是数字且整数！"); return false; }


                 var uid = GetQueryString("uid");
                 var _aty = "";
                 if (uid == null) {
                     _aty = "addlawyer";
                 } else {
                     _aty = "uplawyer";
                 }


                 btn.disabled = true;
                 $.ajax({
                     type: 'post',
                     url: 'AsyCenter.aspx',
                     data: {
                         aty: _aty,
                         name:name,
                         dw: dw_value,
                         px:px,
                         pic: pic,
                         contents: contents,
                         uid: uid
                     },
                     success: function (data) {
                         var r = data.split(":");
                         if (r[0] == "ok") {
                             alert('操作完成');
                             window.location.reload();
                         } else {
                             alert('操作失败');
                             btn.disabled = false;
                         }
                     }
                 })
             }
         }

         function GetQueryString(name) {
             var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
             var r = window.location.search.substr(1).match(reg);
             if (r != null) return unescape(r[2]); return null;
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
            <div class="span1"></div>
            <div class="span5">
                <label>律师名字</label><input type="text" id="name" value="<%=name %>" />
                <label>所属单位</label><select id="dw"></select>
                <input type="hidden" id="swsvalue" value='<%=swsvalue %>' />
                <input type="hidden" id="ssws" value="<%=dw %>" />
                <label>排序</label><input type="text" id="px" value="<%=px %>"/>
                <label>照片</label>
                <form method="post" id="ufrm" style="width: 126px; height: 30px; display: block; overflow: hidden; position: relative;">
                    <input type="button" value="上传" id="upbtn" class="btn" style="width: 126px; height: 30px;" />
                    <input type="file" name="upfile" id="upfile" style="width: 126px; height: 30px; position: absolute; top: 0; left: 0; opacity: 0; filter: alpha(opacity=0);" />
                    <input type="hidden" id="ufname" value="<%=pic %>" />
                </form>
            </div>
            <div class="span5">
                <img src="style/img/notjing.jpg" style="margin:auto;width:160px;height:200px;" id="preimg"/>
            </div>
            <div class="span1"></div>
        </div>
        <div class="row">
            <div class="span1"></div>
            <div class="span10">
                <label>律师介绍</label>
                <textarea id="ebox" style="width: 636px; height: 300px;resize:none"><%=contents %></textarea>
                <input type="button" value="<%=BtnValue %>" id="send" style="margin-top: 20px;display:block;" />
            </div>
            <div class="span1"></div>
        </div>
    </div>

</body>
</html>
