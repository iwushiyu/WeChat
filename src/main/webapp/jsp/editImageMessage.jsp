<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
        String mark = request.getParameter("mark");
    String baseID = request.getParameter("baseID");
%>
<html>

	<head>
		<meta charset="UTF-8">
		<meta name="referrer" content="never">
		<title>添加图片消息</title>
		<link rel="stylesheet" href="../statics/plugins/layui/css/layui.css">
	</head>

	<body>
		<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;margin-left: 6px;position: relative;text-align: center;">
			<legend><span style="font-weight: 400;font-size: 1.17em;">添加/修改图片消息</span> <span id="point" style="font-size: 15px; position: relative; left: 20px;">图片从图片素材中获取</span></legend>
		</fieldset>
		<form class="layui-form layui-form-pane" action="" style="margin-left: 6px;">
<div style="margin-top: 30px; width: 50%;position: relative;left: 38%; text-align: center;">
			<div class="layui-form-item">
				<label class="layui-form-label">标题</label>
				<div class="layui-input-inline">
					<input type="text" name="title" id="title" lay-verify="required" autocomplete="off" placeholder="请输入标题" class="layui-input">
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label">选择图片</label>
				<label class="layui-form-label getImage" id="0" style="margin-left: 10px;width: 160px;color: darkolivegreen;">选择图片名字</label>

				<div class="layui-input-inline" lay-filter="selectOption">
					<input class="layui-btn layui-btn-normal" id="material-cover" style="float: left;border: 0px; font-size: 14px; opacity: 0.9;margin-left: 10px; background-color: gray; color: white;width: 100px; height: 40px;border-radius: 4px;" value="选择图片"></input>
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label">关键词</label>
				<div class="layui-input-inline">
					<input type="text" name="inputCode" id="inputCode" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
				</div>
			</div>
			</div>
			<div class="layui-form-item" style="margin-top: 30px; width: 50%;position: relative;left: 25%; text-align: center;">
				<button class="layui-btn" lay-submit="" lay-filter="submitData">立即提交</button>
				<button type="reset" class="layui-btn layui-btn-primary">重置</button>
				<a href="./showAllMessage.jsp" id="acncel" class="layui-btn layui-btn-normal"> 取消</a>
			</div>
		</form>

		<script src="../statics/plugins/layui/layui.js"></script>
		<script>
			layui.use(['form', 'layedit', 'laydate', 'jquery', 'layer'], function() {
				var form = layui.form,
					layer = layui.layer,
					$ = layui.jquery,
					layedit = layui.layedit,
					laydate = layui.laydate;
				var mark = "<%=mark%>";
				var baseID = <%=baseID%>;
				var imageID = 0;
				$(function() {
					if("edit" == mark) {
						$.ajax({
							url: '/Message/getImageMessage',
							method: 'post',
							dataType: 'JSON',
							data: {
								baseMessageID: baseID
							},
							success: function(res) {
								$(".getImage").attr("id",res.imageId);
								if(res.image!=null){
								$(".getImage").html(res.image.imageName);
								}
								$("#title").val(res.title);
								$("#inputCode").val(res.inputCode);
							}
						});
					}
				});
				$('#material-cover').on('click', function() {
					imageID = $('.getImage').attr("id");
					layer.open({
						title: '图片选择',
						type: 2,
						fixed: false,
						maxmin: true,
						area: ['790px', '500px'],
						skin: 'layui-layer-rim', //加上边框
						content: './selectImage.jsp?imageID=' + imageID
					});
				});

				//监听提交
				form.on('submit(submitData)', function(data) {
					imageID = $('.getImage').attr("id");
					if("edit" == mark) {
						$.ajax({
							url: '/Message/editImageMessage',
							method: 'post',
							dataType: 'json',
							data: {
								title: $("#title").val(),
								imageID: imageID,
								baseID: baseID,
								inputCode: $("#inputCode").val()
							},
							success: function(result) {
								if(result == "0") {
									window.location.href = "<%=basePath%>/jsp/showAllMessage.jsp";
								} else {
									return layer.msg(result);
								}
							},
							error: function(result) {
								return layer.msg('修改失败，请刷新页面重试！');
							}
						});
					} else if("add" == mark) {
						$.ajax({
							url: '/Message/addImageMessage',
							method: 'post',
							dataType: 'json',
							data: {
								title: $("#title").val(),
								imageID: imageID,
								inputCode: $("#inputCode").val()
							},
							success: function(result) {
								console.log("result:" + result);
								if(result == "0") {
									window.location.href = "<%=basePath%>/jsp/showAllMessage.jsp";
								} else {
									return layer.msg(result.errcode);
								}
							},
							error: function(result) {
								return layer.msg('添加失败，请刷新页面重试！');
							}
						});
					} else {
						return layer.msg('添加失败，请刷新页面重试！');
					}
					return false;
				});
			});
		</script>

	</body>

</html>