
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    String mark = request.getParameter("mark");
    String baseID = request.getParameter("baseID");
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>文本消息管理</title>
    <link rel="stylesheet" href="../statics/plugins/layui/css/layui.css">
</head>
<body style="background-color: gainsboro;">
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;margin-left: 6px;text-align: center;">
    <legend><h3>添加/修改图片消息</h3></legend>
</fieldset>
<form class="layui-form layui-form-pane" action="" style="margin-left: 6px;margin-top: 30px; width: 50%;position: relative;left: 25%; text-align: center;">
    <div class="layui-form-item">
        <label class="layui-form-label">标题</label>
        <div class="layui-input-block">
            <input type="text" name="title" id="title" lay-verify="required" autocomplete="off" placeholder="请输入标题" maxlength="20" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">关键词</label>
        <div class="layui-input-block">
            <input type="text" name="inputCode" id="inputCode" lay-verify="required" placeholder="请输入" autocomplete="off" maxlength="6" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">消息描述</label>
        <div class="layui-input-block">
            <textarea name="content" id="content" placeholder="请输入内容" class="layui-textarea" maxlength="120" lay-verify="required"></textarea>
        </div>
    </div>
    <div class="layui-form-item">
        <button class="layui-btn" lay-submit="" lay-filter="demo2">立即提交</button>
        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        <a href="<%=basePath%>/jsp/showAllMessage.jsp" id="acncel" class="layui-btn layui-btn-normal"> 取消</a>
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
        var mark="<%=mark%>";
        var baseID=<%=baseID%>;
        $(function() {
				if ("edit"==mark){
					$.ajax({
						url: '/Message/getTextMessage',
						method: 'post',
						dataType: 'JSON',
						data: {
                            baseMessageID: baseID
						},
						success: function(res) {
							$("#title").val(res.title);
							$("#inputCode").val(res.inputCode);
							$("#content").html(res.content);
						}
					});
				}
        });

        //监听提交
        form.on('submit(demo2)', function(data){
        	if ("edit"==mark){
                $.ajax({
                    url:'/Message/editTextMessage?baseID='+baseID,
                    method:'post',
                    contentType:"application/json",
                    data:JSON.stringify(data.field),
                    dataType:'json',
                    success:function(result){
                        if (result=="0"){
                            window.location.href="<%=basePath%>/jsp/showAllMessage.jsp";
                        }else{
                            return layer.msg(result.errcode);
                        }
                    },
                    error: function(result) {
                        return layer.msg('修改失败，请刷新页面重试！');
                    }
                });
        	}else if ("add"==mark){
        		  $.ajax({
                url:'/Message/addTextMessage',
                method:'post',
                contentType:"application/json",
                data:JSON.stringify(data.field),
                dataType:'json',
                success:function(result){
                    if (result=="0"){
                        window.location.href="<%=basePath%>/jsp/showAllMessage.jsp";
                    }else{
                        return layer.msg(result.errcode);
                    }
                },
                error: function(result) {
                    return layer.msg('添加失败，请刷新页面重试！');
                 }
            });
        	}else {
                return layer.msg('添加失败，请刷新页面重试！');
            }
        	return false;
        });
    });
</script>

</body>
</html>

