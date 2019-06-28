<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<title>添加视频素材</title>
		<meta name="renderer" content="webkit">
		<meta name="referrer" content="never">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<link rel="stylesheet" href="../statics/plugins/layui/css/layui.css" media="all" />
		<!--页面导航栏小图标-->
		<link rel="icon" href="../statics/resource/images/favicon.ico" type="image/x-icon">
		<%
			String path = request.getContextPath();
			String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/";
		%>
		<style>
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
				<button type="button" style=" height: 35px;width: 80px;background-color: grey;margin: 0px;padding: 0px;margin-left: 50px;" class="layui-btn layui-btn-normal" id="getVideo">选择视频</button>
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
				<a href="<%=basePath%>/jsp/showVideo.jsp" id="cancel" class="layui-btn layui-btn-normal"> 取消</a>
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
					var videoID=1;
					$("#title").on('keyup', function() {
						//  alert($("#title").val());
						var str = $("#title").val();
						//				str=$.trim(str);
						$("#title").html(str);
						$("#title-size").html(str.length + "/20");
					});
			// $("#submit").click(function() {
			// 	var	introduction=$("#introduction").val();
			// 	alert(introduction);
			//
			// 	console.log(introduction);
			// });

					$("#introduction").on('keyup', function() {
                        var str = $("#introduction").val();
                        str = str.replace(/\s+/g, " ");
                        //				str=$.trim(str);
                        $("#introduction-size").html(str.length + "/50");
						$("#introduction").val(str);
					});
					upload.render({

						url: '/Material/doUpload',
						elem: '#getVideo',
						accept: 'video',
						exts: 'mp4',
						size: 10240,
						auto: false,
						bindAction: '#submit',
						data: {
							title: function(){
								return $('#title').val();
							},
							introduction: function(){
								return $('#introduction').val();
							},
							fileType: 'video'
						}
                        ,before: function(input){
                        //返回的参数item，即为当前的input DOM对象
                            layer.load(0,{content: '上传中...'}); //上传loading
                        },
						done: function(res, index, upload) {
									layer.closeAll();
							console.log("code:" + res.code + " videoID:" + res.fileID);
							//如果上传失败
							if(res.code > 0) {
								return layer.msg('添加失败，请刷新页面重试！');
							} else {
								window.location.href="<%=basePath%>/jsp/showVideo.jsp";
							}
						},
				error: function(res) {
					layer.closeAll();
					//如果上传失败
					return layer.msg('上传失败，错误代码：' + res.errcode);
				}
					});
		})
	</script>

</html>