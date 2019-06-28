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
    <title>消息管理</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="../statics/plugins/layui/css/layui.css" media="all" />
    <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body>
<form lay-filter="example" id="form1"  class="layui-form layui-form-pane" action="" style="margin-left: 6px;display: none">
    <div class="layui-form-item">
        <label class="layui-form-label">标题</label>
        <div class="layui-input-block">
            <input type="text" id="title" name="Title" lay-verify="required|title" autocomplete="off" placeholder="请输入标题" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">关键词</label>
        <div class="layui-input-inline">
            <input type="text" id="inputCode" name="InputCode" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item" style="display: none">
        <label class="layui-form-label">id</label>
        <div class="layui-input-inline">
            <input type="text" id="baseID" name="baseID" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">消息描述</label>
        <div class="layui-input-block">
            <textarea name="Content" id="content" placeholder="请输入内容" class="layui-textarea" required lay-verify="required|content"></textarea>
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
        <input class="layui-input" name="username" id="demoReload" autocomplete="off" placeholder="请输入关键词">
    </div>
    <button id="searchBtn" class="layui-btn layui-btn-normal" data-type="reload"><i class="layui-icon">&#xe615;</i>  搜索</button>
    <div class="layui-inline " style="float: right;margin-right: 40px">
        <button id="addBtn" class="layui-btn "  data-type="reload"><i class="layui-icon">&#xe608;</i> 添加</button>
    </div>
            </blockquote>
</div>

<table class="layui-hide" id="LAY_table_user" lay-filter="textMessage"></table>

<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-normal layui-btn-xs"  lay-event="modify"><i class="layui-icon">&#xe642;</i>修改</a>
    <a class="layui-btn  layui-btn-danger layui-btn-xs" lay-event="del"><i class="layui-icon">&#xe640;</i>删除</a>
    <a class="layui-btn layui-btn-xs" lay-event="send"><i class="layui-icon">&#xe770;</i>群发</a>
    <%--<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="mass">群发</a>--%>
</script>
<script src="../statics/plugins/layui/layui.js"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
    layui.use(['table','layer','form'], function(){
        var form = layui.form;
        var table = layui.table;
        var layer=layui.layer;
        var $=layui.jquery;
        //方法级渲染
        table.render({
            elem: '#LAY_table_user'
            ,url: '/Message/textData'
            ,id: 'testReload'
            ,height: 400
            ,page: true
            // ,contentType:'application/json'
            // ,response:{statusCode:200}
            ,cols: [[
                // {checkbox: true, fixed: true},
                {type:'numbers',title:'序号',width:100}//自带排序列
                ,{field:'title', title: '标题', width:100,unresize:true,sort: true}//是否禁用拖拽列宽（默认：false）。
                ,{field:'inputCode', title: '关键词', width:100}
                ,{field:'content', title: '消息描述', width:250}
                ,{field:'createTime', title: '更新时间',templet: '#createTime', width:200}
                ,{ align:'center',title: '管理操作',  toolbar: '#barDemo'}
            ]]
        });


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
//        //新增
        $('#addBtn').on('click', function() {
            layer.open({
                title:'新增',
                type: 2,
                area: ['470px', '430px'],
                skin: 'layui-layer-rim', //加上边框
                content: '/Message/addtext'
            });
        });

        //工具条
        table.on('tool(textMessage)', function(obj){
            var data = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            var tr = obj.tr; //获得当前行 tr 的DOM对象
            if(obj.event === 'modify'){
                EidtUv(data,obj);
            } else if(obj.event === 'del'){
                layer.confirm('真的删除行么', function(index){
                    console.log(data);
                    $.ajax({
                        url: "/Message/deleteTextMessage",
                        type: "POST",
                        contentType:"application/json",
                        data:JSON.stringify(data),
                        dataType: "json",
                        success: function(res){
                            if(res==1){
                                obj.del();
                                layer.close(index);
                                layer.msg("删除成功", {icon: 6,time:1000});
                            }else{
                                layer.msg("删除失败", {icon: 5});
                            }
                        }

                    });
                });
            } else if(obj.event === 'send'){
                    $.ajax({
                        url: "/Message/TextMsg",
                        type: "POST",
                        contentType: "application/json",
                        data: JSON.stringify(data),
                        dataType: "json",
                    });
                layer.open({
                    title:'群发文本消息',
                    type: 2,
                    area: ['600px', '430px'],
//                shadeClose: false,
//                maxmin: false,
                    skin: 'layui-layer-rim', //加上边框
                    <%--content: '<%=basePath %>jsp/addtext.jsp'--%>
                    content: '/Message/sendTextMsg'
                });
            }
        });

        $('.demoTable .layui-btn').on('click', function(){
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });
        function  EidtUv(data,obj) {
            $("#title").val(data.title);
            $("#inputCode").val(data.inputCode);
            $("#content").val(data.content);
           $("#baseID").val(data.baseID);
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
                url:'/Message/editTextMessage',
                async:true,
                dataType: "json",
                data:$('#form1').serializeArray(),
                    success:function(result){
                    layer.msg(result.msg,{
                        icon:1,
                        time:1000
                    },function () {
                       parent.window.location.reload();    //刷新父页面，一举两得，即传入新加入的数据，又关闭弹出层
                    });

                }
            });
        })
    });
</script>
<script src="../statics/src/js/time.js"></script>
<script id="createTime" type="text/html">
    {{createTime(d.createTime)}}
</script>
</body>
</html>