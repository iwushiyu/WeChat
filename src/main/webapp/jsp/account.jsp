<%--
  Created by IntelliJ IDEA.
  User: Shio
  Date: 2018/6/19
  Time: 16:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title>添加公众号</title>
		<link rel="stylesheet" href="../statics/plugins/layui/css/layui.css">
	</head>
	<body>
		<div >
			<form class="layui-form layui-anim layui-anim-upbit layui-form-pane">
	  			<fieldset class="layui-elem-field layui-field-title">
  					<legend><h3>添加微信公众号</h3></legend>
				</fieldset>
	  			<div class="layui-form-item">
	    			<label class="layui-form-label"><i style="color: red;">*</i>公众号名称</label>
	    			<div class="layui-input-block">
	      				<input type="text" name="name" id="name" required placeholder="请输入" autocomplete="off" lay-verify="required" class="layui-input">
	    			</div>
	  			</div>
	  			<div class="layui-form-item">
	    			<label class="layui-form-label">公众号ID</label>
	    			<div class="layui-input-block">
	      				<input type="text" name="account" id="account" placeholder="请输入" autocomplete="off" lay-verify="required" class="layui-input">
	    			</div>
	  			</div>
	  			
	  			<div class="layui-form-item">
	    			<label class="layui-form-label">AppID</label>
	    			<div class="layui-input-block">
	      				<input type="text" name="appid" id="appid" placeholder="请输入" autocomplete="off" lay-verify="required" class="layui-input">
	    			</div>
	  			</div>
	  			
	  			<div class="layui-form-item">
	    			<label class="layui-form-label">AppSecret</label>
	    			<div class="layui-input-block">
	      				<input type="text" name="appsecret" id="appsecret" placeholder="请输入" autocomplete="off" lay-verify="required" class="layui-input">
	    			</div>
	  			</div>
	  			
	  			<div class="layui-form-item">
	    			<label class="layui-form-label">URL</label>
	    			<div class="layui-input-block">
	      				<input type="text" name="url" id="url" placeholder="无需输入，自动生成" autocomplete="off" disabled class="layui-input">
	    			</div>
	  			</div>
	  			
	  			<div class="layui-form-item">
	    			<label class="layui-form-label">Token</label>
	    			<div class="layui-input-block">
	      				<input type="text" name="token" id="token" placeholder="无需输入，自动生成" autocomplete="off" disabled class="layui-input">
	    			</div>
	  			</div>
	  			
	  			<div class="layui-form-item">
	    			<div class="layui-input-block">
	      				<button class="layui-btn" lay-submit lay-filter="formDemo"  >立即提交</button>
	      				<button type="reset" class="layui-btn layui-btn-primary">重置</button>
	    			</div>
	  			</div>
	  		</form>
		</div>

		<script src="../statics/plugins/layui/layui.js"></script>
		<script type="text/javascript" src="../statics/src/js/jquery.min.js"></script>

		<script>
        layui.use(['layer', 'form','laydate'], function(){
            var layer = layui.layer
                ,laydate=layui.laydate
                ,form = layui.form;

            form.on('submit(formDemo)', function(data){
                $.ajax({
                    url:'/Account/addAccount',
                    method:'post',
                    data:data.field,
                    dataType:'JSON',
                    success:function(res){
                    	if (res.errcode=="0"){
							$('#name').val(res.accResult.name);
							$('#account').val(res.accResult.account);
							$('#appid').val(res.accResult.appid);
							$('#appsecret').val(res.accResult.appsecret);
							$('#url').val(res.accResult.url);
							$('#token').val(res.accResult.token);
						} else {
							return layer.msg('添加失败，错误提示：'+res.errcode);
						}
                    },
                    error:function (data) {
						return layer.msg('添加失败，请求错误！');
                    }
                })
                return false;
            });
        });
		</script>
	</body>
</html>
