<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/";
	String voiceID = request.getParameter("voiceID");
%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<title>修改语音素材</title>
		<meta name="renderer" content="webkit">
		<meta name="referrer" content="never">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<link rel="stylesheet" href="../statics/plugins/layui/css/layui.css" media="all" />
		<!--页面导航栏小图标-->
		<link rel="icon" href="../statics/resource/images/favicon.ico" type="image/x-icon">
		<style>
			.video button {
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
		</style>
	</head>

	<body style="position: relative; background-color: gainsboro;height:auto;min-height:400px;">

		<div style="float: left;width: 400px;height:auto;min-height:350px;background-color: white; padding:70px 40px 0px 30px;margin: 80px 350px 30px;">
			<div class="layui-form-item">
				<label class="layui-form-label">标题：</label>
				<div class="layui-input-block" style="position: relative;">
					<input type="text" id="title" onkeyup="this.value=this.value.replace(/\s+/g,'')" name="title" lay-verify="required" autocomplete="off" placeholder="请输入标题" class="layui-input" maxlength="20">
					</input>
					<div id="title-size" style="width: 45px;height: 25px;position: absolute;left: 83%;top: 60%; text-align: right;">0/20</div>
				</div>

			</div>
            <div class="layui-form-item">
                <label class="layui-form-label">语音名称：</label>
                <div class="layui-input-block" style="position: relative;">
                    <input type="text" id="voice-name"  name="title" lay-verify="required" autocomplete="off" placeholder="请重新选择语音" disabled="disabled" class="layui-input" maxlength="20">
                    </input>
                </div>

            </div>
			<div class="layui-form-item">
				<label class="layui-form-label">语音：</label>
				<div style="width: 70%; float: left;">
					<audio controls="controls">
						<source id="voice-source" src="../statics/src/voice/Alan Walker-Faded(Restrung).mp3" type="audio/mpeg">Your browser does not support the audio tag.
					</audio>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">描述：</label>

				<div class="layui-input-block" style="height: 60px; width: 70%; float:left; margin: 0; ">
					<textarea type="text" id="introduction" name="introduction" lay-verify="text" autocomplete="off" placeholder="请输入描述" class="layui-input" maxlength="50" style="vertical-align:top;outline:none;padding-top: 5px; width: 100%; height: 100%;background-color: #CCFF99;"></textarea>

					<div id="introduction-size" style="width: 60px;height: 25px;position: absolute;left: 78%;top: 75%;text-align: right; ">0/50
					</div>
				</div>
			</div>

			<div style="margin: 50px; text-align: center;">
				<button id="submit" class="layui-btn layui-btn-normal"> 保存</button>
				<a href="<%=basePath%>/jsp/showVoice.jsp" id="cancel" class="layui-btn layui-btn-normal"> 取消</a>
			</div>
		</div>

		<div id="parentIframe"></div>
	</body>
	<script src="../statics/plugins/layui/layui.js" charset="utf-8"></script>
	<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
	<script>
		layui.use(['element', 'layer', 'upload', 'layedit'], function() {
			var element = layui.element;
			var layedit = layui.layedit;
			var layer = layui.layer;
			var $ = layui.jquery;
			var upload = layui.upload;
			var voiceID = "<%=voiceID%>";
			$(function() {
				$.ajax({
					url: '/Material/getVoice',
					method: 'post',
					dataType: 'JSON',
					data: {
						id: voiceID
					},
					success: function(res) {
						var filePath=res.url;
						filePath=filePath.substring(44,filePath.length);
						$("#title").val(res.title);
                        $("#voice-name").val(res.voiceName);
						$("#introduction").val(res.description);
						$('#getVideo').css("display", "none");
						$("#title-size").html(res.voiceName.length + "/20");
						$("#introduction-size").html(res.description.length + "/50");
						console.log(res);
					}
				});
			});

			$("#title").on('keyup', function() {
				//  alert($("#title").val());
				var str = $("#title").val();
				//				str=$.trim(str);
				$("#title").html(str);
				$("#title-size").html(str.length + "/20");
			});

			$("#introduction").on('keyup', function() {
				var str = $("#introduction").val();
				str = str.replace(/\s+/g, " ");
				//				str=$.trim(str);
				$("#introduction-size").html(str.length + "/50");
				$("#introduction").val(str);
			});
			$("#submit").click(function() {
					var title = $("#title").val();
					var introduction = $("#introduction").val();
					$.ajax({
						url: '/Material/editVoice',
						method: 'post',
						dataType: 'JSON',
						data: {
							title: title,
							introduction: introduction,
							voiceId: voiceID
						},
						success: function(result) {
							if(result) {
								window.location.href = "<%=basePath%>/jsp/showVoice.jsp";
							} else {
                                return layer.msg('修改失败，请刷新页面重试！');
							}

						},
						error: function(result) {
							return layer.msg('修改失败，请刷新页面重试！');
						}
					});


			});

		})
	</script>

</html>