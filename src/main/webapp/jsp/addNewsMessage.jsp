<%--
  Created by IntelliJ IDEA.
  User: 吴仕宇
  Date: 2018/6/23
  Time: 16:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="referrer" content="never">
    <title>添加消息</title>
    <link rel="stylesheet" href="../statics/plugins/layui/css/layui.css">
</head>
<body>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 10px;margin-left: 6px">
    <legend>添加信息</legend>
</fieldset>
<form class="layui-form layui-form-pane" action="" style="margin-left: 6px">
    <div class="layui-form-item">
        <label class="layui-form-label">标题</label>
        <div class="layui-input-block">
            <input type="text" name="Title" lay-verify="title" autocomplete="off" placeholder="请输入标题" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">关键词</label>
        <div class="layui-input-inline">
            <input type="text" name="InputCode" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">消息描述</label>
        <div class="layui-input-block">
            <textarea name="Content" placeholder="请输入内容" class="layui-textarea" lay-verify="content"></textarea>
        </div>
    </div>
    <div class="layui-form-item">
        <button class="layui-btn" lay-submit="" lay-filter="demo2">立即提交</button>
        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
    </div>
</form>

<script src="../statics/plugins/layui/layui.js"></script>
<script>
    layui.use(['form', 'layedit', 'laydate'], function(){
        var form = layui.form
                ,layer = layui.layer
                ,$=layui.jquery
                ,layedit = layui.layedit
                ,laydate = layui.laydate;

        //日期
        laydate.render({
            elem: '#date'
            ,trigger: 'click'
            ,theme: 'molv'
        });

        //创建一个编辑器
        var editIndex = layedit.build('LAY_demo_editor');

        //自定义验证规则
        form.verify({
            title: function(value){
                if(value.length < 3){
                    return '标题至少得3个字符呀';
                }
            }
            ,pass: [/(.+){6,12}$/, '密码必须6到12位']
            ,content: function(value){
                layedit.sync(editIndex);
            }
        });

        //监听提交
        form.on('submit(demo2)', function(data){
            $.ajax({
                url:'/Message/addtextlist',
                method:'post',
                contentType:"application/json",
                data:JSON.stringify(data.field),
                dataType:'json',
                success:function(result){
                    layer.msg(result.msg,{
                    icon:1,
                    time:1000
                },function () {
                    parent.window.location.reload();
                });
                }
            })
            return false;
        });
    });
</script>

</body>
</html>

