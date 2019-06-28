<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<meta charset="UTF-8">
	<title>注册用户</title>
	<link rel="stylesheet" href="../statics/plugins/layui/css/layui.css">
</head>
<body>
<div style="position: relative;left: 25%;top: 50px; width: 40%;">

	<form class="layui-form layui-anim layui-anim-upbit layui-form-pane">
		<fieldset class="layui-elem-field layui-field-title">
			<legend><h3>注册微信公众号管理平台用户</h3></legend>
		</fieldset>

		<div class="layui-form-item">
			<label class="layui-form-label"><i style="color: red;">*</i>用户名</label>
			<div class="layui-input-block">
				<input type="text" name="username" id="username" required placeholder="请输入" autocomplete="off" lay-verify="required" class="layui-input">
			</div>
		</div>

		<div class="layui-form-item">
			<label class="layui-form-label"><i style="color: red;">*</i>密码</label>
			<div class="layui-input-block">
				<input type="password" name="password1" id="password1"  required placeholder="请输入" autocomplete="off" lay-verify="required" class="layui-input">
			</div>
		</div>

		<div class="layui-form-item">
			<label class="layui-form-label"><i style="color: red;">*</i>确认密码</label>
			<div class="layui-input-block">
				<input type="password" name="password" id="password" required placeholder="请输入" autocomplete="off" lay-verify="pass" class="layui-input">
			</div>
		</div>

		<div class="layui-form-item">
			<label class="layui-form-label">真实姓名</label>
			<div class="layui-input-block">
				<input type="text" name="true_name" id="true_name" placeholder="请输入" autocomplete="off" lay-verify="required" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">性别</label>
			<div class="layui-input-block">
				<input type="radio" name="sex"  lay-filter="erweima"  value="1" title="男" checked>
				<input type="radio" name="sex"  lay-filter="erweima"  value="2" title="女">
				<input type="radio" name="sex" lay-filter="erweima"  value="0" title="隐藏">
				<%--<input type="text" name="sex" id="sex" placeholder="请填写'man'或'woman'" autocomplete="off" lay-verify="required" class="layui-input">--%>
			</div>
		</div>

		<div class="layui-form-item">
			<label class="layui-form-label">电话号码</label>
			<div class="layui-input-block">
				<input type="text" name="phone" id="phone" placeholder="请输入" autocomplete="off" lay-verify="phone" class="layui-input">
			</div>
		</div>

		<div class="layui-form-item">
			<label class="layui-form-label">邮箱</label>
			<div class="layui-input-block">
				<input type="text" name="email" id="email" placeholder="请输入" autocomplete="off" lay-verify="email" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn" type="submit"  lay-submit lay-filter="sub">立即提交</button>
				<button type="reset" class="layui-btn layui-btn-primary">重置</button>
			</div>
		</div>
	</form>
</div>

<script src="../statics/plugins/layui/layui.js"></script>
<script type="text/javascript" src="../statics/src/js/jquery.min.js"></script>
<script type="text/javascript">
    layui.use(['form','jquery','layer'], function () {
        var form= layui.form;
        var $ = layui.jquery;
        var layer= layui.layer;
        // var sex=man;
        //添加表单失焦事件
        //验证表单
        $('#username').blur(function() {
            var user = $(this).val();
            if(user==null||user==""){
                layer.msg('请输入用户名！')
			}else{
                $.ajax({
                    url:'/System/checkUser',
                    type:'post',
                    dataType:'text',
                    data:{username:user},
                    //验证用户名是否可用
                    success:function(data){
                        if (data == "success") {
                            layer.msg('当前用户名可以使用! ')
                        } else {
                            layer.msg('当前用户名已被占用! ')
                        }
                    }
                })
			}
        });
        //验证两次密码是否一致
        $('#password').blur(function() {
            if($('#password1').val() != $('#password').val()){
                layer.msg('两次输入密码不一致!');
            }else {
            };
        });
        //添加表单监听事件,提交注册信息
        form.on('submit(sub)', function(data) {
			var sex;
            var obj =document.getElementsByName("sex");
			$.each(obj, function(i, item) {
				if(item.checked){
					sex=item.value;
				}
				});
			$.ajax({
				url: '/System/regist',
				method: 'post',
				contentType:"application/json",
				data:JSON.stringify(data.field),
				dataType:'json',
				 success:function(result){
					if (result>0){
						layer.msg("注册成功！",{
							icon:1,
							time:1000
						},function () {
							location.href = "./login.jsp";
						});
					} else {
						return layer.msg('注册失败，请刷新页面重试！');
					}
				},
				error: function(result) {
					return layer.msg('注册失败，请刷新页面重试！');
				}
            });
            //防止页面跳转
             return false;
        });
    });
</script>
</body>
</html>
