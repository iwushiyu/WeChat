<%--
  Created by IntelliJ IDEA.
  User: Shio
  Date: 2018/7/2
  Time: 15:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
	<%
			String path = request.getContextPath();
			String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/";
		%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<title>音频管理</title>
		<meta name="renderer" content="webkit">
		<meta name="referrer" content="never">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<link rel="stylesheet" href="../statics/plugins/layui/css/layui.css" media="all" />
		<!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
		<style>
			.voice {
				float: left;
				display: inline-block;
				box-sizing: border-box;
				margin-top: 20px;
				margin-right: 20px;
				padding: 10px;
				min-width: 300px;
			}
			

			
			.site-demo-flow {
				width: 100%;
			}
			
			.voice button {
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
			
			.edit {
				width: 10%;
				height: 100%;
				position: relative;
				float: left;
			}
			
			.layui-icon-edit {
				font-size: 30px;
				display:none;
				position: absolute;
				top: 10%;
				left: 15%;
			}
			.send {
				width: 10%;
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
			}
		</style>
	</head>

	<body>
		<div class="demoTable" style="margin-top: 10px ;margin-left: 10px">

			<blockquote class="layui-elem-quote">
				<div class="layui-inline">
					<input class="layui-input" onkeyup="this.value=this.value.replace(/^ +| +$/g,'')" name="searchName" id="searchName" autocomplete="off" placeholder="请输入音频名称">
				</div>

				<button id="searchBtn" class="layui-btn layui-btn-normal"><i class="layui-icon">&#xe615;</i>  搜索</button>
				<a href="javascript:;" style="float: right;margin-right: 40px" id="add-voice" class="layui-btn"><i class="layui-icon layui-icon-add-1"></i>新增语音素材</a>
			</blockquote>
		</div>
		<div style="padding: 20px; background-color: #F2F2F2; min-height: 485px;">

			<div class="layui-row layui-col-space15">

				<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
					<legend>音频素材， <span id="count">共（0</span>）条<span id="point" style="font-size: 12px; position: relative; left: 20px;">播放长度不超过60s，mp3/wma/wav/amr格式，小于2M</span></legend>
					
				</fieldset>
				<div name='voices' style="width: 90%; padding-left: 5%;" class="site-demo-flow" id="voices">

				</div>
			</div>
		</div>
	</body>
	<script src="../statics/plugins/layui/layui.js" charset="utf-8"></script>
	<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
	<script>
		layui.use(['jquery', 'flow', 'element', 'util', 'layer'], function() {
			var flow = layui.flow;
			var util = layui.util;
			var element = layui.element;
			var $ = layui.$; //重点处
			var layer = layui.layer;
			var $div = document.getElementsByClassName("voice");
			var voiceID;
			var count = 0;
			$(function() {
				$.ajax({
					url: '/Material/showVoices',
					method: 'post',
					dataType: 'JSON',
					data: {
						fileType: 'voice'
					},
					success: function(res) {
						$.each(res, function(i, item) {
								var filePath=item.url;
						filePath=filePath.substring(44,filePath.length);
						var time =util.toDateString(item.createTime);
						time=time.substring(0,10);
							 $("#voices").append('<div class="voice" id="'+item.id+'" style="border: solid black 1px;"><div style="width: 100%; "><div class="father-div-title"><div id="title'+item.id+'" class="title">'+item.title+'</div></div><div style="width: 100%;"><audio controls="controls"><source src="..'+filePath+'" type="audio/mpeg">Your browser does not support the audio tag.</audio></div><div class="father-div-introduction"><div id="introduction'+item.id+'" class="introduction">'+item.description+'</div></div><div class="father-div-datetime"><div class="datetime"><div id="datetime-text'+item.id+'" class="datetime-text">更新于 '+time+'</div></div><div class="send"><li id="send-voice'+item.id+'" class="layui-icon layui-icon-group"></li></div><div class="edit"><li id="edit-voice'+item.id+'" class="layui-icon layui-icon-edit"></li></div><div class="delete"><li id="delete-voice'+item.id+'" class="layui-icon layui-icon-delete"></li></div></div></div></div>');

								});
						// $("#voices").append('<div id="dragUpload" class="layui-upload-drag"><i class="layui-icon" style="font-size: 100px;"></i><p>点击上传，或将文件拖拽到此处</p></div>');

						$("#count").html('共（' + $div.length);
					}
				});
			});

			$('#add-voice').on('click', function(){

				var d = <%=session.getAttribute("accountSession")%>;
				if (d.length==0){
					layer.msg("请先添加公众号！");
				} else{
					window.location.href= "<%=basePath%>/jsp/addVoice.jsp";
				}
			});
			$('#voices').on('mouseover',".voice",function() {
				voiceID = $(this).attr('id');
			});
				$('#voices').on('mouseover',".edit", function() {
		$('#edit-voice'+voiceID).css("display", "inline");
		layer.tips('编辑', '#edit-voice'+voiceID, {
  		tips: [1, '#3595CC'],
  		time: 500
		});
	});
	$('#voices').on('mouseout',".edit", function() {
		$('#edit-voice'+voiceID).css("display", "none");
	});
	$('#voices').on('click',".edit", function() {
//		alert("编辑页面");
		window.location.href="<%=basePath%>/jsp/editVoice.jsp?voiceID="+voiceID;
//		$.each($div, function(i,item) {
//			if (voiceID==item.id) {
//				// $news=$div[i];
//				// window.location.href="editNews.jsp";
//
//				// console.log($news);
//				window.location.href="/Material/turnEditNews?voiceID="+voiceID;
//				// $.ajax({
//				// 	url: '/Material/turnEditNews',
//				// 	method: 'post',
//				// 	dataType: 'JSON',
//				// 	data: {
//				// 		voiceID: voiceID,
//				// 	}
//				// });
//			};
//		});
	});
			$('#voices').on('mouseover',".send", function() {
				$('#send-voice'+voiceID).css("display", "inline");
				layer.tips('群发', '#send-voice'+voiceID, {
					tips: [1, '#3595CC'],
					time: 500
				});
			});
			$('#voices').on('mouseout',".send", function() {
				$('#send-voice'+voiceID).css("display", "none");
			});
			$("#voices").on('click', ".send", function() {
				layer.open({
					title:'群发语音消息',
					type: 2,
					area: ['600px', '430px'],
//                shadeClose: false,
//                maxmin: false,
					skin: 'layui-layer-rim', //加上边框
					content: './selectFans.jsp?messageId=' +voiceID+'&messageType=voice&mark=material'
				});
			});
	$('#voices').on('mouseover',".delete", function() {
		$('#delete-voice'+voiceID).css("display", "inline");
		layer.tips('删除', '#delete-voice'+voiceID, {
  tips: [1, '#3595CC'],
  time: 500
});
	});
	$('#voices').on('mouseout',".delete", function() {
		$('#delete-voice'+voiceID).css("display", "none");
	});
	$('#voices').on('click',".delete", function() {
     $.ajax({
         url: '/Material/deleteVoice',
         method: 'post',
         dataType: 'JSON',
         data: {
             id: voiceID
         },
		 beforeSend: function(input) {
			 layer.load(0, { content: '删除中...' }); //上传loading
		 },
         success: function(res) {
             layer.closeAll();
             if (res=="0"){
                 window.location.reload();
             } else{
				 return layer.msg('删除失败，错误代码：'+res);
             }

         },
		 error:function(res, index, upload) {
			 layer.closeAll();
			 return layer.msg('删除失败，请刷新页面重试！');
		 }
     });
});
			$("#searchBtn").click(function() {
				var searchvoiceName = $("#searchName").val();
//				alert(searchvoiceName);
				if('' != searchvoiceName) {
					$(".voice").css("display", "none");
					$.each($div, function(i) {
						var flag = -1;
						flag = $(this).find("p").html().search(searchvoiceName);
						if(flag != -1) {
							count = count + 1;
							$("#" + $div[i].id).css("display", "inline");
						}
					});
					$("#count").html('共找到（' + count);
					count = 0;
				} else {
					$("#count").html('共（' + $div.length);
					$(".voice").css("display", "inline");
				}
			});
		});
	</script>
</html>