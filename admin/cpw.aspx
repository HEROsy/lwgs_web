<%@ Page Language="C#" AutoEventWireup="true" CodeFile="cpw.aspx.cs" Inherits="admin_cpw" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <script src="style/js/jquery-1.8.2.min.js"></script>
    <script src="style/js/bootstrap.min.js"></script>
    <script src="style/js/js.js"></script>
    <link href="style/css/bootstrap.min.css" rel="stylesheet" />

    <script type="text/javascript">
        

        window.onload = function ()
        {
            document.getElementById("btn").onclick = function ()
            {
                send();
            }
        }

        function send()
        {
            var old = document.getElementById("old").value;
            var pw1 = document.getElementById("pw1").value;
            var pw2 = document.getElementById("pw2").value;

            //必填项
            if (old.replace(/\s+/g, "") == "") { alert("请输入旧密码！"); return false; }
            if (pw1.replace(/\s+/g, "") == "") { alert("请输入新密码！"); return false; }
            if (pw2.replace(/\s+/g, "") == "") { alert("请确认新密码！"); return false; }

            //只能数字
            if (pw1 != pw2) { alert("两次输入新密码不一样！"); return false; }

            $.ajax({
                type: "post",
                url: "AsyCenter.aspx",
                data: {
                    aty: "changepw",
                    old: old,
                    pw1: pw1,
                    pw2:pw2
                },
                success: function (data)
                {
                    var r = data.split(":");
                    if (r[0] == "ok") {
                        alert('修改完成！请重新登录');
                        window.parent.location.href = "Default.aspx";
                    } else {
                        alert('修改失败！旧密码不正确！');
                    }
                },
                error: function (data)
                {

                }
            })
        }

    </script>
</head>
<body>

    <div class="container-fluid">
        <div class="row-fluid">
            <div class="span4"></div>
            <div class="span4">
                <form>
                    <fieldset>
                        <legend>密码修改</legend>
                        <label>旧密码</label><input type="text" id="old" />
                        <label>新密码</label><input type="password" id="pw1"/>
                        <label>再次输入新密码</label><input type="password" id="pw2" />
                        <span class="help-block" id="msg"></span>
                        <button type="button" class="btn" id="btn">提交</button>
                    </fieldset>
                </form>
            </div>
            <div class="span4"></div>
        </div>
    </div>
    
</body>
</html>
