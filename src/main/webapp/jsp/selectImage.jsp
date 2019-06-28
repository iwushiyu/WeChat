<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String imageID = request.getParameter("imageID");
%>
<html>

	<head>
		<meta charset="UTF-8">
		<meta name="referrer" content="never">
		<title>选择图片</title>
		<link rel="stylesheet" href="../statics/plugins/layui/css/layui.css">
		<style>
			.image {
				float: left;
				width: 200px;
				height: 170px;
				border: 1px solid black;
				margin: 5px;
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

		<form class="layui-form layui-form-pane" action="" style="margin-left: 6px">
			<!--<div style="width: 100%;margin-left: 20px; height: 50px;min-height: 30px;">
				<label class="layui-form-label" style="width: 100%; text-align: left;">图片素材</label>
			</div>-->
			<div id="selectImage" style="width: 100%; margin-left: 50px; height: 200px;min-height: 200px;">

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