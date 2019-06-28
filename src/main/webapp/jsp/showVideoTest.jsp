<%--
  Created by IntelliJ IDEA.
  User: Shio
  Date: 2018/7/2
  Time: 15:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<title>视频管理</title>
		<meta name="renderer" content="webkit">
		<meta name="referrer" content="never">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<link rel="stylesheet" href="../statics/plugins/layui/css/layui.css" media="all" />
		<!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
		<%
			String path = request.getContextPath();
			String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/";
		%>
		<style>
			.video {
				float: left;
				display: inline-block;
				box-sizing: border-box;
				margin-top: 20px;
				padding: 10px;
				min-width: 300px;
					margin-right: 20px;
			}

			.site-demo-flow {
				width: 100%;
			}
			
			.video button {
				/*height: 38px;
               line-height: 38px;
               padding: 0 18px;
               background-color: #009688;*/
				color: #fff;
				white-space: nowrap;
				text-align: center;
				font-size: 14px;
				border: none;
				border-radius: 2px;
				cursor: pointer;
				height: 30px;
				line-height: 30px;
				padding: 0 10px;
				font-size: 12px;
				background-color: #606060;
				display: inline-block;
			}
			.father-div-datetime {
				width: 100%;
				height: 40px;
				float: left;
			}

			.datetime {
				width: 70%;
				height: 100%;
				float: left;
				position: relative;
			}

			.datetime-text {
				width: 92%;
				height: 60%;
				font-size: 16px;
				position: absolute;
				top: 10%;
				left: 15px;
			}

			.send {
				width: 15%;
				height: 100%;
				position: relative;
				float: left;
			}

			.layui-icon-group {
				font-size: 20px;
				display:none;
				position: absolute;
				top: 25%;
				left: 15%;
			}

			.delete {
				width: 15%;
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

			.father-div-title {
				width: 100%;
				height: 35px;
				position: relative;
			}

			.title {
				width: 90%;
				height: 55%;
				font-size: 16px;
				position: absolute;
				top: 25%;
				left: 5%;
				border: 1px;
			}
			.father-div-introduction {
				width: 100%;
				height: 40px;
				position: relative;
			}

			.introduction {
				width: 90%;
				height: 55%;
				font-size: 16px;
				position: absolute;
				left: 5%;
				border: 1px;
			}
		</style>
	</head>

	<body>
		<div class="demoTable" style="margin-top: 10px ;margin-left: 10px">
			<blockquote class="layui-elem-quote">
				<div class="layui-inline">
					<input class="layui-input" onkeyup="this.value=this.value.replace(/^ +| +$/g,'')" name="searchName" id="searchName" autocomplete="off" placeholder="请输入视频名称">
				</div>
				<button id="searchBtn" class="layui-btn layui-btn-normal"><i class="layui-icon">&#xe615;</i>  搜索</button>
				<a href="/Material/turnAddVideo" style="float: right;margin-right: 40px" id="add-video" class="layui-btn"><i class="layui-icon layui-icon-add-1"></i>新增视频素材</a>
			</blockquote>
		</div>
		<div style="padding: 20px; background-color: #F2F2F2; min-height: 485px;">
			<div class="layui-row layui-col-space15">
				<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
					<legend>图片素材，<span id="count">共（0</span> ）条</legend>
				</fieldset>
				<div name='videos' style="width: 90%; padding-left: 5%;" class="site-demo-flow" id="videos">
					</div>
		</div>
		</div>

	</body>
	<script src="../statics/plugins/layui/layui.js" charset="utf-8"></script>
	<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
	<script>
		layui.use(['jquery', 'flow', 'element', 'util','layer'], function() {
			var flow = layui.flow;
			var util = layui.util;
			var element = layui.element;
			var $ = layui.$; //重点处
			var layer = layui.layer;
			var $div = document.getElementsByClassName("video");
			var videoID = 1;
			var count = 0;
			$(function() {
				$.ajax({
					url: '/Material/showVideo',
					method: 'post',
					dataType: 'JSON',
					success: function(res) {
						$.each(res, function(i, item) {
							var filePath=item.url;
									console.log("第"+i+"个："+filePath);
				filePath=filePath.substring(44,filePath.length);
	
	
				console.log("第"+i+"个："+filePath);
				
					var time =util.toDateString(item.createTime);
							time=time.substring(0,10);
				
				$("#videos").append('<div class="video" id="'+item.id+'" style="width: 340px;border: solid black 1px;"><div class="father-div-title"><div id="title'+item.id+'" class="title">'+item.title+'</div></div><div style="width: 100%;"><video width="320px" height="187px" controls="controls"><source src="..'+filePath+'" type="video/mp4">Your browser does not support the video tag.</video></div><div class="father-div-introduction"><div id="introduction'+item.id+'" class="introduction" property="简介">'+item.description+'</div></div><div class="father-div-datetime"><div class="datetime"><div id="datetime-text'+item.id+'" class="datetime-text">更新于 '+time+'</div></div><div class="send"><li id="send-video'+item.id+'" class="layui-icon layui-icon-group"></li></div><div class="delete"><li id="delete-video'+item.id+'" class="layui-icon layui-icon-delete"></li></div></div></div>');
				
				
						});

						$("#count").html('共（' + $div.length);
					}
				});
			});

			// 按屏加载图片
			flow.lazyimg({
				elem: '#videos img'
			});
			$("#searchBtn").click(function() {
				var searchVideoName = $("#searchName").val();
				if('' != searchVideoName) {
					$(".video").css("display", "none");
					$.each($div, function(i) {
						var flag = -1;
						flag = $(this).find(".title").html().search(searchVideoName);
						if(flag != -1) {
							count = count + 1;
							$("#" + $div[i].id).css("display", "inline");
						}
					});
					$("#count").html('共找到（' + count);
					count = 0;
				} else {
					$("#count").html('共（' + $div.length);
					$(".video").css("display", "inline");
				}
			});
			$('#videos').on('mouseover',".video",function() {
				videoID = $(this).attr('id');
			});
			$('#videos').on('mouseover',".send", function() {
				$('#send-video'+videoID).css("display", "inline");
				layer.tips('群发', '#send-video'+videoID, {
					tips: [1, '#3595CC'],
					time: 500
				});
			});
			$('#videos').on('mouseout',".send", function() {
				$('#send-video'+videoID).css("display", "none");
			});
			$("#videos").on('click', ".send", function() {
			alert("群发操作")

			});
			$('#videos').on('mouseover',".delete", function() {
					$('#delete-video'+videoID).css("display", "inline");
					layer.tips('删除', '#delete-video'+videoID, {
						tips: [1, '#3595CC'],
						time: 500
					});
			});
			$('#videos').on('mouseout',".delete", function() {
				$('#delete-video'+videoID).css("display", "none");
			});
			$("#videos").on('click', ".delete", function() {
				$.ajax({
					url: '/Material/deleteVideo',
					method: 'post',
					dataType: 'JSON',
					data: {
						id: videoID
					},
					beforeSend: function(input) {
						layer.load(0, { content: '删除中...' }); //上传loading
					},
					success: function(res) {
									layer.closeAll();
//							console.log("code:" + res.code + " videoID:" + res.fileID);
							//如果上传失败
						if (res=="0"){
								window.location.href="<%=basePath%>/jsp/showVideo.jsp";
							
							} else {
							return layer.msg('删除失败，错误代码：'+res);
							}
						},
						error:function(res, index, upload) {
							layer.closeAll();
								return layer.msg('删除失败，请刷新页面重试！');
						}
//					success: function(res) {
//						layer.closeAll();
//						if(res) {

//						} else {
//							return layer.msg('删除失败，请刷新页面重试！');
//						}
//
//					}
				});
			});
		});
	</script>

</html>