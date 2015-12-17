<%@ Page Language="C#" %>

<!DOCTYPE html>
<script runat="server">


    _BLL bll;
    protected void Page_Load(Object sender,EventArgs e)
    {
        if (bll == null) { bll = new _BLL(); }
        if (!IsPostBack)
         {
             
         }
        AsyCheck();
    }

    private void AsyCheck()
    {
        if (Request["type"] == "ajax")
        {
            String uname, upw;

            uname = Request.Form["un"];
            upw = Request.Form["upw"];

            System.Data.DataTable dt = bll.AdminLogin(uname, upw);

            if (dt != null)
            {
                if (dt.Rows.Count > 0)
                {
                    Session["adminid"] = dt.Rows[0]["id"].ToString();
                    Response.Write("ok:Default.aspx");
                    Response.End();
                }
                else
                {
                    Response.Write("no:用户名或密码错误！");
                    Response.End();
                }

            }
            else
            {
                Response.Write("no:用户名或密码错误！");
                Response.End();
            }

        }
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
   <script src="style/js/jquery-1.8.2.min.js"></script>
    <script src="style/js/bootstrap.min.js"></script>
    <script src="style/js/js.js"></script>
    <link href="style/css/bootstrap.min.css" rel="stylesheet" />
    <title></title>
    <script type="text/javascript">
        function check()
        {
            var un = document.getElementById("un").value; 
            var up = document.getElementById("pw").value; 
            //var memberme = document.getElementById("memberme").value;

            if (un.replace(/\s+/g,"") =="") {
                 return false;
            }
            else if (up.replace(/\s+/g,"")=="") {
                 return false;
            }
            return true;
        }

        document.onkeydown = function (event_e) {
            if (window.event) {
                event_e = window.event;
            }

            var int_keycode = event_e.charCode || event_e.keyCode;
            if (int_keycode == '13') {
                document.getElementById("btn").click();
            }
        }

        $(function () {
            $("#btn").click(function () {
                if (!check()) {
                    return false;
                }
                $.ajax({
                    type: "Post",
                    url: "login.aspx",
                    data: {
                        type: 'ajax',
                        un: $("#un").val(),
                        upw: $("#pw").val(),
                    },
                    success: function (data) {
                        var msg = data.split(':');
                        if (msg[0] == "no") {
                            if (msg[1].indexOf("非法字符")>-1) {
                                alert("用户名或密码错误！");
                            } else
                            {
                              alert(msg[1]);
                            }
                        }
                        else if(msg[0]=="ok")
                        {
                            window.location.href = msg[1];
                        }
                        else
                        {
                            alert("未知错误！");
                        }
                    },
                    error: function (data) {

                    }
                });
            });
        }); //jquery结束  

    </script>
</head>
<body style="width: 100%; height: 100%; background-size: auto 660px;  background-repeat: no-repeat; background-position-x: center; background-position-y: top">

  

    <div style="width:600px;height:300px;margin:180px auto 0 auto;">
        <form class="form-horizontal">
            <div class="control-group">
                <label class="control-label" for="inputEmail">用户名</label>
                <div class="controls">
                    <input id="un" type="text" />
                </div>
            </div>
            <div class="control-group">
                <label class="control-label" for="inputPassword">密码</label>
                <div class="controls">
                    <input id="pw" type="password" />
                </div>
            </div>
            <div class="control-group">
                <div class="controls">
                    <%--<label class="checkbox">
                        <input type="checkbox" />
                        Remember me</label>--%>
                    <input type="button" id="btn" value="登录" />
                </div>
            </div>
        </form>
    </div>

</body>
</html>
