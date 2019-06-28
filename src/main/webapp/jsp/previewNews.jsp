<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<title>图文素材管理</title>
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="referrer" content="never">
		<%--<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">--%>
		<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
		<link rel="stylesheet" href="../statics/plugins/layui/css/layui.css" media="all" />
		<!--页面导航栏小图标-->
		<link rel="icon" href="../statics/resource/images/favicon.ico" type="image/x-icon">
		<%
			String path = request.getContextPath();
			String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/";
			String newsID = request.getParameter("newsID");
		%>
		<style>
			
		</style>
	</head>

	<body style="margin-left: 15px;margin-top: 0px;background: #F0F0F0;width: 90%;">
		<div style="height: 50px;width: 100%;background-color: white;text-align: center">
			<h2 id="title">标题</h2>
		</div>
		<div id="infromation" style="height: 30px;width: 100%;background-color: white;">
			<div id="author" style="height: 30px;width: 30%;float: left;color:#CCCCCC; ">作者</div>
			<a href="javascript:;" onClick="parent.window.location.reload();" id="accountName" style="height: 30px;width: 40%;float: left;color:#191970;">公众号名字</a>
		<div id="createTime" style="height: 30px;width: 30%;float: left; color: #CCCCCC;">时间</div>
		</div>
		<div id="thumb" style="height: 200px;width: 100%;background-color: white;border: 1px solid black;">
			<img class="news-img" src="" style="width: 100%"; height="100%;" />
		</div>
		<div id="content" style="height: 150px;width: 100%;background-color: white;">
			图文内容
		</div>
		<%--<div class="layui-form-item" style=" text-align: center;width: 100%;margin-top: 20px;">--%>

			<%--<a href="./showNews.jsp" id="acncel" class="layui-btn layui-btn-normal">返回</a>--%>
		<%--</div>--%>
	</body>

	<script src="../statics/plugins/layui/layui.js" charset="utf-8"></script>
	<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
	<script>
		layui.use(['jquery', 'layedit', 'util','flow', 'layer'], function() {
				var layedit = layui.layedit;
				var $ = layui.jquery;
				var flow = layui.flow;
			var util= layui.util;
				var layer = layui.layer;
				var $news;
				var $div = document.getElementsByClassName("every-news");
				var newsID;

			$(function() {
				newsID =<%=newsID%>;
					$.ajax({
						url: '/Material/getNews',
						method: 'post',
						dataType: 'JSON',
						data: {
							id: newsID
						},
						success: function(res) {

							var filePath=res.thumb.imgURL;
							filePath=".."+filePath.substring(44,filePath.length);
							// filePath=".."+filePath;
							console.log(filePath);
							// filePath=filePath.substring(44,filePath.length);
							var time =util.toDateString(res.createTime);
							time=time.substring(0,10);
							$("#title").html(res.title);
							$(".news-img").attr('src',filePath);
							// $("#news-img").css("src",res.thumb.thumbURL);
							$("#author").html(res.author);
							$("#accountName").html(res.accountName);
							$("#content").html(res.content);
							$("#createTime").html(time);
							console.log(res);
						}
					});

			});
			});
	</script>

</html>