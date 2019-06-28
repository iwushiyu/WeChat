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
		<title>公众号详细信息</title>
		<link rel="stylesheet" href="../statics/plugins/layui/css/layui.css">
	</head>
	<body>

		<div  style="padding: 20px;">
			
			<form class="layui-form layui-anim layui-anim-upbit layui-form-pane">
	  			<fieldset class="layui-elem-field layui-field-title">
  					<legend><h3>当前微信公众号</h3></legend>
				</fieldset>
	  			<div class="layui-form-item">
	    			<label class="layui-form-label">公众号名称</label>
	    			<div class="layui-input-block">
	      				<input type="text" name="name" id="name" required  autocomplete="off"  class="layui-input">
	    			</div>
	  			</div>
	  			
	  			<div class="layui-form-item">
	    			<label class="layui-form-label">公众号ID</label>
	    			<div class="layui-input-block">
	      				<input type="text" name="account" id="account"  autocomplete="off"  class="layui-input">
	    			</div>
	  			</div>
	  			
	  			<div class="layui-form-item">
	    			<label class="layui-form-label">AppID</label>
	    			<div class="layui-input-block">
	      				<input type="text" name="appid" id="appid"  autocomplete="off"  class="layui-input">
	    			</div>
	  			</div>
	  			
	  			<div class="layui-form-item">
	    			<label class="layui-form-label">AppSecret</label>
	    			<div class="layui-input-block">
	      				<input type="text" name="appsecret" id="appsecret"  autocomplete="off"  class="layui-input">
	    			</div>
	  			</div>
	  			
	  			<div class="layui-form-item">
	    			<label class="layui-form-label">URL</label>
	    			<div class="layui-input-block">
	      				<input type="text" name="url" id="url"  autocomplete="off" disabled class="layui-input">
	    			</div>
	  			</div>
	  			
	  			<div class="layui-form-item">
	    			<label class="layui-form-label">Token</label>
	    			<div class="layui-input-block">
	      				<input type="text" name="token" id="token"  autocomplete="off" disabled class="layui-input">
	    			</div>
	  			</div>
	  			
	  			<div class="layui-form-item">
	    			<div class="layui-input-block">
	      				<button class="layui-btn" lay-submit lay-filter="edit"  >提交修改</button>
						<button class="layui-btn" lay-submit lay-filter="delete"  >删除</button>
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
				var d = <%=session.getAttribute("accountSession")%>;
                $(function () {
                	if (d.length==0){
						layer.msg("请先添加公众号！");
					} else {
						$.ajax({
							url:'/Account/showAccount',
							method:'post',
							dataType:'JSON',
							success:function(res){
								// alert(res.name);
								$('#name').val(res.name);
								$('#account').val(res.account);
								$('#appid').val(res.appid);
								$('#appsecret').val(res.appsecret);
								$('#url').val(res.url);
								$('#token').val(res.token);
								// alert(res.token);
							},
							error:function (data) {
							}
						})
					}

                });
                //添加表单监听事件,提交修改的公众号信息
                form.on('submit(edit)', function(data){
                    $.ajax({
                        url:'/Account/editAccount',
                        method:'post',
                        data:data.field,
                        dataType:'JSON',
                        success:function(res){
                            $('#name').val(res.name);
                            $('#account').val(res.account);
                            $('#appid').val(res.appid);
                            $('#appsecret').val(res.appsecret);
                            $('#url').val(res.url);
                            $('#token').val(res.token);
							window.parent.location.reload();
                        },
                        error:function (data) {
                        }
                    })
                    return false;
                });
                //添加表单监听事件,提交删除的公众号信息
                form.on('submit(delete)', function(data){
                    layer.confirm('真的删除行么', function(index){

                        $.ajax({
                            url:'/Account/deleteAccount',
                            method:'post',
                            data:data.field,
                            dataType:'JSON',
                            success: function(res){
                                if (res=="success") {
                                    window.parent.location.reload();
								}
                            }
                        });
                    })
                    return false;
                });
            });
		</script>
	</body>
</html>
