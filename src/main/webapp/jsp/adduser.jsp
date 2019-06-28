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
    <title>添加系统用户</title>
    <link rel="stylesheet" href="../statics/plugins/layui/css/layui.css">
</head>
<body>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 10px;margin-left: 6px">
    <legend>添加系统用户</legend>
</fieldset>
<form class="layui-form layui-form-pane" action="" style="margin-left: 6px">
    <div class="layui-form-item">
        <label class="layui-form-label">用户名</label>
        <div class="layui-input-block">
            <input type="text" name="username" id="username" lay-verify="required" autocomplete="off" placeholder="请输入用户名" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">密码</label>
        <div class="layui-input-block">
            <input type="text" name="password" id="password" lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">真实姓名</label>
        <div class="layui-input-block">
            <input type="text" name="true_name" id="true_name" lay-verify="required" placeholder="请输入真实姓名" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">性别</label>
        <div class="layui-input-block">
            <input type="radio" name="sex" id="sex" lay-filter="erweima"  value="1" title="男" checked>
            <input type="radio" name="sex" id="sex" lay-filter="erweima"  value="2" title="女">
            <%--<input type="text" name="sex" id="sex" placeholder="请填写'man'或'woman'" autocomplete="off" lay-verify="required" class="layui-input">--%>
        </div>
    </div>
    <div class="layui-form-item ">
        <label class="layui-form-label">电话</label>
        <div class="layui-input-block">
            <input type="text" name="phone" id="phone"  lay-verify="phone" placeholder="请输入电话号码" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item ">
        <label class="layui-form-label">邮箱</label>
        <div class="layui-input-block">
            <input type="text" name="email" id="email"  lay-verify="email" placeholder="请输入邮箱地址" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <button class="layui-btn" lay-submit="" lay-filter="demo2">立即提交</button>
        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
    </div>
</form>

<script src="../statics/plugins/layui/layui.js"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
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
                if(value.length < 1){
                    return '标题至少得1个字符呀';
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
                url:'/User/regist',
                method:'post',
                contentType:"application/json",
                data:JSON.stringify(data.field),
                dataType:'json',
                success:function(result){
                    if (result) {
                        layer.msg("添加成功！",{
                            icon:1,
                            time:1000
                        },function () {
                            parent.window.location.reload();
                        });
                    }else {
                        layer.msg("添加失败！",{
                            icon:1,
                            time:1000
                        });
                    }

                }
            })
            return false;
        });
    });
</script>

</body>
</html>

