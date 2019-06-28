<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String imageID = request.getParameter("imageID");
%>
<html>

	<head>
		<meta charset="UTF-8">
		<title>选择图片</title>
		<link rel="stylesheet" href="../statics/plugins/layui/css/layui.css">
		<style>
			.image {
				float: left;
				width: 200px;
				height: 170px;
				border: 1px solid black;
			}
			
			.image-select {
				font-size: 20px;
			}
			
			.show-image {
				width: 80%;
				border: 1px solid blue;
				position: relative;
				left: 10%;
			}
			
			.show-image img {
				width: 160px;
				height: 120px;
			}
		</style>
	</head>

	<body>

	
    
<form lay-filter="voiceMessage" id="showVoiceMessage"  class="layui-form layui-form-pane" action="" style="margin-left: 6px;display: none">
    <div class="layui-form-item">
        <label class="layui-form-label">标题：</label>
        <div class="layui-input-block">
        	  <label class="layui-form-label" style="background-color: transparent;border: none; text-align: left;"><span id="voice-title"></span></label>
        </div>
    </div>
     <div class="layui-form-item">
        <label class="layui-form-label">消息类型：</label>
        <div class="layui-input-inline">
          <label class="layui-form-label"  style="background-color: transparent;border: none; text-align: left;"><span >视频消息</span></label>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">关键词：</label>
        <div class="layui-input-inline">
          <label class="layui-form-label"  style="background-color: transparent;border: none; text-align: left;"><span id="voice-inputCode"></span></label>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">语音标题：</label>
        <div class="layui-input-inline">
          <label class="layui-form-label"  style="background-color: transparent;border: none; text-align: left;"><span id="voiceTitle">无视频</span></label>
        </div>
    </div>
     <div class="layui-form-item">
        <label class="layui-form-label">语音：</label>
        <div class="show-voice">
        	<audio controls="controls" style="width: 250px;height: 40px;"><source src="" type="audio/mpeg">Your browser does not support the audio tag.</audio>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">语音描述：</label>
        <div class="layui-input-inline">
        		<textarea name="Content" id="voice-introduction"  disabled="disabled" style="border: none;overflow-y:visible; text-align: left;" class="layui-textarea" required lay-verify="required|content">无视频</textarea>
        </div>
    </div>
    
</form>
		

		<script src="../statics/plugins/layui/layui.js"></script>
		<script>
			layui.use(['form', 'layedit', 'layer', 'laydate'], function() {
				var form = layui.form,
					layer = layui.layer,
					$ = layui.jquery
				var imageID=1;
				
				$(function() {
					$.ajax({
						url: '/Material/showImages',
						method: 'post',
						dataType: 'JSON',
						success: function(res) {
							$.each(res, function(i, item) {
								$("#selectImage").append('<div class="image"><input type="radio" class="image-select" name="sex" value="'+item.id+'" title="'+item.imageName+'"><div class="show-image"><img src="'+item.picUrl+'"></div></div>');
							});
							if(imageID!=0){
								 $("input:radio[value='"+imageID+"']").prop("checked",true);
							}else{
								 $("input:radio:first").prop("checked",true);
							}
							form.render();
						}
					});

				});
				$('#closeIframe').on('click', function() {
					var index = parent.layer.getFrameIndex(window.name);
					var data = $('input[name="sex"]:checked').val();
					var name = $('input[name="sex"]:checked').attr("title");
					console.log(name);
					parent.layui.$('.getImage').attr("id", data);
					parent.layui.$('.getImage').html(name);
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