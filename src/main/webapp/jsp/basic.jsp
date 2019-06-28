<%--
  Created by IntelliJ IDEA.
  User: Shio
  Date: 2018/6/19
  Time: 16:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>基本资料</title>
    <link rel="stylesheet" href="../statics/plugins/layui/css/layui.css">
</head>
<body>

<div >
    <form lay-filter="example" id="form1"  class="layui-form layui-form-pane" action="" style="margin-left: 6px;display: none">
        <div class="layui-form-item">
            <label class="layui-form-label">新密码</label>
            <div class="layui-input-block">
                <input type="text" id="pwd" name="pwd" lay-verify="required|title" autocomplete="off" placeholder="请输入新密码" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">确认密码</label>
            <div class="layui-input-block">
                <input type="text" id="rpwd" name="rpwd" lay-verify="required" placeholder="请再次输入新密码" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item" style="display: none">
            <label class="layui-form-label" >id</label>
            <div class="layui-input-inline">
                <input type="text" id="userID" name="userID" value="${sessionScope.systemUserSession.id}" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <button class="layui-btn"  lay-filter="demo2" id="xiugai">提交修改</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </form>

    <form class="layui-form layui-anim layui-anim-upbit layui-form-pane">
        <fieldset class="layui-elem-field layui-field-title">
            <legend><h3>个人基本资料</h3></legend>
        </fieldset>
        <div class="layui-form-item">
            <label class="layui-form-label">用户名</label>
            <div class="layui-input-block">
                <input type="text" name="username" id="username" required value="${sessionScope.systemUserSession.username}"  autocomplete="off"  class="layui-input">
            </div>
        </div>
        <div class="layui-form-item" id="show" style="display: none">
            <label class="layui-form-label">密码</label>
            <div class="layui-input-block">
                <input type="text" name="password" id="password" value="${sessionScope.systemUserSession.password}"  autocomplete="off"  class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">真实姓名</label>
            <div class="layui-input-block">
                <input type="text" name="trueName" id="trueName" value="${sessionScope.systemUserSession.trueName}"  autocomplete="off"  class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">性别</label>
            <div class="layui-input-block">
                <input type="text" name="sex" id="sex"  autocomplete="off" value="${sessionScope.systemUserSession.sex}"  class="layui-input">
            </div>
        </div>
        <div class="layui-form-item" style="display: none">
            <label class="layui-form-label">id</label>
            <div class="layui-input-block">
                <input type="text" name="id" id="id" value="${sessionScope.systemUserSession.id}"  autocomplete="off"  class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">电话号码</label>
            <div class="layui-input-block">
                <input type="text" name="phone" id="phone" value="${sessionScope.systemUserSession.phone}"  autocomplete="off"  class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">邮箱地址</label>
            <div class="layui-input-block">
                <input type="text" name="email" id="email" value="${sessionScope.systemUserSession.email}"  autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">用户身份</label>
            <div class="layui-input-block">
                <input type="text" name="information" id="information" value="${sessionScope.systemUserSession.role.roleDescribe}"  autocomplete="off" disabled class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="edit"  >提交修改</button>
                <button class="layui-btn" lay-submit lay-filter="editpwd"  >修改密码</button>
            </div>
        </div>
    </form>
</div>

<script src="../statics/plugins/layui/layui.js"></script>
<script type="text/javascript" src="../statics/src/js/jquery.min.js"></script>

<script>
    //主动加载jquery模块
    layui.use(['form','jquery', 'layer'], function(){
        var $ = layui.$ //重点处
            ,layer = layui.layer;
        var form   = layui.form;   
        //添加表单监听事件,提交修改的公众号信息
        form.on('submit(edit)', function(data){
            $.ajax({
                url:'/User/editSystemUser',
                method:'post',
                data:data.field,
                dataType:'JSON',
                success:function(res){
                    $('#username').val(res.username);
                    $('#password').val(res.password);
                    $('#trueName').val(res.trueName);
                    $('#sex').val(res.sex);
                    $('#id').val(res.id);
                    $('#phone').val(res.phone);
                    $('#email').val(res.email);
                    $('#information').val(res.role.roleDescribe);
                    alert("修改成功");
                },
                error:function (data) {
                }
            })
            return false;
        });
        //验证两次密码是否一致
        $('#rpwd').blur(function() {
            if($('#rpwd').val() != $('#pwd').val()){
                layer.msg('两次输入密码不一致!');
            }else {
            };
        });
        $('#xiugai').on('click',function () {
            $.ajax({
                type:"post",
                url:'/User/editpassword',
                async:true,
                data:$('#form1').serializeArray(),
                success:function(res){
                    // window.history.back(-1);
                    parent.window.location.href="login.jsp";
                    },
                error:function(res){
                    layer.msg("修改失败，请刷新页面重试！");
                }
            });
        })
        //添加表单监听事件,提交删除的公众号信息
         form.on('submit(editpwd)', function(data){
            layer.confirm('真的修改么，修改后需要重新登录', function(index){
                layer.open({
                    title:'修改密码',
                    type:1,
                    area:['400px','400px'],
                    content:$("#form1")
                });
            })
             return false;
        });
    });
</script>
</body>
</html>
