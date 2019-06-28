
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    String mark = request.getParameter("mark");
    String userId = request.getParameter("userId");
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>添加/修改用户信息</title>
    <link rel="stylesheet" href="../statics/plugins/layui/css/layui.css">
</head>
<body style="background-color: gainsboro;">
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;margin-left: 6px;text-align: center;">
    <legend><h2>添加/修改用户信息</h2></legend>
</fieldset>
<form class="layui-form layui-form-pane" action="" style="margin-left: 6px;margin-top: 30px;  width: 50%;position: relative;left: 25%; text-align: center;background-color: white;">
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
            <input type="text" name="trueName" id="trueName" lay-verify="required" placeholder="请输入真实姓名" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">性别</label>
        <div class="layui-input-block">
            <input type="radio" name="sex" id="sex1" lay-filter="erweima"  value="1" title="男" checked>
            <input type="radio" name="sex" id="sex2" lay-filter="erweima"  value="2" title="女">
            <input type="radio" name="sex" id="sex0" lay-filter="erweima"  value="0" title="隐藏">
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
          <a href="<%=basePath%>/jsp/showUser.jsp" id="acncel" class="layui-btn layui-btn-normal"> 取消</a>
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
var mark="<%=mark%>";
        var userId=<%=userId%>;
        $(function() {
				<%--messageID = "<%=request.getSession().getAttribute("messageID")%>";--%>
				if ("edit"==mark){
					$.ajax({
						url: '/User/getUser',
						method: 'post',
						dataType: 'JSON',
						data: {
                 userId: userId
						},
						success: function(data) {
                            $("input:radio[value='0']").prop("checked",data.sex==0 ? true:false);
                            $("input:radio[value='1']").prop("checked",data.sex==1 ? true:false);
                            $("input:radio[value='2']").prop("checked",data.sex==2 ? true:false);
							  // if (data.sex==2) {
                              //     $("input:radio[value='2']").prop("checked",true);
							  //     console.log("sex:2:::::"+data.sex);
                              //     // $("#sex2").prop("checked",true);
                              //     // $("#sex1").prop("checked",false);
                              //     // $("#sex0").prop("checked",false);
                              //   }else if(data.sex==0) {
                              //     console.log("sex:0:::::"+data.sex);
                              //     // $("#sex0").attr("checked",true);
                              //     // $("#sex1").attr("checked",false);
                              //     // $("#sex2").attr("checked",false);
                              //     $("input:radio[value='0']").prop("checked",true);
                              //   }else {
                              //     console.log("sex:1:::::"+data.sex);
                              //     $("input:radio[value='1']").prop("checked",true);
                              // }

            $("#username").val(data.username);
            $("#password").val(data.password);
            $("#trueName").val(data.trueName);
            $("#phone").val(data.phone);
            $("#email").val(data.email);
                            form.render();
						}
					});
				}
        });
        //监听提交
        form.on('submit(demo2)', function(data){
        	if ("edit"==mark){
                $.ajax({
                    url:'/User/editUser?userId='+userId,
                    method:'post',
                    contentType:"application/json",
                    data:JSON.stringify(data.field),
                    dataType:'json',
                    success:function(result){
                        if (result){
                            layer.msg("修改成功！",{
                                icon:1,
                                time:1000
                            },function () {
                                window.location.href="<%=basePath%>/jsp/showUser.jsp";
                            });
                        }else{
                            return layer.msg('修改失败，请刷新页面重试！');
                        }
                    },
                    error: function(result) {
                        return layer.msg('修改失败，请刷新页面重试！');
                    }
                });
        	}else if ("add"==mark){
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
                            window.location.href="<%=basePath%>/jsp/showUser.jsp";
                        });
                    }else {
                        return layer.msg('修改失败，请刷新页面重试！');
                    }
                    

                },
                error: function(result) {
                        return layer.msg('修改失败，请刷新页面重试！');
                    }
            })
            }
            return false;
        });
    });
</script>

</body>
</html>

