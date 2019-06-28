<%--<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">--%>
<!DOCTYPE html>
<%--不加会乱码--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <meta charset="utf-8">
    <title>用户管理</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="../statics/plugins/layui/css/layui.css" media="all" />
</head>
<body>
<form lay-filter="example" id="form1"  class="layui-form layui-form-pane" action="" style="margin-left: 6px;display: none">
    <div class="layui-form-item">
        <label class="layui-form-label">用户名</label>
        <div class="layui-input-block">
            <input type="text" id="username" name="username" lay-verify="required" autocomplete="off" placeholder="请输入用户名" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">密码</label>
        <div class="layui-input-block">
            <input type="text" id="password" name="password" lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">真实姓名</label>
        <div class="layui-input-block">
            <input type="text" id="true_name" name="true_name" lay-verify="required" placeholder="请输入真实姓名" autocomplete="off" class="layui-input">
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
            <input type="text" id="phone" name="phone"  lay-verify="required" placeholder="请输入电话号码" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item ">
        <label class="layui-form-label">邮箱</label>
        <div class="layui-input-block">
            <input type="text" id="email" name="email"  placeholder="请输入邮箱地址" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item" style="display: none" >
        <label class="layui-form-label">id</label>
        <div class="layui-input-inline">
            <input type="text" id="id" name="id" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <button class="layui-btn"  lay-filter="demo2" id="xiugai">提交修改</button>
        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
    </div>
</form>

<div class="demoTable" style="margin-top: 10px ;margin-left: 10px">
    <%--搜索关键词：--%>
        <blockquote class="layui-elem-quote">
    <div class="layui-inline">
        <input class="layui-input" name="username" id="demoReload" autocomplete="off" placeholder="请输入用户名">
    </div>
    <button id="searchBtn" class="layui-btn layui-btn-normal" data-type="reload"><i class="layui-icon">&#xe615;</i>  搜索</button>
            <div class="layui-inline " style="float: right;margin-right: 40px">
                <button id="addOldBtn" class="layui-btn "  data-type="reload" ><i class="layui-icon">&#xe608;</i> 添加其他公众号中已有用户</button>
            </div>
    <div class="layui-inline " style="float: right;margin-right: 40px">
       <button id="addBtn" class="layui-btn "  data-type="reload" ><i class="layui-icon">&#xe608;</i> 添加新用户</button>
    </div>
            </blockquote>
</div>

<table class="layui-hide" id="LAY_table_user" lay-filter="userInfo"></table>

<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-normal layui-btn-xs"  lay-event="modify"><i class="layui-icon">&#xe642;</i>修改</a>
    <a class="layui-btn  layui-btn-danger layui-btn-xs" lay-event="del"><i class="layui-icon">&#xe640;</i>删除</a>
</script>
<script  type="text/javascript" src="../statics/plugins/layui/layui.js"></script>
<script type="text/javascript">
    layui.use(['table','layer','laydate','form'], function(){
        var form = layui.form;
        var table = layui.table;
        var laydate= layui.laydate;
        var layer=layui.layer;
        var $=layui.jquery;
        var d = <%=session.getAttribute("accountSession")%>;
        //方法级渲染
        table.render({
            elem: '#LAY_table_user'
            ,url: '/User/userData'
            ,id: 'testReload'
            ,page: true
            ,cols: [[
                // {checkbox: true, fixed: true},
                {type:'numbers',title:'序号',width:70}//自带排序列
                ,{field:'username', title: '用户名', width:120,unresize:true,sort: true}//是否禁用拖拽列宽（默认：false）。
                ,{field:'password', title: '密码', width:150}
//                ,{field:'trueName', title: '真实姓名', width:100}
//                ,{field:'sex', title: '性别', width:80,templet: function(d){
//                    if (d.sex==1){return "男"} else if (d.sex==2) {return "女"}else {return "未知"}
//                    }}
                ,{field:'phone', title: '电话', width:140}
                ,{field:'email', title: '邮箱', width:180}
                ,{field:'information', title: '用户身份', width:120,templet: function(d){
                        return d.role.roleDescribe
                    }}
//                ,{field:'createTime', title: '创建时间', width:120,templet: function(d){
//                        return layui.laytpl.toDateString(d.createTime)
//                    }}
                ,{ align:'center', title: '管理用户操作', toolbar: '#barDemo'}
            ]]
        });
//时间戳的处理
layui.laytpl.toDateString = function(d, format){
var date = new Date(d || new Date())
,ymd = [
this.digit(date.getFullYear(), 4)
,this.digit(date.getMonth() + 1)
,this.digit(date.getDate())
]
,hms = [
this.digit(date.getHours())
,this.digit(date.getMinutes())
,this.digit(date.getSeconds())
];

format = format || 'yyyy-MM-dd';

return format.replace(/yyyy/g, ymd[0])
.replace(/MM/g, ymd[1])
.replace(/dd/g, ymd[2])
};

//数字前置补零
layui.laytpl.digit = function(num, length, end){
var str = '';
num = String(num);
length = length || 2;
for(var i = num.length; i < length; i++){
str += '0';
}
return num < Math.pow(10, length) ? str + (num|0) : num;
};


        //重载实现搜索
        var $ = layui.$, active = {
            reload: function(){
                var demoReload = $('#demoReload');

                //执行重载
                table.reload('testReload', {
                    page: {
                        curr: 1 //搜索显示结果重新从第 1 页开始
                    }
                    ,where: {
                        keyword: demoReload.val()

                    }
                });
            }
        };

        $('#searchBtn').on('click', function(){
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });

        $('#addBtn').on('click', function(){
            if(0==d.length){
                layer.msg("请先添加公众号！");
            }else{
                window.location.href= "<%=basePath%>/jsp/editUser.jsp?mark=add&userId=0";
            }
        });
        $('#addOldBtn').on('click', function(){
            if(0==d.length){
                layer.msg("请先添加公众号！");
            }else{
                layer.open({
                    title:'群发文本消息',
                    type: 2,
                    area: ['800px', '430px'],
//                shadeClose: false,
//                maxmin: false,
                    skin: 'layui-layer-rim', //加上边框

                    content: '<%=basePath%>/jsp/selectUser.jsp'
                });

            }
        });


        //工具条
        table.on('tool(userInfo)', function(obj){
            var data = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            var tr = obj.tr; //获得当前行 tr 的DOM对象
            if(obj.event === 'modify'){
                console.log(data.id);
                console.log(data.toString());
            	  window.location.href="<%=basePath%>/jsp/editUser.jsp?mark=edit&userId="+data.id;
//              EidtUv(data,obj);
            } else if(obj.event === 'del'){
                layer.confirm('真的删除行么', function(index){
                    console.log(data);
                    $.ajax({
                        url: "/User/deleteSystemUser",
                        type: "POST",
                        contentType:"application/json",
                        data:JSON.stringify(data),
                        dataType: "json",
                        success: function(res){
                            if(res==1){
                                window.location.href="<%=basePath%>/jsp/showUser.jsp";
                            }else{
                                layer.msg("删除失败，请刷新页面重试！", {icon: 5});
                            }
                        }
                    });
                });
            } else if(obj.event === 'post'){
            }
        });

        $('.demoTable .layui-btn').on('click', function(){
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });
        function  EidtUv(data,obj) {

          if (data.sex==2) {
              $("input[type=‘radio’][name=sex][value=‘2’]").attr("checked",true);
              // $("#sex").attr("checked",true)
          }
            $("#username").val(data.username);
            $("#password").val(data.password);
            $("#true_name").val(data.trueName);
            $("#phone").val(data.phone);
            $("#email").val(data.email);
            $("#information").val(data.role.roleDescribe);
            $("#id").val(data.id);
            layer.open({
                title:'修改信息',
                type:1,
                area:['400px','400px'],
                content:$("#form1")
            });
        }
            form.verify({
                title: function(value){
                    if(value.length < 5){
                        return '标题至少得5个字符呀';
                    }
                }
                ,pass: [/(.+){6,12}$/, '密码必须6到12位']
                ,content: function(value){
                    layedit.sync(editIndex);
                }
            });
        $('#xiugai').on('click',function () {
            $.ajax({
                type:"post",
                url:'/User/editSystemUser',
                async:true,
                dataType: "json",
                data:$('#form1').serializeArray(),
                success:function(result){
                    layer.msg("修改成功",{
                        icon:1,
                        time:1000
                    },function () {
                       parent.window.location.reload();
                    });

                }
            });
        })
    });
</script>
<script id="createTime" type="text/html">
    {{createTime(d.createTime)}}
</script>
<script src="../statics/src/js/time.js"></script>
</body>
</html>