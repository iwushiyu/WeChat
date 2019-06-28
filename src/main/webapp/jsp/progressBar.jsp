<%--
  Created by IntelliJ IDEA.
  User: Shio
  Date: 2019/2/16
  Time: 12:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>

<html>



<head>
    <meta charset="utf-8">
    <meta name="referrer" content="never">
    <title>文件上传进度条</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="../statics/plugins/layui/css/layui.css" media="all" />


</head>

<body>

<button type="button" class="layui-btn" id="chooseFile">

    <i class="layui-icon">&#xe67c;</i>选择文件

</button> 文件名称: <span id="fileName"></span>

<div style="height: 20px;"></div>

<button type="button" class="layui-btn" id="uploadBtn">

    <i class="layui-icon">&#xe67c;</i>上传文件

</button>

<div style="height: 20px;"></div>

<div class="layui-progress layui-progress-big" lay-showPercent="yes" lay-filter="progressBar">

    <div class="layui-progress-bar layui-bg-red" lay-percent="0%"></div>

</div>
<script src="../statics/plugins/layui/layui.js"  charset="utf-8"></script>
<script>
    layui.use(['upload', 'element', 'layer' ],function(){
        var upload = layui.upload,
            element = layui.element,
        layer = layui.layer;
        element.init();
        //初始化上传
        //创建监听函数
        var xhrOnProgress=function(fun) {
            xhrOnProgress.onprogress = fun; //绑定监听
            //使用闭包实现监听绑
            return function() {
                //通过$.ajaxSettings.xhr();获得XMLHttpRequest对象
                var xhr = $.ajaxSettings.xhr();
                //判断监听函数是否为函数
                if (typeof xhrOnProgress.onprogress !== 'function')
                    return xhr;
                //如果有监听函数并且xhr对象支持绑定时就把监听函数绑定上去
                if (xhrOnProgress.onprogress && xhr.upload) {
                    xhr.upload.onprogress = xhrOnProgress.onprogress;
                }
                return xhr;
            }
        };


// 看看就行，具体内容demo里面有，缺陷，后台必须根据layui格式返回，可看具体layui文档。

        upload.render({

            elem: '#chooseFile'
            ,url: '/Material/doUpload'
            ,auto:false,
            data: {
                fileType: 'image'
            }
            ,xhr:xhrOnProgress
            ,progress:function(value){//上传进度回调 value进度值
                console.log(value);
                element.progress('demo', value+'%')//设置页面进度条
            }
            ,bindAction: '#uploadBtn'
            ,before: function(input){
                //返回的参数item，即为当前的input DOM对象
                layer.load(); //上传loading
                console.log('文件上传中');
            }
            ,done: function(res){
                console.log(res);
                layer.closeAll();
                layer.msg("上传成功");
            }
        });
//
// //初始化上传
//         upload.render({
//             elem: '#chooseFile', // 文件选择
//             accept:'file',
//             url: '/Material/doUpload',
//             auto: false, // 设置不自动提交
//             data: {
//                 fileType: 'image'
//             }
//             ,xhr:xhrOnProgress,
//             bindAction: '#uploadBtn', // 提交按钮
//             progress: function(e , percent) {
//                 console.log("进度：" + percent + '%');
//                 element.progress('progressBar',percent  + '%');
//             },
//             before: function(input){
//             //返回的参数item，即为当前的input DOM对象
//             console.log('文件上传中');
//         } ,
//             choose: function(obj) {
//
//                 obj.preview(function(index, file, result) {
//
//                     $("#fileName").html(file.name);
//
//                 });
//
//             },
//
//             done: function(res) {
//
//                 //如果上传失败
//                 if(res.code > 0) {
//                     return layer.msg('上传失败，错误代码：'+res.errcode);
//                 }else{
//                     window.location.reload();
//                 }
//
//             },
//
//             error: function(res) {
//
//                 return layer.msg('上传失败，错误代码：'+res.errcode);
//
//             }
//
//         });
    });


</script>

</body>

</html>

