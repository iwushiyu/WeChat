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
    <title>选择图片</title>
    <link rel="stylesheet" href="../statics/plugins/layui/css/layui.css">
</head>
<body>

<form class="layui-form layui-form-pane" action="" style="margin-left: 6px">
	<div class="layui-inline">
      <label class="layui-form-label">图片素材</label>
      <div class="layui-input-inline">
      </div>
    </div>
 <div>
        <button class="layui-btn" lay-submit="" lay-filter="demo2">立即提交</button>
        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
    </div>
</form>
<script src="../statics/plugins/layui/layui.js"></script>
<script>
    layui.use(['form', 'layedit','layer','laydate'], function(){
        var form = layui.form
                ,layer = layui.layer
                ,$=layui.jquery
			var imageID;
			$(function() {
				var selectString;
				selectString='<select id="selectimage" name="modules" lay-search="" lay-verify="required"><option value="">直接选择或搜索选择</option>';
                $.ajax({
				url: '/Material/showimages',
				method: 'post',
				dataType: 'JSON',
				success: function(res) {
				    $.each(res, function(i, item) {
                            selectString+='<option value="'+item.id+'">'+item.imageName+'</option>';
				          });
				          // selectString+='</select>';
				}
			});
                selectString+='</select>';
                form.render();
						console.log(selectString);
                $(".layui-input-inline").append(selectString);
		});
form.on('select(selectimage)', function(data){
    console.log(data.field.modules);
//  return data.field.modules;
    return false
 });
    });
</script>

</body>
</html>

