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
	<style>.thumb {
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
	.thumb button{
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
	.setname{
		display: none;
		width:81%;
		height: 45px;
		float: left;
	}
	.rethumbName{
		display: inline;
		width: 60%;
		margin: 5px;
		height: 30px;
		float: left;
	}
	.submit{
		display:inline;
		width: 45px;
		padding: 0px;
		float: left;
		margin-top: 6px;
	}
	.cancel{
		display:inline;
		width:45px;
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
	}</style>
</head>

<body>
<div class="demoTable" style="margin-top: 10px ;margin-left: 10px">

	<blockquote class="layui-elem-quote">
		<div class="layui-inline">
			<input class="layui-input"  onkeyup="this.value=this.value.replace(/^ +| +$/g,'')" name="searchName" id="searchName" autocomplete="off" placeholder="请输入缩略图名称">
		</div>

		<button id="searchBtn" class="layui-btn layui-btn-normal" ><i class="layui-icon">&#xe615;</i>  搜索</button>
		<button class="layui-btn" style="float: right;margin-right: 40px" id="test2" type="button"><i class="layui-icon">&#xe608;</i>多图片上传</button>
		<button class="layui-btn" style="float: right;margin-right: 40px" id="test1" type="button"><i class="layui-icon layui-icon-add-1"></i>上传图片</button>
	</blockquote>
</div>
<div style="padding: 20px; background-color: #F2F2F2; min-height: 485px;">

	<div class="layui-row layui-col-space15">

		<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
			<legend>封面素材， <span id="count">共（0</span>）条<span id="point" style="font-size: 12px; position: relative; left: 20px;">支持JPG格式，小于64KB</span></legend>
		</fieldset>
		<div name='thumbs' style="width: 90%; padding-left: 5%;" class="site-demo-flow" id="LAY_demo3">
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
<script>layui.use(['jquery', 'flow','element', 'layer'], function() {
	var flow = layui.flow;
	var element = layui.element;
	var $ = layui.$; //重点处
	var layer = layui.layer;
	var $div = document.getElementsByClassName("thumb");
	var thumbID;
	var count=0;
	$(function() {
		$.ajax({
			url: '/Material/showThumbs',
			method: 'post',
			dataType: 'JSON',
            data: {
                fileType:'thumb'
            },
			success: function(res) {
				$.each(res, function(i, item) {

					// $("#LAY_demo3").append('<div class="thumb" id="'+item.id+'"><div style="width: 100%; "><div style="float: left;"><img style="width: 300px;height: 200px;" id=thumb"'+item.id+'" src="'+ item.picUrl+ '"></div><div class="more" style="float: left; padding-left: 5px;"><i id="more'+item.id+'" class="layui-icon layui-icon-more-vertical" style="font-size: 20px"></i><br /><ul id="ul'+item.id+'" style="display: none;"><li style="padding-bottom: 5px;padding-top: 5px;"><button id="rename'+item.id+'" class="layui-btn layui-btn-sm layui-btn-normal">重命名</button></li><li><button id="delete'+item.id+'" class="layui-btn layui-btn-sm layui-btn-normal">删除</button></li></ul></div></div><div id="thumbName'+item.id+'" class="picName"><p>'+item.thumbName+'</p></div><input id="rethumbName'+item.id+'" style="display: none; width: 50%;"></input><button id="submit" style="display: none; width: 10%;" class="layui-btn layui-btn-sm layui-btn-normal">提交</button></div>');
					$("#LAY_demo3").prepend('<div class="thumb" id="'+item.id+'"><div style="width: 100%; "><div style="float: left;"><img style="width: 300px;height: 200px;"  src="'+ item.thumbURL+ '"></div><div class="more" style="float: left; padding-left: 5px;"><i id="morethumb" style="margin-left: -5px;margin-right: -5px;" class="layui-icon layui-icon-more-vertical">更多</i><br /><ul id="ul'+item.id+'" style="display: none;"><li style="padding-bottom: 5px;padding-top: 5px;"><button id="rename'+item.id+'" class="layui-btn layui-btn-radius layui-btn-normal rename" >重命名</button></li><li><button id="delete'+item.id+'" class="delete">删除</button></li></ul></div></div><div id="thumbName'+item.id+'" class="picName"><p id="name'+item.id+'">'+item.thumbName+'</p></div><div id="setname'+item.id+'" class="setname" ><input id="rethumbName'+item.id+'" class="rethumbName"></input><button id="submit'+item.id+'"  class="submit">提交</button><button id="cancel'+item.id+'" class="cancel">取消</button></div></div>' );
				});
				// $("#LAY_demo3").append('<div id="dragUpload" class="layui-upload-drag"><i class="layui-icon" style="font-size: 100px;"></i><p>点击上传，或将文件拖拽到此处</p></div>');

                $("#count").html('共（'+$div.length);
			}
		});
	});



	// 按屏加载图片
	flow.lazyimg({
		elem: '#LAY_demo3 img'
	});
	$("#LAY_demo3").on('click',"#morethumb",function(){
		thumbID = $(this).parent().parent().parent().attr('id');
		// alert(thumbID);
		$("#ul"+thumbID).css("display", "inline");
		setTimeout(
				function() {
					$("#ul" + thumbID).css("display", "none")
				}, 2000
		);
	});
	$("#LAY_demo3").on('click',".rename",function(){
		$("#thumbName"+thumbID).css("display", "none");
		$("#setname"+thumbID).css("display", "inline");
		var oldName = $("#thumbName" + thumbID).find("p").html();
		$("#rethumbName" + thumbID).val(oldName);
	});
	$("#searchBtn").click(function() {
		var searchthumbName = $("#searchName").val();
//		alert(searchthumbName);
		if(''!= searchthumbName) {
			$(".thumb").css("display", "none");
			$.each($div, function(i) {
				var flag = -1;
				flag = $(this).find("p").html().search(searchthumbName);
				if(flag != -1) {
					count=count+1;
					$("#" + $div[i].id).css("display", "inline");
				}
			});
            $("#count").html('共找到（'+count);
            count=0;
		} else {
            $("#count").html('共（'+$div.length);
			$(".thumb").css("display", "inline");
		}
	});
	$("#LAY_demo3").on('click',".submit",function(){
		var newthumbName=$("#rethumbName"+ thumbID).val();
		$.ajax({
			url: '/Material/reThumbName',
			method: 'post',
			dataType: 'JSON',
			data: {
                // fileType:'thumb',
				id:thumbID,
				newName:newthumbName
			},
			success: function(res) {
				if (res){
					$("#thumbName" + thumbID).css("display", "inline");
					$("#thumbName" + thumbID).find("p").html(newthumbName);
					$("#setname"+thumbID).css("display", "none");
				} else{
					return layer.msg('修改失败，请刷新页面重试！');
				}
			}
		});
	});
	$("#LAY_demo3").on('click',".cancel",function(){
		$("#thumbName" + thumbID).css("display", "inline");
		$("#setname"+thumbID).css("display", "none");
	});
	$("#LAY_demo3").on('click',".delete",function(){
		$.ajax({
			url: '/Material/deleteThumb',
			method: 'post',
			dataType: 'JSON',
			data: {
				id: thumbID
			},
			beforeSend: function(input) {
				layer.load(0, { content: '删除中...' }); //上传loading
			},
			success: function(res) {
                layer.closeAll();
				if (res=="0"){
                    window.location.reload();
					// $("#" + thumbID).remove();
                    // $div = document.getElementsByClassName("thumb");
                    // $("#count").html('共（'+$div.length);
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
			exts: 'jpg',
			size:64,
			dataType: 'JSON',
			data: {
				title:null,
				introduction: null,
                fileType: 'thumb'
			}
			,before: function(input){
				//返回的参数item，即为当前的input DOM对象
				layer.load(0,{content: '上传中...'}); //上传loading
			},
			done: function(res) {
				layer.closeAll();
				//如果上传失败
				if(res.code > 0) {
					return layer.msg('上传失败，错误代码：'+res.errcode);
				}else{
					window.location.reload();
				}
			},
			error:function(res) {
				layer.closeAll();
				//如果上传失败
				return layer.msg('上传失败，错误代码：'+res.errcode);
			}
		});

		//多图片上传
		upload.render({
			elem: '#test2',
			url: '/Material/doUpload/',
			multiple: true,
			accept: 'images',
			exts: 'jpg',
			size:64,
			dataType: 'JSON',
			data: {
				title:null,
				introduction: null,
                fileType: 'thumb'
			},
			before: function(input){
				layer.load(0,{content: '上传中...'}); //上传loading
			},
			allDone:function(res) {
				layer.closeAll();
				//如果上传失败
				if(res.code > 0) {
					return layer.msg('上传失败，错误代码：'+res.errcode);
				} else {
					// parent.window.location.reload();//刷新了最开始的页面
					window.location.reload();//刷新当前页面
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
			exts: 'jpg',
			size:64,
			dataType: 'JSON',
			data: {
				title:null,
				introduction: null,
                fileType: 'thumb'
			}
			,before: function(input){
				//返回的参数item，即为当前的input DOM对象
				layer.load(0,{content: '上传中...'}); //上传loading
			},
			done: function(res) {
				layer.closeAll();
				//如果上传失败
				if(res.code > 0) {
					return layer.msg('上传失败');
				}else{
					window.location.reload();
				}
			}
		});

	});
</script>

</html>