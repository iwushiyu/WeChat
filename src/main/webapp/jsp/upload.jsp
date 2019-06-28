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

		<!--<form class="layui-form layui-form-pane" action="" style="margin-left: 6px">
			<div style="width: 100%;margin-left: 20px; height: 50px;min-height: 30px;">
				<label class="layui-form-label" style="width: 100%; text-align: left;">图片素材</label>
			</div>
			<div id="selectImage" style="width: 100%; margin-left: 20px; height: 200px;min-height: 200px;">
			</div>
			<div style="width: 100%;height: 50px;position:relative; float: left;">
				<button class="layui-btn" lay-submit="" style="margin-bottom: 30px; position: relative;left: 30%;top: 30px;" id="closeIframe">立即提交</button>
				<button class="layui-btn layui-btn-primary" lay-submit="" style="margin-bottom: 30px; position: relative;left: 40%;top: 30px;" id="cancel">取消</button>
			</div>

		</form>
		-->
    
<form lay-filter="videoMessage" id="showVideoMessage"  class="layui-form layui-form-pane" action="" style="margin-left: 6px;display: none">
    <div class="layui-form-item">
        <label class="layui-form-label">标题：</label>
        <div class="layui-input-block">
        	  <label class="layui-form-label" style="background-color: transparent;border: none; text-align: left;"><span id="video-title"></span></label>
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
          <label class="layui-form-label"  style="background-color: transparent;border: none; text-align: left;"><span id="video-inputCode"></span></label>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">语音标题：</label>
        <div class="layui-input-inline">
          <label class="layui-form-label"  style="background-color: transparent;border: none; text-align: left;"><span id="videoTitle">无视频</span></label>
        </div>
    </div>
     <div class="layui-form-item">
        <label class="layui-form-label">语音：</label>
        <div class="show-video"><video width="220px" height="130px" controls="controls">
							<source id="video-content" src="" type="video/mp4">Your browser does not support the video tag.</video>		</div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">语音描述：</label>
        <div class="layui-input-inline">
        		<textarea name="Content" id="video-introduction"  disabled="disabled" style="border: none;overflow-y:visible; text-align: left;" class="layui-textarea" required lay-verify="required|content">无视频</textarea>
        </div>
    </div>
    
</form>
		
		
	<form lay-filter="videoMessage" id="showVideoMessage"  class="layui-form layui-form-pane" action="" style="margin-left: 6px;display: inline">
    <div class="layui-form-item">
        <label class="layui-form-label">标题：</label>
        <div class="layui-input-block">
        	  <label class="layui-form-label" style="background-color: transparent;border: none; text-align: left;"><span id="video-title"></span></label>
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
          <label class="layui-form-label"  style="background-color: transparent;border: none; text-align: left;"><span id="video-inputCode"></span></label>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">视频标题：</label>
        <div class="layui-input-inline">
          <label class="layui-form-label"  style="background-color: transparent;border: none; text-align: left;"><span id="videoTitle"></span></label>
        </div>
    </div>
     <div class="layui-form-item">
        <label class="layui-form-label">封面：</label>
     
        <div class="show-video"><video width="320px" height="187px" controls="controls">
							<source src="" type="video/mp4">Your browser does not support the video tag.</video>		</div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">视频描述：</label>
        <div class="layui-input-inline">
        		<textarea name="Content" id="video-digest"  disabled="disabled" style="border: none;overflow-y:visible; text-align: left;" class="layui-textarea" required lay-verify="required|content"></textarea>
        </div>
    </div>
    
</form>
		
		
		
		
		<form lay-filter="newsMessage" id="showNewsMessage"  class="layui-form layui-form-pane" action="" style="margin-left: 6px;display: inline">
    <div class="layui-form-item">
        <label class="layui-form-label">标题：</label>
        <div class="layui-input-block">
        	  <label class="layui-form-label" style="background-color: transparent;border: none; text-align: left;"><span id="news-title"></span></label>
        </div>
    </div>
     <div class="layui-form-item">
        <label class="layui-form-label">消息类型：</label>
        <div class="layui-input-inline">
          <label class="layui-form-label"  style="background-color: transparent;border: none; text-align: left;"><span >图文消息</span></label>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">关键词：</label>
        <div class="layui-input-inline">
          <label class="layui-form-label"  style="background-color: transparent;border: none; text-align: left;"><span id="news-inputCode"></span></label>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">图文标题：</label>
        <div class="layui-input-inline">
          <label class="layui-form-label"  style="background-color: transparent;border: none; text-align: left;"><span id="newsTitle"></span></label>
        </div>
    </div>
     <div class="layui-form-item">
        <label class="layui-form-label">封面：</label>
        <div class="show-image"><img id="news-content" alt="封面不存在，请修改封面" style="width: 160px; height: 120px;" src=""></div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">描述：</label>
        <div class="layui-input-inline">
        		<textarea name="Content" id="news-digest"  disabled="disabled" style="border: none;overflow-y:visible; text-align: left;" class="layui-textarea" required lay-verify="required|content">呜呜呜呜呜呜呜呜无无无无无无无无无无无无无无无无无无无无无无无无无无无无无无无无无无</textarea>
         </div>
    </div>
    
</form>







		<script src="../statics/plugins/layui/layui.js"></script>
		<script>
			layui.use(['form', 'layedit', 'layer', 'laydate'], function() {
				var form = layui.form,
					layer = layui.layer,
					$ = layui.jquery
//				var imageID=;
				 var imageID=<%=imageID%>;
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