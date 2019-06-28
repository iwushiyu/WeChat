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
    <title>图文素材管理</title>
    <meta name="renderer" content="webkit">
    <meta name="referrer" content="never">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="../statics/plugins/layui/css/layui.css" media="all" />
    <style>.image {
        float: left;
        display: inline-block;
        box-sizing: border-box;
        margin-top: 20px;
        padding: 10px;
        min-width: 300px;
    }
    .more {
        width: 40px;
        height: 20px;
        float: right;
    }

    .picName {
        width: 81.5%;
        float: left;
        padding: 10px;
        text-align: center;
        height: 35px;
        border-width: 1px;
        background-color: red;
        font-size: 18px;
        display: inline;
    }

    .site-demo-flow {
        width: 100%;
    }
    .image button{
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
        background-color: #1E9FFF;
        display: inline-block;

    }
    .submit{

        /*display:none;*/
        margin-top: 2px;
        float: right;
        margin-right: 80px;
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
            <input class="layui-input" name="searchName" id="searchName" autocomplete="off" placeholder="请输入图片名称">
        </div>

        <button id="searchBtn" class="layui-btn layui-btn-normal" ><i class="layui-icon">&#xe615;</i>  搜索</button>
        <button class="layui-btn" style="float: right;margin-right: 40px" id="test2" type="button"><i class="layui-icon">&#xe608;</i>多图片上传</button>
        <button class="layui-btn" style="float: right;margin-right: 40px" id="test1" type="button"><i class="layui-icon layui-icon-add-1"></i>上传图片</button>
    </blockquote>
</div>
<div style="padding: 20px; background-color: #F2F2F2;">

    <div class="layui-row layui-col-space15">
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
<script>layui.use(['jquery', 'flow', 'layer'], function() {
    var flow = layui.flow;
    var $ = layui.$; //重点处
    var layer = layui.layer;
    var $div = document.getElementsByClassName("image");
    var imageID;
    var count=0;
    $(function() {
        $.ajax({
            url: '/Material/show',
            method: 'post',
            dataType: 'JSON',
            success: function(res) {
                $.each(res, function(i, item) {
                    count++;
                    // $("#LAY_demo3").append('<div class="image" id="'+item.id+'"><div style="width: 100%; "><div style="float: left;"><img style="width: 300px;height: 200px;" id=image"'+item.id+'" src="'+ item.picUrl+ '"></div><div class="more" style="float: left; padding-left: 5px;"><i id="more'+item.id+'" class="layui-icon layui-icon-more-vertical" style="font-size: 20px"></i><br /><ul id="ul'+item.id+'" style="display: none;"><li style="padding-bottom: 5px;padding-top: 5px;"><button id="rename'+item.id+'" class="layui-btn layui-btn-sm layui-btn-normal">重命名</button></li><li><button id="delete'+item.id+'" class="layui-btn layui-btn-sm layui-btn-normal">删除</button></li></ul></div></div><div id="imageName'+item.id+'" class="picName"><p>'+item.imageName+'</p></div><input id="reimageName'+item.id+'" style="display: none; width: 50%;"></input><button id="submit" style="display: none; width: 10%;" class="layui-btn layui-btn-sm layui-btn-normal">提交</button></div>');
                    $("#LAY_demo3").prepend('<div class="image" id="'+item.id+'"><div style="width: 100%; "><div style="float: left;"><img style="width: 300px;height: 200px;"  src="'+ item.picUrl+ '"></div><div class="more" style="float: left; padding-left: 5px;"><i id="moreimage" style="margin-left: -5px;margin-right: -5px;" class="layui-icon layui-icon-more-vertical"></i><br /><ul id="ul'+item.id+'" style="display: none;"><li style="padding-bottom: 5px;padding-top: 5px;"><button id="rename'+item.id+'" class="rename" >重命名</button></li><li><button id="delete'+item.id+'" class="delete">删除</button></li></ul></div></div><div id="imageName'+item.id+'" class="picName"><p id="name'+item.id+'">'+item.imageName+'</p></div><input id="reimageName'+item.id+'" style="display: none; width: 60%; margin: 5px;"></input><button id="submit'+item.id+'" style="display:none;" class="submit">提交</button></div>' );
                });
                // $("#LAY_demo3").append('<div id="dragUpload" class="layui-upload-drag"><i class="layui-icon" style="font-size: 100px;"></i><p>点击上传，或将文件拖拽到此处</p></div>');

                if (count!=0) {
                    $("#LAY_demo3").before('<h3 style="margin-left: 70px;">图片素材，共（'+count+'）条</h3>');
                }
            }
        });
    });


//	获取图片的id；
// 		$("div.image").hover(function() {
// 			alert("hello");
// 			imageID = $(this).attr('id');
// 			console.log("自动获取"+imageID);
// 		});
// 		$("document").on('click','.image',function(){
// 			imageID = $(this).attr('id');
// 			console.log("自动获取"+imageID);
// 		});


    // 按屏加载图片
    flow.lazyimg({
        elem: '#LAY_demo3 img'
    });
    $("#LAY_demo3").on('click',"#moreimage",function(){
        imageID = $(this).parent().parent().parent().attr('id');
        // alert(imageID);
        $("#ul"+imageID).css("display", "inline");
        setTimeout(
            function() {
                $("#ul" + imageID).css("display", "none")
            }, 2000
        );
    });

    // $(".more").click(function() {
    // 	$("#ul"+imageID).css("display", "inline");
    // 	setTimeout(
    // 			function() {
    // 				$("#ul" + imageID).css("display", "none")
    // 			}, 2000
    // 	);
    //
    // });

    $("#LAY_demo3").on('click',".rename",function(){
        // imageID = $(this).parent().parent().parent().parent().parent().attr('id');
        $("#imageName"+imageID).css("display", "none");
        $("#reimageName"+imageID).css("display", "inline");
        $("#submit"+imageID).css("display", "inline");

        var oldName = $("#imageName" + imageID).find("p").html();
        $("#reimageName" + imageID).val(oldName);
    });
    $("#searchBtn").click(function() {
        var searchimageName = $("#searchName").val();
        alert(searchimageName);
        if(null != searchimageName) {
            $(".image").css("display", "none")
            $.each($div, function(i) {
                var flag = -1;
                flag = $(this).find("p").html().search(searchimageName);
                if(flag != -1) {
                    $("#" + $div[i].id).css("display", "inline")
                }
            });
        } else {
            $(".image").css("display", "inline");
        }
    });
    $("#LAY_demo3").on('click',".submit",function(){
        // imageID = $(this).parent().parent().parent().parent().parent().parent().attr('id');
        // alert(imageID);
        var newimageName=$("#reimageName"+ imageID).val();
        // $("#imageName" + imageID).css("display", "inline");
        // $("#imageName" + imageID).find("p").html(newimageName);
        // $("#reimageName" + imageID).css("display", "none");
        // $("#submit"+imageID).css("display", "none");
        $.ajax({
            url: '/Material/rename',
            method: 'post',
            dataType: 'JSON',
            data: {
                id: imageID,
                newName:newimageName
            },
            success: function(res) {
                if (res){
                    $("#imageName" + imageID).css("display", "inline");
                    $("#imageName" + imageID).find("p").html(newimageName);
                    $("#reimageName" + imageID).css("display", "none");
                    $("#submit"+imageID).css("display", "none");

                } else{
                    return layer.msg('修改失败，请刷新页面重试！');

                }
            }
        });
    });
    $("#LAY_demo3").on('click',".delete",function(){
        $.ajax({
            url: '/Material/delete',
            method: 'post',
            dataType: 'JSON',
            data: {
                id: imageID
            },
            success: function(res) {
                if (res){
                    $("#" + imageID).remove();
                } else{
                    return layer.msg('删除失败，请刷新页面重试！');
                }

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
            data: {
                fileType: 'image'
            },
            done: function(res) {
                // alert(result);
                //如果上传失败
                if(res.code > 0) {
                    return layer.msg('上传失败');
                }else{
                    window.location.reload();
                }
                // parent.window.location.reload();
                //上传成功
            }
        });

        //多图片上传
        upload.render({
            elem: '#test2',
            url: '/Material/doUpload/',
            multiple: true,
            data: {
                fileType: 'image'
            },
            // before: function(obj) {
            // 	//预读本地文件示例，不支持ie8
            // 	obj.preview(function(index, file, result) {
            // 		$('#demo2').append('<img src="' + result + '" alt="' + file.name +
            // 			'"width="100" height="100" class="layui-upload-img">')
            // 	});
            // },
            // success: function(res) {
            // 	if(res.code > 0) {
            // 		return layer.msg('部分图片上传失败！');
            // 	} else {
            // 		// parent.window.location.reload();//刷新了最开始的页面
            // 		window.location.reload();//刷新当前页面
            // 		// return layer.msg('上传完毕');
            // 	}
            //
            // }
            done: function(res) {
                //如果上传失败
                if(res.code > 0) {
                    return layer.msg('上传失败');
                } else {
                    // parent.window.location.reload();//刷新了最开始的页面
                    window.location.reload();//刷新当前页面
                    // return layer.msg('上传完毕');
                }
                //上传成功
            }
        });

        // //选完文件后不自动上传
        // upload.render({
        // 	elem: '#test8',
        // 	url: '/Material/doUpload/',
        // 	auto: false
        // 		//,multiple: true
        // 		,
        // 	bindAction: '#test9',
        // 	done: function(res) {
        // 		console.log(res)
        // 	}
        // });


        //拖拽上传
        upload.render({
            elem: '#dragUpload',
            url: '/Material/doUpload/',
            data: {
                fileType: 'image'
            },
            done: function(res) {
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