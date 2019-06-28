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
    <meta name="referrer" content="never">
    <title>添加图片消息</title>
    <link rel="stylesheet" href="../statics/plugins/layui/css/layui.css">
</head>
<body>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 10px;margin-left: 6px;position: relative;">
    <legend>添加图片消息<span id="point" style="font-size: 12px; position: relative; left: 20px;">图片从图片素材中获取</span></legend>
</fieldset>
<form class="layui-form layui-form-pane" action="" style="margin-left: 6px">
 <div>
    <div class="layui-form-item">
        <label class="layui-form-label">标题</label>
        <div class="layui-input-inline">
            <input type="text" name="title" id="title" lay-verify="required" autocomplete="off" placeholder="请输入标题" class="layui-input">
        </div>
    </div>

     <div class="layui-form-item">
         <label class="layui-form-label">选择图片</label>
         <div class="layui-input-inline"  lay-filter="selectOption">
             <select name="modules" id="selectImage" lay-verify="" lay-filter="selectImage" lay-search="">
                 <option value="">直接选择或搜索选择</option>
             </select>
         </div>
     </div>
    <div class="layui-form-item">
        <label class="layui-form-label">关键词</label>
        <div class="layui-input-inline">
            <input type="text" name="inputCode" id="inputCode" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
        </div>
    </div>
        <button class="layui-btn" lay-submit="" lay-filter="submitData">立即提交</button>
        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
     <a href="<%=basePath%>/jsp/showAllMessage.jsp" id="acncel" class="layui-btn layui-btn-normal"> 取消</a>
   </div>
</form>

<script src="../statics/plugins/layui/layui.js"></script>
<script>
    layui.use(['form', 'layedit', 'laydate','jquery','layer'], function(){
        var form = layui.form
                ,layer = layui.layer
                ,$=layui.jquery
                ,layedit = layui.layedit
                ,laydate = layui.laydate;
                var mark="<%=mark%>";
        var baseID=<%=baseID%>;
        var imageID=0;
        function selectValue(sId,value){
            var s = document.getElementById(sId);
            var ops = s.options;
            for(var i=0;i<ops.length; i++){
                var tempValue = ops[i].value;
                if(tempValue == value)
                {
                    ops[i].selected=true;
                }
            }

        };
        $(function() {
            $.ajax({
                url: '/Material/showImages',
                method: 'post',
                dataType: 'JSON',
                success: function(res) {
                    $.each(res, function(i, item) {
                        $("#selectImage").append('<option value="'+item.id+'">'+item.imageName+'</option>');
                    });
                    form.render();
                }
            });
            if ("edit"==mark){
                $.ajax({
                    url: '/Message/getImageMessage',
                    method: 'post',
                    dataType: 'JSON',
                    data: {
                        baseMessageID: baseID
                    },
                    success: function(res) {

                        selectValue("selectImage",res.imageId);
                        $("#selectImage").val(res.image.imageName);
                        $("#title").val(res.title);
                        $("#inputCode").val(res.inputCode);
                    }
                });
            }
        });
        form.on('select(selectImage)', function(data){
            imageID=data.value;
            console.log("imageID:"+imageID);
        });
        //日期
        laydate.render({
            elem: '#date'
            ,trigger: 'click'
            ,theme: 'molv'
        });
        //监听提交
        form.on('submit(submitData)', function(data){
            if ("edit"==mark){
                $.ajax({
                    url:'/Message/addImageMessage',
                    method:'post',
                    dataType:'json',
                    data:{
                        title: $("#title").val(),
                        imageID:imageID,
                        baseID:baseID,
                        inputCode: $("#inputCode").val()
                    },
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
                    url:'/Message/addImageMessage',
                    method:'post',
                    dataType:'json',
                    data:{
                        title: $("#title").val(),
                        imageID:imageID,
                        inputCode: $("#inputCode").val()
                    },
                    success:function(result){
                        console.log("result:"+result);
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

