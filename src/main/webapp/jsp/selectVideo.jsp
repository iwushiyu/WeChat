<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String videoID = request.getParameter("videoID");
%>
<html>

	<head>
		<meta charset="UTF-8">
		<title>选择视频</title>
		<link rel="stylesheet" href="../statics/plugins/layui/css/layui.css">
		<style>
			.video {
				float: left;
				margin: 5px;
				width: 180px;
				height: 170px;
				border: solid black 1px;
			}
			
			.video-select {
				font-size: 20px;
			}
			
			.show-video {
				/*width: 80%;
				position: relative;
				left: 10%;*/
				position: relative;
				left: 10px;
				width: 160px;
				height: 135px;
				/*border: 1px red solid;*/
			}
			
			.show-video video {
				width: 160px;
				height: 94px;
			}
		</style>
	</head>

	<body>

		<form class="layui-form layui-form-pane" action="" style="margin-left: 6px">
			<div id="selectVideo" style="width: 85%; padding-left: 50px;padding-right: 50px; height: 250px;min-height: 200px;position: relative;">
			</div>
			<div style="width: 100%;height: 50px;position:relative; float: left;">
				<button class="layui-btn" lay-submit="" style="margin-bottom: 30px; position: relative;left: 30%;top: 30px;" id="closeIframe">确定</button>
				<button class="layui-btn layui-btn-primary" lay-submit="" style="margin-bottom: 30px; position: relative;left: 40%;top: 30px;" id="cancel">取消</button>
			</div>

		</form>

		<script src="../statics/plugins/layui/layui.js"></script>
		<script>
			layui.use(['form', 'layedit', 'layer', 'laydate'], function() {
				var form = layui.form,
					layer = layui.layer,
					$ = layui.jquery
				var videoID = <%=videoID%>;
				$(function() {
					$.ajax({
						url: '/Material/showVideo',
						method: 'post',
						dataType: 'JSON',
						success: function(res) {
							$.each(res, function(i, item) {
									var filePath=item.url;
								filePath=filePath.substring(44,filePath.length);
								if(item.description.length > 20) {
									item.description = item.description.substring(0, 20);
								}
								$("#selectVideo").append('<div class="video" id="'+item.id+'"><input type="radio" class="video-select" name="sex" value="'+item.id+'" title="'+item.title+'"><div class="show-video"><div style="width: 100%; float: left;"><video controls="controls"><source src="..'+filePath+'" type="video/mp4">Your browser does not support the video tag.</video></div><div class="father-div-introduction"><div id="introduction'+item.id+'" class="introduction" property="简介">'+item.description+'</div></div></div></div>');
							});
							console.log(videoID);
							if(videoID != 0) {
								$("input:radio[value='" + videoID + "']").prop("checked", true);
							} else {
								$("input:radio:first").prop("checked", true);
							}
							form.render();
						}
					});

				});
				$('#closeIframe').on('click', function() {
					var index = parent.layer.getFrameIndex(window.name);
					var data = $('input[name="sex"]:checked').val();
					var name = $('input[name="sex"]:checked').attr("title");
					var introduction=$('#introduction'+data).html();
					console.log("data:"+data);
					console.log(introduction);
					console.log(name);
					parent.layui.$('.video-title').attr("id", data);
					parent.layui.$('.video-title').html(name);
					parent.layui.$('#introduction').html(introduction);
					parent.layui.layer.close(index);
				});
				$('#cancel').on('click', function() {
					var index = parent.layer.getFrameIndex(window.name);
					parent.layui.layer.close(index);
				});
			});
		</script>

	</body>

</html>