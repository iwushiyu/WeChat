<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>微官网管理</title>
		<meta name="renderer" content="webkit">
		<meta name="referrer" content="never">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<link rel="stylesheet" href="../statics/plugins/layui/css/layui.css" media="all" />
		<!--页面导航栏小图标-->
		<link rel="icon" href="../statics/resource/images/favicon.ico" type="image/x-icon">
		<meta charset="utf-8">

		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<meta name="format-detection" content="telephone=no">
		<meta http-equiv="Expires" CONTENT="-1">
		<meta http-equiv="Cache-Control" CONTENT="no-cache">
		<meta http-equiv="Pragma" CONTENT="no-cache">
		<link rel="stylesheet" type="text/css" href="../statics/microWebsite/css/style.css">
		<%
			String path = request.getContextPath();
			String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/";
		%>
		<script src="../statics/microWebsite/js/jquery.js" language="javascript" type="text/javascript"></script>
		<script src="../statics/microWebsite/js/jquery-1.9.1.min.js" type="text/javascript"></script>

		<style>
			.every-website {
				width: 300px;
				height: 300px;
				float: left;
				padding: 40px;
			}
			
			.website {
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
			
			.website-img {
				width: 100%;
				height: 100%;
			}
			
			.website-img-error {
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
					<input class="layui-input" onkeyup="this.value=this.value.replace(/^ +| +$/g,'')" name="search-name" id="search-name" autocomplete="off" placeholder="请输入微官网名称">
				</div>
				<button id="search-btn" class="layui-btn layui-btn-normal"><i class="layui-icon">&#xe615;</i>  搜索</button>
				<a href="#" style="float: right;margin-right: 40px" id="add-news" class="layui-btn"><i class="layui-icon layui-icon-add-1"></i>新建微官网</a>
			</blockquote>
		</div>
		<div style="padding: 20px; background-color: #F2F2F2;">
			<div class="layui-row layui-col-space15">
				<div name='all-website' style="width: 90%; height: 100%; padding-left: 5%;" class="site-demo-flow" id="all-website">
					<div id="website1" style="width:35% ;height:350px;float: left;margin: 2% 5% 10%;text-align: center;">
						<object id="1" type="text/x-scriptlet" data="showMiceoWebsite.jsp" style="width:100% ;height:100%;"></object>
						<button id="edit1" class="layui-btn layui-btn-normal" style="margin-top: 30px;">修改</button>
						<button id="submit-and-view1" class="layui-btn layui-btn-normal" style="margin-top: 30px;">删除</button>
						<button id="submit1" class="layui-btn layui-btn-normal" style="margin-top: 30px;">部署</button>
						<input id="websiteUrl1" style="display: none;width: 100%" disabled="disabled" />

					</div>

<div id="website2" style="width:35% ;height:350px;float: left;margin: 2% 5% 10%;text-align: center;">
						<object id="2" type="text/x-scriptlet" data="<%=basePath%>/statics/website/websiteIndex.jsp" style="width:100% ;height:100%;"></object>
						<button id="edit2" class="layui-btn layui-btn-normal" style="margin-top: 30px;">修改</button>
						<button id="submit-and-view2" class="layui-btn layui-btn-normal" style="margin-top: 30px;">删除</button>
						<button id="submit2" class="layui-btn layui-btn-normal" style="margin-top: 30px;">部署</button>
	<input id="websiteUrl2" style="display: none;width: 100%" disabled="disabled" />

					</div>

				</div>
			</div>
		</div>

	</body>

	<script src="../statics/plugins/layui/layui.js" charset="utf-8"></script>
	<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
	<script>
		layui.use(['jquery', 'layedit', 'util', 'flow', 'layer'], function() {
			var layedit = layui.layedit;
			var $ = layui.jquery;
			var flow = layui.flow;
			var util = layui.util;
			var layer = layui.layer;
			var websiteUrl;

			var $div = document.getElementsByClassName("every-website");
			var websiteID;

			flow.lazyimg({
				elem: '#all-website img'
			});
			$("#search-btn").click(function() {
				var searchWebsiteName = $("#search-name").val();
				var websiteNum = 0;
				if('' != searchWebsiteName) {
					$(".every-website").css("display", "none");
					$.each($div, function(i) {
						var flag = -1;
						flag = ($(this).find(".title").html()).search(searchWebsiteName);
						if(flag != -1) {
							websiteNum = websiteNum + 1;
							$("#" + $div[i].id).css("display", "inline");
						}
					});
					$("#count").html('共找到（' + websiteNum);
					websiteNum = 0;
				} else {
					$(".every-website").css("display", "inline");
					$("#count").html('共（' + $div.length);
				}
			});
			$("#submit1").on('click', function() {
				websiteUrl = "<%=basePath%>/jsp/showMiceoWebsite.jsp";
				$("#websiteUrl1").css("display", "inline");
				$("#websiteUrl1").val(websiteUrl);

			});
			$("#submit2").on('click', function() {
				websiteUrl= "<%=basePath%>/statics/website/websiteIndex.jsp";
				$("#websiteUrl2").css("display", "inline");
				$("#websiteUrl2").val(websiteUrl);

			});


			$('#all-website').on('mouseover', ".every-website", function() {
				websiteID = $(this).attr('id');
			});
			$('#all-website').on('mouseover', ".show-detail", function() {
				$('#preview' + websiteID).css("display", "inline");
			});
			$('#all-website').on('mouseout', ".show-detail", function() {
				$('#preview' + websiteID).css("display", "none");
			});
			// $('#all-website').on('click',".preview", function() {
			// 	alert("阅览文章"+websiteID);
			// });
			$('#all-website').on('mouseover', ".send", function() {
				$('#send-website' + websiteID).css("display", "inline");
				layer.tips('群发', '#send-website' + websiteID, {
					tips: [1, '#3595CC'],
					time: 500
				});
			});
			$('#all-website').on('mouseout', ".send", function() {
				$('#send-website' + websiteID).css("display", "none");
			});
			$("#all-website").on('click', ".send", function() {
//				alert("群发操作")

			});
			$('#all-website').on('mouseover', ".edit", function() {
				$('#edit-img' + websiteID).css("display", "inline");
				layer.tips('编辑', '#edit-img' + websiteID, {
					tips: [1, '#3595CC'],
					time: 500
				});
			});
			$('#all-website').on('mouseout', ".edit", function() {
				$('#edit-img' + websiteID).css("display", "none");
			});
			$('#all-website').on('click', ".edit", function() {
				$.each($div, function(i, item) {
					if(websiteID == item.id) {
						// $website=$div[i];
						// window.location.href="editWebsite.jsp";

						// console.log($website);
						window.location.href = "/Material/turnEditWebsite?websiteID=" + websiteID;
						// $.ajax({
						// 	url: '/Material/turnEditWebsite',
						// 	method: 'post',
						// 	dataType: 'JSON',
						// 	data: {
						// 		websiteID: websiteID,
						// 	}
						// });
					};
				});
			});
			$('#all-website').on('mouseover', ".delete", function() {
				$('#delete-img' + websiteID).css("display", "inline");
				layer.tips('删除', '#delete-img' + websiteID, {
					tips: [1, '#3595CC'],
					time: 500
				});
			});
			$('#all-website').on('mouseout', ".delete", function() {
				$('#delete-img' + websiteID).css("display", "none");
			});
			$('#all-website').on('click', ".delete", function() {
				layer.confirm('真的删除行么', function(index) {
					$.ajax({
						url: '/Material/deleteWebsite',
						method: 'post',
						dataType: 'JSON',
						data: {
							id: websiteID
						},
						beforeSend: function(input) {
							layer.load(0, { content: '删除中...' }); //上传loading
						},
						success: function(res) {
							layer.closeAll();
							if(res == "0") {
								window.location.reload();
								// $("#" + imageID).remove();
								// $div = document.getElementsByClassName("image");
								// $("#count").html('共（'+$div.length);
							} else {
								return layer.msg('删除失败，错误代码：' + res);
							}

						},
						error: function(res, index, upload) {
							layer.closeAll();
							return layer.msg('删除失败，请刷新页面重试！');
						}
					});
				});
				// $("#" +websiteID).remove();
				// $div = document.getElementsByClassName("website");
				// $("#count").html('共（'+$div.length);
			});
		});
	</script>

</html>