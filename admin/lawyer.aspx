<%@ Page Language="C#" AutoEventWireup="true" CodeFile="lawyer.aspx.cs" Inherits="admin_news" %>

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

        var data_dw = null;

        var parentfram = null;

        var body = null;

        window.onload = function () {
            body = document.getElementsByTagName("body")[0];
            parentfram = window.parent.document.getElementById("fc");
            bindbc();
            getdata("-1");
        }

        function bindbc() {
            var data_classstr = document.getElementById("classvalue").value;
            try {
                data_dw = eval("(" + data_classstr + ")");
            } catch (e) {
                return false;
            }
            var bc = document.getElementById("sws");
            bc.length = 0;
            bc.options.add(new Option("请选择!", "-1"));
            for (var i = 0; i < data_dw.length; i++) {
                bc.options.add(new Option(decodeURIComponent(data_dw[i].names), decodeURIComponent(data_dw[i].id)));
            }
            bc.onchange = function () {
                var dwid = bc.options[bc.selectedIndex].value;
                getdata(dwid);
            }
        }

        function getdata(dw) {
            $.ajax({
                type: 'post',
                url: 'AsyCenter.aspx',
                data: {
                    aty: 'getlawyer',
                    swsid:dw
                },
                success: function (data) {
                    var md = null;
                    try {
                        md = eval("(" + data + ")");
                    } catch (e) {
                        emptyrow();
                        return false;
                    }
                    creatrow(md);
                }
            })
        }

        function emptyrow() {
            var a = "<table class='table'><thead><tr><th>姓名</th><th>所属单位</th><th>排序</th><th>操作</th></tr></thead><tbody id='tbodybox'>";//</tbody></table>";
            a = a + "<td>无内容...</td><td></td><td></td><td></td>" + "</tbody></table>";
            document.getElementById("tablebox").innerHTML = a;
        }

        function getclassname(classdata, cid) {
            var r = "未获取";
            for (var i = 0; i < classdata.length; i++) {
                if (classdata[i].id == cid) {
                    r = decode(classdata[i].names);
                    break;
                }
            }
            return r;
        }

        function creatrow(md) {

            var a = "<table class='table table-hover'><thead><tr><th>姓名</th><th>所属单位</th><th>排序</th><th>操作</th></tr></thead><tbody id='tbodybox'>";//</tbody></table>";

            var name = "";
            var dw = "";
            var px = "";
            var id = "";
            var tab = 0;
            var rowhtml = "";
            for (var i = 0; i < md.length; i++) {
                dw = getclassname(data_dw, md[i].pid);
                name = decode(md[i].names);
                px = md[i].px;
                id = md[i].id;


                tab = (i + 5) % 5;
                switch (tab) {
                    case 0:
                        classname = "";
                        break;
                    case 1:
                        classname = "success";
                        break;
                    case 2:
                        classname = "warning";
                        break;
                    case 3:
                        classname = "error";
                        break;
                    case 4:
                        classname = "info";
                        break;
                    default: classname = "";

                }
                rowhtml = aprow(name,dw,px,id,classname);
                a = a + rowhtml;
            }
            a = a + "</tbody></table>";
            document.getElementById("tablebox").innerHTML = a;
            upPFramHeight();

        }

        function decode(str) {
            str = decodeURIComponent(str.replace(/\+/g, '%20'));
            return str;
        }

        function aprow(name, dw, px ,id, classname) {

            var inhtml = "<tr class='" + classname + "' id='" + id + "'><td>" + name + "</td>" +
                         "<td>" + dw + "</td>" +
                         "<td>" + px + "</td>" +
                         "<td><input type='button' value='删除' onclick=\"_delete('" + id + "','" + name + "')\" /> &nbsp&nbsp<input type='button' value='修改' onclick='_update(\"" + id + "\")'/>" +
                         "</td>" +
                         "</tr>";
            return inhtml;
        }

        function upPFramHeight() {
            var oh = parentfram.height;
            var bodyheight = body.clientHeight;
            if (parseInt(bodyheight) > parseInt(oh)) {
                parentfram.height = bodyheight + "px";
            }
        }

        function _delete(did, title) {
            if (did == "") {
                return false;
            }
            if (confirm("确定要删除 " + title + " ？")) {
                $.ajax({
                    type: "post",
                    url: "AsyCenter.aspx",
                    data: {
                        aty: "deletelawyer",
                        did: did
                    },
                    success: function (data) {
                        var r = data.split(":");
                        if (r[0] == "ok") {
                            alert("已删除！");
                            var dr = document.getElementById(did);
                            dr.style.display = "none";
                        } else {
                            alert("删除失败！");
                        }
                    },
                    error: function (data) {

                    }

                })
            }
        }

        function _update(uid) {
            if (uid == "") {
                return false;
            }
            window.location.href = "AUlawyer.aspx?uid=" + uid;
        }

    </script>
</head>
<body>
    
    <div class="container-fluid">
	<div class="row-fluid">
		<div class="span12">
			<div class="page-header">
				<h1>
					律师管理
				</h1>
			</div>
		</div>
	</div>

	<div class="row-fluid">
		<div class="span12">
			<div class="row-fluid">
				<div class="span12">
					<div class="row-fluid">
						<div class="span2">
							<input type="button" class="btn" value="添加律师" onclick="window.location.href = 'AUlawyer.aspx'"/>
						</div>
						<div class="span2">
                            <select id="sws">
                                <option value="-1">请选择！</option>
                            </select>
                            <input type="hidden" id="classvalue" value='<%=classvalue %>' />
						</div>
						<div class="span8">
						</div>
					</div>
				</div>
			</div>
			<div class="row-fluid">
				<div class="span12">
                    <div id="tablebox">
                        <table class="table">
                            <thead>
                                
                            </thead>
                            <tbody>
                              
                            </tbody>
                        </table>
                    </div>
				</div>
			</div>
		</div>
	</div>
</div>

</body>
</html>
