<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="admin_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <script src="style/js/jquery-1.8.2.min.js"></script>
    <script src="style/js/bootstrap.min.js"></script>
    <script src="style/js/js.js"></script>
    <link href="style/css/bootstrap.min.css" rel="stylesheet" />
    <title>后台管理</title>

    <style type="text/css">

    </style>
</head>
<body>
    
    <div class="container-fluid" style="padding:0">
	<div class="row-fluid">
		<div class="span12">
			<div class="navbar navbar-inverse">
				<div class="navbar-inner" style="border-radius: 0;">
					<div class="container-fluid">
						 <a data-target=".navbar-responsive-collapse" data-toggle="collapse" class="btn btn-navbar"><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></a> <a  class="brand" style="color:white;font-weight:bold;">后台管理</a>
						<div class="nav-collapse collapse navbar-responsive-collapse">
							<ul class="nav">
								<li>
									<a href="news.aspx" target="center">新闻管理</a>
								</li>
								<li>
									<a href="ly.aspx" target="center">留言管理</a>
								</li>
								<%--<li>
									<a href="lawyer.aspx" target="center">律师管理</a>
								</li>--%>
							</ul>
							<ul class="nav pull-right">
								<li class="divider-vertical">
								</li>
								<li class="dropdown">
									 <a data-toggle="dropdown" class="dropdown-toggle" href="#"><em class="icon-user icon-white"></em><strong class="caret"></strong></a>
									<ul class="dropdown-menu">
										<li>
											<a href="cpw.aspx" target="center">修改密码</a>
										</li>
										<li>
											<a href="Default.aspx?out=1">安全退出</a>
										</li>
									</ul>
								</li>
							</ul>
						</div>
						
					</div>
				</div>
				
			</div>
		</div>
	</div>
	<div class="row-fluid">
		<div class="span12">
            <iframe name="center"  src="center.aspx" frameborder="none" border="0" style="width:100%; border:none;"   id="fc" onload="fh()"></iframe>
		</div>
	</div>
</div>

</body>
</html>
