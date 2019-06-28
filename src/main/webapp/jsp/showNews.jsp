<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<title>图文素材管理</title>
		<meta name="renderer" content="webkit">
		<meta name="referrer" content="never">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<link rel="stylesheet" href="../statics/plugins/layui/css/layui.css" media="all" />
		<!--页面导航栏小图标-->
		<link rel="icon" href="../statics/resource/images/favicon.ico" type="image/x-icon">
		<%
			String path = request.getContextPath();
			String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/";
		%>
		<style>
			.every-news {
				width: 300px;
				height: 300px;
				float: left;
				padding: 40px;
			}
			
			.news {
				background-color: white;
				float: left;
				display: inline-block;
				box-sizing: border-box;
				border: 1px solid gray;
			}
			
			.show-detail {
				width: 300px;
				height: 260px;
				position: relative;
			}
			
			.father-div-title {
				width: 100%;
				height: 40px;
				position: relative;
			}
			
			.title {
				width: 90%;
				height: 55%;
				font-size: 16px;
				position: absolute;
				top: 25%;
				left: 5%;
			}
			
			.grandfather-div-img {
				width: 100%;
				height: 180px;
				position: relative;
			}
			
			.father-div-img {
				width: 90%;
				height: 90%;
				position: absolute;
				top: 5%;
				left: 5%;
				border-right: 1px solid darkslategrey;
			}
			
			.news-img {
				width: 100%;
				height: 100%;
			}
			
			.news-img-error {
				width: 100%;
				height: 100%;
				font-size: 25px;
				color: grey;
				text-align: center;
			}
			
			.father-div-abstract {
				width: 100%;
				height: 40px;
				position: relative;
			}
			
			.abstract {
				width: 90%;
				height: 100%;
				font-size: 16px;
				position: absolute;
				left: 5%;
				border: 0px;
			}
			
			.preview {
				width: 100%;
				height: 100%;
				display: none;
				position: absolute;
				top: 0px;
				background-color: rgba(160, 160, 160, 0.5);
			}
			
			.preview-text {
				width: 30%;
				height: 30px;
				color: white;
				font-size: 18px;
				font-family: "微软雅黑";
				position: absolute;
				top: 40%;
				left: 35%;
			}
			
			.father-div-datetime {
				width: 100%;
				height: 40px;
				float: left;
			}
			
			.datetime {
				width: 65%;
				height: 100%;
				float: left;
				position: relative;
			}
			
			.datetime-text {
				width: 100%;
				height: 60%;
				font-size: 16px;
				position: absolute;
				top: 20%;
				left: 15px;
			}
			
			.send {
				width: 10%;
				height: 100%;
				position: relative;
				float: left;
			}
			
			.layui-icon-group {
				font-size: 20px;
				display: none;
				position: absolute;
				top: 25%;
				left: 15%;
			}
			
			.edit {
				width: 10%;
				height: 100%;
				position: relative;
				float: left;
			}
			
			.layui-icon-edit {
				font-size: 30px;
				display: none;
				position: absolute;
				top: 10%;
				left: 15%;
			}
			
			.delete {
				width: 10%;
				height: 100%;
				float: left;
				position: relative;
			}
			
			.layui-icon-delete {
				font-size: 30px;
				display: none;
				position: absolute;
				top: 10%;
				left: 15%;
			}
		</style>
	</head>

	<body>
		<div class="demoTable" style="margin-top: 10px ;margin-left: 10px">

			<blockquote class="layui-elem-quote">
				<div class="layui-inline">
					<input class="layui-input" onkeyup="this.value=this.value.replace(/^ +| +$/g,'')" name="search-name" id="search-name" autocomplete="off" placeholder="请输入图文名称">
				</div>
				<button id="search-btn" class="layui-btn layui-btn-normal"><i class="layui-icon">&#xe615;</i>  搜索</button>
				<%--<button class="layui-btn" style="float: right;margin-right: 40px" id="add-news" type="button"><i class="layui-icon layui-icon-add-1"></i>新建图文素材</button>--%>
				<a href="javascript:;" style="float: right;margin-right: 40px" id="add-news" class="layui-btn"><i class="layui-icon layui-icon-add-1"></i>新建图文素材</a>
			</blockquote>
		</div>
		<div style="padding: 20px; background-color: #F2F2F2;min-height: 485px;">

			<div class="layui-row layui-col-space15">
				<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
					<legend>图文素材，<span id="count">共（0</span>）条</legend>
				</fieldset>
				<div name='all-news' style="width: 90%; padding-left: 5%;" class="site-demo-flow" id="all-news">

				</div>
			</div>
		</div>

	</body>

	<script src="../statics/plugins/layui/layui.js" charset="utf-8"></script>
	<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
	<script>
		layui.use(['jquery', 'layedit','util', 'flow', 'layer'], function() {
			var layedit = layui.layedit;
			var $ = layui.jquery;
			var flow = layui.flow;
			 var util= layui.util;
			var layer = layui.layer;
			var $news;
			var $div = document.getElementsByClassName("every-news");
			var newsID;


			$(function() {
				$.ajax({
					url: '/Material/showNews',
					method: 'post',
					dataType: 'JSON',
					success: function(res) {
						$.each(res, function(i, item) {

							var time =util.toDateString(item.createTime);
							time=time.substring(0,10);

							if(item.thumb.thumbURL == "error") {
								$("#all-news").append('<div id="' + item.id + '" class="every-news"><div class="news"><div class="show-detail"><div class="father-div-title"><div id="title' + item.id + '" class="title">' + item.title + '</div></div><div class="grandfather-div-img"><div class="father-div-img"><span class="news-img-error">封面图片不存在，请重新添加</span></div></div><div class="father-div-abstract"><textarea class="abstract">' + item.digest + '</textarea></div><div id="preview' + item.id + '" class="preview"><div class="preview-text">预览文章</div></div></div><div class="father-div-datetime"><div class="datetime"><div id="datetime-text' + item.id + '" class="datetime-text">更新于 ' + time + '</div></div><div class="send"><li id="send-news' + item.id + '" class="layui-icon layui-icon-group"></li></div><div class="edit"><li id="edit-img' + item.id + '" class="layui-icon layui-icon-edit"></li></div><div class="delete"><li id="delete-img' + item.id + '" class="layui-icon layui-icon-delete"></li></div></div></div></div>');
							} else {
								$("#all-news").append('<div id="' + item.id + '" class="every-news"><div class="news"><div class="show-detail"><div class="father-div-title"><div id="title' + item.id + '" class="title">' + item.title + '</div></div><div class="grandfather-div-img"><div class="father-div-img"><img class="news-img" src="' + item.thumb.thumbURL + '" /></div></div><div class="father-div-abstract"> <textarea class="abstract">' + item.digest + '</textarea></div><div id="preview' + item.id + '" class="preview"><div class="preview-text">预览文章</div></div></div><div class="father-div-datetime"><div class="datetime"><div id="datetime-text' + item.id + '" class="datetime-text">更新于 ' + time + '</div></div><div class="send"><li id="send-news' + item.id + '" class="layui-icon layui-icon-group"></li></div><div class="edit"><li id="edit-img' + item.id + '" class="layui-icon layui-icon-edit"></li></div><div class="delete"><li id="delete-img' + item.id + '" class="layui-icon layui-icon-delete"></li></div></div></div></div>');
							}
									});
						$("#count").html('共（' + $div.length);
					}
				});
			});
			// 按屏加载图片
			flow.lazyimg({
				elem: '#all-news img'
			});

			$('#add-news').on('click', function(){
				var d = <%=session.getAttribute("accountSession")%>;
				if (d.length==0){
					layer.msg("请先添加公众号！");
				} else{
					window.location.href="./editNews.jsp?mark=add&newsID=0";

					// $.ajax({
					// 	url: '/Material/turnAddNews',
					// 	method: 'post',
					// 	dataType: 'JSON',
					// });
				}
			});

			$("#search-btn").click(function() {
				var searchNewsName = $("#search-name").val();
				var newsNum = 0;
				if('' != searchNewsName) {
					$(".every-news").css("display", "none");
					$.each($div, function(i) {
						var flag = -1;
						flag = ($(this).find(".title").html()).search(searchNewsName);
						if(flag != -1) {
							newsNum = newsNum + 1;
							$("#" + $div[i].id).css("display", "inline");
						}
					});
					$("#count").html('共找到（' + newsNum);
					newsNum = 0;
				} else {
					$(".every-news").css("display", "inline");
					$("#count").html('共（' + $div.length);
				}
			});
			$('#all-news').on('mouseover', ".every-news", function() {
				newsID = $(this).attr('id');
			});
			$('#all-news').on('mouseover', ".show-detail", function() {
				$('#preview' + newsID).css("display", "inline");
			});
			$('#all-news').on('mouseout', ".show-detail", function() {
				$('#preview' + newsID).css("display", "none");
			});
			$('#all-news').on('click',".preview", function() {
				layer.open({
					title:'群发图文消息',
					type: 2,
					area: ['320px', '480px'],
//                shadeClose: false,
//                maxmin: false,
					skin: 'layui-layer-rim', //加上边框
					content: './previewNews.jsp?newsID='+ newsID
				});
				// window.location.href = "./previewNews.jsp?newsID=" + newsID;
			});
			$('#all-news').on('mouseover', ".send", function() {
				$('#send-news' + newsID).css("display", "inline");
				layer.tips('群发', '#send-news' + newsID, {
					tips: [1, '#3595CC'],
					time: 500
				});
			});
			$('#all-news').on('mouseout', ".send", function() {
				$('#send-news' + newsID).css("display", "none");
			});
			$("#all-news").on('click', ".send", function() {
				layer.open({
					title:'群发图文消息',
					type: 2,
					area: ['600px', '430px'],
//                shadeClose: false,
//                maxmin: false,
					skin: 'layui-layer-rim', //加上边框
					content: './selectFans.jsp?messageId=' +newsID+'&messageType=news&mark=material'
				});
			});
			$('#all-news').on('mouseover', ".edit", function() {
				$('#edit-img' + newsID).css("display", "inline");
				layer.tips('编辑', '#edit-img' + newsID, {
					tips: [1, '#3595CC'],
					time: 500
				});
			});
			$('#all-news').on('mouseout', ".edit", function() {
				$('#edit-img' + newsID).css("display", "none");
			});
			$('#all-news').on('click', ".edit", function() {
				$.each($div, function(i, item) {
					if(newsID == item.id) {
						// $news=$div[i];
						// window.location.href="editNews.jsp";

						// console.log($news);
						window.location.href="./editNews.jsp?mark=edit&newsID=" + newsID;
						// window.location.href = "./editNews.jsp?mark=edit&newsID=" + newsID;
						// $.ajax({
						// 	url: '/Material/turnEditNews',
						// 	method: 'post',
						// 	dataType: 'JSON',
						// 	data: {
						// 		newsID: newsID,
						// 	}
						// });
					};
				});
			});
			$('#all-news').on('mouseover', ".delete", function() {
				$('#delete-img' + newsID).css("display", "inline");
				layer.tips('删除', '#delete-img' + newsID, {
					tips: [1, '#3595CC'],
					time: 500
				});
			});
			$('#all-news').on('mouseout', ".delete", function() {
				$('#delete-img' + newsID).css("display", "none");
			});
			$('#all-news').on('click', ".delete", function() {
				layer.confirm('真的删除行么', function(index) {
					$.ajax({
						url: '/Material/deleteNews',
						method: 'post',
						dataType: 'JSON',
						data: {
							id: newsID
						},
						beforeSend: function(input) {
							layer.load(0, { content: '删除中...' }); //上传loading
						},
						success: function(res) {
							layer.closeAll();
							if (res=="0"){
								window.location.reload();
								// $("#" + imageID).remove();
								// $div = document.getElementsByClassName("image");
								// $("#count").html('共（'+$div.length);
							} else {
								return layer.msg('删除失败，错误代码：'+res);
							}

						},
						error:function(res, index, upload) {
							layer.closeAll();
							return layer.msg('删除失败，请刷新页面重试！');
						}
					});
				});
				// $("#" +newsID).remove();
				// $div = document.getElementsByClassName("news");
				// $("#count").html('共（'+$div.length);
			});
		});
	</script>

</html>