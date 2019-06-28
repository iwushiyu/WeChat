<%--
  Created by IntelliJ IDEA.
  User: Shio
  Date: 2018/7/2
  Time: 15:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<title>图片素材管理</title>
		<meta name="renderer" content="webkit">
		<meta name="referrer" content="never">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<link rel="stylesheet" href="../statics/plugins/layui/css/layui.css" media="all" />
		<!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
		<style>
			.image {
				float: left;
				display: inline-block;
				box-sizing: border-box;
				margin-top: 20px;
				padding: 10px;
				min-width: 300px;
			}
			
			.more {
				width: 50px;
				height: 80px;
				float: right;
			}
			
			.picName {
				width: 80.5%;
				float: left;
				padding: 10px;
				text-align: center;
				height: 45px;
				border-width: 1px;
				font-size: 18px;
				display: inline;
			}
			
			.site-demo-flow {
				width: 100%;
			}
			
			.image button {
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
			
			.setname {
				display: none;
				width: 81%;
				height: 45px;
				float: left;
			}
			
			.reimageName {
				display: inline;
				width: 60%;
				margin: 5px;
				height: 30px;
				float: left;
			}
			
			.submit {
				display: inline;
				width: 45px;
				padding: 0px;
				float: left;
				margin-top: 6px;
			}
			
			.cancel {
				display: inline;
				width: 45px;
				padding: 0px;
				float: right;
				margin-top: 6px;
			}
			
			#dragUpload {
				height: 150px;
				width: 250px;
				padding: 10px;
				margin-top: 85px;
				margin-left: 40px;
			}
		</style>
	</head>

	<body>
		<div class="demoTable" style="margin-top: 10px ;margin-left: 10px">

			<blockquote class="layui-elem-quote">
				<div class="layui-inline">
					<input class="layui-input" onkeyup="this.value=this.value.replace(/^ +| +$/g,'')" name="searchName" id="searchName" autocomplete="off" placeholder="请输入图片名称">
				</div>

				<button id="searchBtn" class="layui-btn layui-btn-normal"><i class="layui-icon">&#xe615;</i>  搜索</button>
				<button class="layui-btn" style="float: right;margin-right: 40px" id="test2" type="button"><i class="layui-icon">&#xe608;</i>多图片上传</button>
				<button class="layui-btn" style="float: right;margin-right: 40px" id="test1" type="button"><i class="layui-icon layui-icon-add-1"></i>上传图片</button>
			</blockquote>
		</div>
		<div style="padding: 20px; background-color: #F2F2F2; min-height: 485px;">

			<div class="layui-row layui-col-space15">

				<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
					<legend>图片素材，<span id="count">共（0</span>）条<span id="point" style="font-size: 12px; position: relative; left: 20px;">支持bmp/png/jpeg/jpg/gif格式，小于2M</span></legend>
				</fieldset>
				<div name='images' style="width: 90%; padding-left: 5%;" class="site-demo-flow" id="LAY_demo3">
					<div class="layui-upload-drag" id="dragUpload">
						<i class="layui-icon" style="font-size: 100px;"></i>
						<p>点击上传，或将文件拖拽到此处</p>
					</div>
				</div>
			</div>
		</div>
	</body>
	<script src="../statics/plugins/layui/layui.js" charset="utf-8"></script>
	<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
	<script>
		layui.use(['jquery', 'flow', 'element', 'layer'], function() {
			var flow = layui.flow;
			var element = layui.element;
			var $ = layui.$; //重点处
			var layer = layui.layer;
			var $div = document.getElementsByClassName("image");
			var imageID;
			var count = 0;
			$(function() {
				$.ajax({
					url: '/Material/showImages',
					method: 'post',
					dataType: 'JSON',
					success: function(res) {
						$.each(res, function(i, item) {

							// $("#LAY_demo3").append('<div class="image" id="'+item.id+'"><div style="width: 100%; "><div style="float: left;"><img style="width: 300px;height: 200px;" id=image"'+item.id+'" src="'+ item.picUrl+ '"></div><div class="more" style="float: left; padding-left: 5px;"><i id="more'+item.id+'" class="layui-icon layui-icon-more-vertical" style="font-size: 20px"></i><br /><ul id="ul'+item.id+'" style="display: none;"><li style="padding-bottom: 5px;padding-top: 5px;"><button id="rename'+item.id+'" class="layui-btn layui-btn-sm layui-btn-normal">重命名</button></li><li><button id="delete'+item.id+'" class="layui-btn layui-btn-sm layui-btn-normal">删除</button></li></ul></div></div><div id="imageName'+item.id+'" class="picName"><p>'+item.imageName+'</p></div><input id="reimageName'+item.id+'" style="display: none; width: 50%;"></input><button id="submit" style="display: none; width: 10%;" class="layui-btn layui-btn-sm layui-btn-normal">提交</button></div>');
							$("#LAY_demo3").prepend('<div class="image" id="' + item.id + '"><div style="width: 100%; "><div style="float: left;"><img style="width: 300px;height: 200px;"  src="' + item.picUrl + '"></div><div class="more" style="float: left; padding-left: 5px;"><i id="moreimage" style="margin-left: -5px;margin-right: -5px;" class="layui-icon layui-icon-more-vertical">更多</i><br /><ul id="ul' + item.id + '" style="display: none;"><li style="padding-bottom: 5px;padding-top: 5px;"><button id="rename' + item.id + '" class="layui-btn layui-btn-radius layui-btn-normal rename" >重命名</button></li><li><button id="delete' + item.id + '" class="delete">删除</button></li></ul></div></div><div id="imageName' + item.id + '" class="picName"><p id="name' + item.id + '">' + item.imageName + '</p></div><div id="setname' + item.id + '" class="setname" ><input id="reimageName' + item.id + '" class="layui-input reimageName" type="text" onkeyup="this.value=this.value.replace(/\\s+/g,\'\')" maxlength="16"></input><button id="submit' + item.id + '"  class="submit">提交</button><button id="cancel' + item.id + '" class="cancel">取消</button></div></div>');
						});
						// $("#LAY_demo3").append('<div id="dragUpload" class="layui-upload-drag"><i class="layui-icon" style="font-size: 100px;"></i><p>点击上传，或将文件拖拽到此处</p></div>');

						$("#count").html('共（'+ $div.length);
					}
				});
			});

			// 按屏加载图片
			flow.lazyimg({
				elem: '#LAY_demo3 img'
			});
			$("#LAY_demo3").on('click', "#moreimage", function() {
				imageID = $(this).parent().parent().parent().attr('id');
				// alert(imageID);
				$("#ul" + imageID).css("display", "inline");
				setTimeout(
					function() {
						$("#ul" + imageID).css("display", "none")
					}, 2000
				);
			});
			$("#LAY_demo3").on('click', ".rename", function() {
				$("#imageName" + imageID).css("display", "none");
				$("#setname" + imageID).css("display", "inline");
				var oldName = $("#imageName" + imageID).find("p").html();
				$("#reimageName" + imageID).val(oldName);
			});
			$("#searchBtn").click(function() {
				var searchImageName = $("#searchName").val();
				if('' != searchImageName) {
					$(".image").css("display", "none");
					$.each($div, function(i) {
						var flag = -1;
						flag = $(this).find("p").html().search(searchImageName);
						if(flag != -1) {
							count = count + 1;
							$("#" + $div[i].id).css("display", "inline");
						}
					});
					$("#count").html('共找到（' + count);
					count = 0;
				} else {
					$("#count").html('共（' + $div.length);
					$(".image").css("display", "inline");
				}
			});
			$("#LAY_demo3").on('click', ".submit", function() {
				var newimageName = $("#reimageName" + imageID).val();
				$.ajax({
					url: '/Material/reImageName',
					method: 'post',
					dataType: 'JSON',
					data: {
						id: imageID,
						newName: newimageName
					},
					success: function(res) {
						if(res) {
							$("#imageName" + imageID).css("display", "inline");
							$("#imageName" + imageID).find("p").html(newimageName);
							$("#setname" + imageID).css("display", "none");
						} else {
							return layer.msg('修改失败，请刷新页面重试！');

						}
					}
				});
			});
			$("#LAY_demo3").on('click', ".cancel", function() {
				$("#imageName" + imageID).css("display", "inline");
				$("#setname" + imageID).css("display", "none");

			});
			$("#LAY_demo3").on('click', ".delete", function() {
				$.ajax({
					url: '/Material/deleteImage',
					method: 'post',
					dataType: 'JSON',
					data: {
						id: imageID
					},
                    beforeSend: function(input) {
                        layer.load(0, { content: '删除中...' }); //上传loading
                    },
					success: function(res) {
						layer.closeAll();
                        if (res=="0"){
							window.location.reload();
						} else {
							return layer.msg('删除失败，错误代码：'+res);
						}
					},
                    error:function(res, index, upload) {
                        layer.closeAll();
                        return layer.msg('删除失败，请刷新页面重试！');
                    }
				});
			});
		});
	</script>

	<script>
		layui.use('upload', function() {
			var $ = layui.jquery,
				upload = layui.upload;

			//普通图片上传
			layui.upload.render({
				url: '/Material/doUpload',
				elem: '#test1',
				accept: 'images',
				exts: 'jpg|png|gif|bmp|jpeg',
				size: 2048,
				dataType: 'JSON',
				data: {
					title: null,
					introduction: null,
					fileType: 'image'
				},
				before: function(input) {
					//返回的参数item，即为当前的input DOM对象
					layer.load(0, { content: '上传中...' }); //上传loading
				},
				done: function(res) {
					layer.closeAll();
					//如果上传失败
					if(res.code > 0) {
						return layer.msg('上传失败，错误代码：' + res.errcode);
					} else {
						window.location.reload();
					}
				},
				error: function(res) {
					layer.closeAll();
					//如果上传失败
					return layer.msg('上传失败，错误代码：' + res.errcode);
				}
			});

			//多图片上传
			upload.render({
				elem: '#test2',
				url: '/Material/doUpload/',
				multiple: true,
				accept: 'images',
				exts: 'jpg|png|gif|bmp|jpeg',
				size: 2048,
				dataType: 'JSON',
				data: {
					title: null,
					introduction: null,
					fileType: 'image'
				},
				before: function(input) {
					layer.load(0, { content: '上传中...' }); //上传loading
				},
				allDone: function(res) {
					layer.closeAll();
					//如果上传失败
					if(res.code == 1) {
						return layer.msg('上传失败，错误代码：' + res.errcode);
					} else {
						// parent.window.location.reload();//刷新了最开始的页面
						window.location.reload(); //刷新当前页面
						// return layer.msg('上传完毕');
					}
					//上传成功
				}
			});

			//拖拽上传
			upload.render({
				elem: '#dragUpload',
				url: '/Material/doUpload/',
				accept: 'images',
				exts: 'jpg|png|gif|bmp|jpeg',
				size: 2048,
				dataType: 'JSON',
				data: {
					title: null,
					introduction: null,
					fileType: 'image'
				},
				before: function(input) {
					//返回的参数item，即为当前的input DOM对象
					layer.load(0, { content: '上传中...' }); //上传loading
				},
				done: function(res) {
					layer.closeAll();
					//如果上传失败
					if(res.code > 0) {
						return layer.msg('上传失败，错误代码：' + res.errcode);
					} else {
						window.location.reload();
					}
				}
			});

		});
	</script>

</html>