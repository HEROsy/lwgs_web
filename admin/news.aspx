<%@ Page Language="C#" AutoEventWireup="true" CodeFile="news.aspx.cs" Inherits="admin_news" %>

<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <script src="style/js/jquery-1.8.2.min.js"></script>
    <script src="style/js/bootstrap.min.js"></script>
    <script src="style/js/js.js"></script>
    <link href="style/css/bootstrap.min.css" rel="stylesheet" />
    <title></title>

    <script type="text/javascript">

        var data_class = null;

        var tbody = null;

        var parentfram = null;//父框架
        var body = null;

        window.onload = function ()
        {
            Initbc();
            bindbc();
            document.getElementById("sc").onchange = function () { getdata(); }
            tbody = document.getElementById("tbody");
            getdata();
            parentfram = window.parent.document.getElementById("fc");
            body = document.getElementsByTagName("body")[0];
            
        }

        function Initbc()
        {
            var v = document.getElementById("bcvalue").value;
            data_class = eval("(" + v + ")");
        }

        function bindbc() {
            var bc = document.getElementById("bc");
            bc.length = 0;
            bc.options.add(new Option("请选择!", "-1"));
            for (var i = 0; i < data_class.length; i++) {
                if (data_class[i].type == "b") {
                    bc.options.add(new Option(decodeURIComponent(data_class[i].names), decodeURIComponent(data_class[i].id)));
                }
            }
            bc.onchange = function () {
                bindsc();
                getdata();
            }
        }

        function bindsc() {
            var bc = document.getElementById("bc");
            var sindex = bc.selectedIndex;
            var svalue = bc.options[sindex].value;

            var sc = document.getElementById("sc");
            sc.length = 0;
            sc.options.add(new Option("请选择!", "-1"));
            for (var i = 0; i < data_class.length; i++) {
                if (data_class[i].pid == svalue) {
                    sc.options.add(new Option(decodeURIComponent(data_class[i].names), decodeURIComponent(data_class[i].id)));
                }
            }
        }

        function getdata()
        {
            var bc=document.getElementById("bc");
            var sc = document.getElementById("sc");
            var bs = bc.options[bc.selectedIndex].value;
            var ss = sc.options[sc.selectedIndex].value;

            $.ajax({
                type: 'post',
                url: 'AsyCenter.aspx',
                data: {
                    aty: 'getnew',
                    bs: bs,
                    ss: ss
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

        function Inittimes(timestr)
        {
            return timestr.substr(0, timestr.indexOf(" "));
        }

        function getclassname(classdata,cid)
        {
            var r = "未获取";
            for (var i = 0; i < classdata.length; i++) {
                if(classdata[i].id==cid)
                {
                    r = decode(classdata[i].names);
                    break;
                }
            }
            return r;
        }

        function decode(str) {
            str = decodeURIComponent(str.replace(/\+/g, '%20'));
            return str;
        }

        function creatrow(md)
        {

            var a = "<table class='table table-hover'><thead><tr><th>新闻标题</th><th>所属分类</th><th>所属分类</th><th>发布时间</th><th>操作</th></tr></thead><tbody id='tbodybox'>";//</tbody></table>";

            var bn = "";
            var sn = "";
            var times = "";
            var classname = "";
            var tab = 0;
            var rowhtml = "";
            for (var i = 0; i < md.length; i++) {
                bn = getclassname(data_class, md[i].bclass);
                sn = getclassname(data_class, md[i].sclass);
                times = Inittimes(decode(md[i].fbtimes));
                tab = (i+5) % 5;
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
                rowhtml = aprow(decode(md[i].titles), bn, sn, times, decode(md[i].id), classname);
                a = a + rowhtml;
            }
            a = a + "</tbody></table>";
            document.getElementById("tablebox").innerHTML = a;
            upPFramHeight();
           
        }

        function aprow(titles, bc, sc, times, id, classname) {

            var inhtml = "<tr class='" + classname + "'  id='" + id + "'><td>" + titles + "</td>" +
                         "<td>" + bc + "</td>" +
                         "<td>" + sc + "</td>" +
                         "<td>" + times + "</td>" +
                         "<td><input type='button' value='删除' onclick=\"_delete('" + id + "','" + titles + "')\" /> &nbsp&nbsp<input type='button' value='修改' onclick='_update(\"" + id + "\")'/>" +
                         "</td>" +
                         "</tr>";
            return inhtml;
        }

        function _delete(did,title)
        {
            if (did=="") {
                return false;
            }
            if (confirm("确定要删除 "+title+" ？")) {
                $.ajax({
                    type: "post",
                    url: "AsyCenter.aspx",
                    data:{
                        aty: "deletenew",
                        did:did
                    },
                    success:function(data)
                    {
                        var r = data.split(":");
                        if (r[0] == "ok") {
                            alert("已删除！");
                            var dr = document.getElementById(did);
                            dr.style.display = "none";
                        } else {
                            alert("删除失败！");
                        }
                    },
                    error:function(data){
                    
                    }

                })
            }
        }

        function _update(uid)
        {
            if (uid=="") {
                return false;
            }
            window.location.href = "AUnew.aspx?uid="+uid;
        }

        function upPFramHeight()
        {
            var oh = parentfram.height;
            var bodyheight = body.clientHeight;
            if (parseInt(bodyheight) > parseInt(oh)) {
                parentfram.height = bodyheight + "px";
            }
        }

        function emptyrow()
        {
            var a = "<table class='table'><thead><tr><th>新闻标题</th><th>所属分类</th><th>所属分类</th><th>发布时间</th><th>操作</th></tr></thead><tbody id='tbodybox'>";//</tbody></table>";
            a = a + aprow("无内容...", "", "", "", "", "") + "</tbody></table>";
            document.getElementById("tablebox").innerHTML = a;
        }

    </script>
</head>
<body >
    
 <div class="container-fluid">
	<div class="row-fluid">
		<div class="span12">
			<div class="page-header">
				<h1>
					新闻管理
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
							<input type="button" class="btn" value="添加新闻" onclick="window.location.href='AUnew.aspx'"/>
						</div>
						<div class="span3">
							<div class="btn-group">
								 <select id="bc">
                                     <option value="-1">请选择!</option>
								 </select>
							</div>
						</div>
						<div class="span7">
							<div class="btn-group">
								<select id="sc">
                                     <option value="-1">请选择!</option>
								 </select>
							</div>
						</div>
					</div>
				</div>
			</div>
            <input type="hidden" value='<%=bcvalue %>' id="bcvalue" />
			<div class="row-fluid">
				<div class="span12">
                    <div id="tablebox">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>新闻标题
                                    </th>
                                    <th>所属分类
                                    </th>
                                    <th>所属分类
                                    </th>
                                    <th>发布时间
                                    </th>
                                    <th>操作
                                    </th>
                                </tr>
                            </thead>
                            <tbody id="tbodybox">
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
