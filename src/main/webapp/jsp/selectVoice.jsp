<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
	String voiceID = request.getParameter("voiceID");
%>
<html>

<head>
	<meta charset="UTF-8">
	<title>选择音频</title>
	<link rel="stylesheet" href="../statics/plugins/layui/css/layui.css">
	<style>
		.voice {
			float: left;
			margin: 5px;
			width: 280px;
			height: 130px;
			border: solid black 1px;
		}

		.voice-select {
			font-size: 20px;
		}

		.show-voice {
			/*width: 80%;
            position: relative;
            left: 10%;*/
			position: relative;
			left: 10px;
			width: 150px;
			height: 50px;

		}

		.show-voice audio {
			width: 250px;
			height: 50px;
		}
	</style>
</head>

<body>

<form class="layui-form layui-form-pane" action="" style="margin-left: 6px">
	<div id="selectVoice" style="width:90%; margin-left: 50px; height: 200px;min-height: 200px;position: relative;">

	
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
				$ = layui.jquery;
				var voiceID = 1;

		$(function() {
			$.ajax({
				url: '/Material/showVoices',
				method: 'post',
				dataType: 'JSON',
				success: function(res) {
					$.each(res, function(i, item) {
						var filePath=item.url;
						filePath=filePath.substring(44,filePath.length);
						if(item.description.length > 20) {
							item.description = item.description.substring(0, 20);
						}
						$("#selectVoice").append('<div class="voice" id="'+item.id+'"><input type="radio" class="voice-select" name="sex" value="'+item.id+'" title="'+item.title+'"><div class="show-voice"><div style="width: 100%; float: left;"><audio controls="controls"><source src="..'+filePath+'" type="audio/mpeg">Your browser does not support the audio tag.</audio></div><div class="father-div-introduction"><div id="introduction'+item.id+'" class="introduction" property="描述">'+item.description+'</div></div></div></div>');
					});
					console.log(voiceID);
					if(voiceID != 0) {
						$("input:radio[value='" + voiceID + "']").prop("checked", true);
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
			parent.layui.$('.voice-title').attr("id", data);
			parent.layui.$('.voice-title').html(name);
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