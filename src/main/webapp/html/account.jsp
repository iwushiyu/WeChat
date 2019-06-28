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

	<!--	<div class="layui-anim layui-anim-upbit layui-form-pane layui-form" style="margin: 50px auto;width: 50%;>-->
		<div >
			
			<form class="layui-form layui-anim layui-anim-upbit layui-form-pane" > <!-- 提示：如果你不想用form，你可以换成div等任何一个普通元素 -->
	  			<fieldset class="layui-elem-field layui-field-title">
  					<legend><h3>添加微信公众号</h3></legend>
				</fieldset>
	  			
	  			<!--<h1 style="text-align: center;">添加公众号</h1><br />-->
	  			<div class="layui-form-item">
	    			<label class="layui-form-label"><i style="color: red;">*</i>公众号名称</label>
	    			<div class="layui-input-block">
	      				<input type="text" name="" required placeholder="请输入" autocomplete="off" lay-verify="required" class="layui-input">
	    			</div>
	  			</div>
	  			
	  			<div class="layui-form-item">
	    			<label class="layui-form-label">公众号ID</label>
	    			<div class="layui-input-block">
	      				<input type="text" name="" placeholder="请输入" autocomplete="off" lay-verify="required" class="layui-input">
	    			</div>
	  			</div>
	  			
	  			<div class="layui-form-item">
	    			<label class="layui-form-label">AppID</label>
	    			<div class="layui-input-block">
	      				<input type="text" name="" placeholder="请输入" autocomplete="off" lay-verify="required" class="layui-input">
	    			</div>
	  			</div>
	  			
	  			<div class="layui-form-item">
	    			<label class="layui-form-label">AppSecret</label>
	    			<div class="layui-input-block">
	      				<input type="text" name="" placeholder="请输入" autocomplete="off" lay-verify="required" class="layui-input">
	    			</div>
	  			</div>
	  			
	  			<div class="layui-form-item">
	    			<label class="layui-form-label">URL</label>
	    			<div class="layui-input-block">
	      				<input type="text" name="" placeholder="无需输入，自动生成" autocomplete="off" disabled class="layui-input">
	    			</div>
	  			</div>
	  			
	  			<div class="layui-form-item">
	    			<label class="layui-form-label">Token</label>
	    			<div class="layui-input-block">
	      				<input type="text" name="" placeholder="无需输入，自动生成" autocomplete="off" disabled class="layui-input">
	    			</div>
	  			</div>
	  			
	  			<div class="layui-form-item">
	    			<div class="layui-input-block">
	      				<button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
	      				<button type="reset" class="layui-btn layui-btn-primary">重置</button>
	    			</div>
	  			</div>
	  		</form>
		</div>
	
		
		
		<script src="../statics/plugins/layui/layui.js"></script>
		<script>
		layui.use('form', function(){
  			var form = layui.form;
  			form.on('submit(formDemo)', function(data){
    			layer.msg(JSON.stringify(data.field));
    			return false;
  			});
		});
		</script>
	</body>
</html>
