<%--<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">--%>
<!DOCTYPE html>
<%--不加会乱码--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    Object openids = request.getParameter("openids");
%>
<html>
<head>
    <meta charset="utf-8">
    <title>消息管理</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="../statics/plugins/layui/css/layui.css" media="all" />
</head>
<body>



<div class="demoTable" style="margin-top: 10px ;margin-left: 10px;position: relative;">
    <%--搜索关键词：--%>
        <blockquote class="layui-elem-quote">
    <div class="layui-inline">
        <input class="layui-input" name="username" id="demoReload" autocomplete="off" placeholder="请输入关键词">
    </div>
    <button id="searchBtn" class="layui-btn layui-btn-normal" data-type="reload"><i class="layui-icon">&#xe615;</i>  搜索</button>
      </blockquote>
      
</div>

<table class="layui-hide" id="allMessages" lay-filter="textMessage"></table>

<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-normal layui-btn-xs"  lay-event="modify"><i class="layui-icon">&#xe642;</i>发送消息</a>
    <%--<a class="layui-btn  layui-btn-danger layui-btn-xs" lay-event="del"><i class="layui-icon">&#xe640;</i>删除</a>--%>
</script>
<script src="../statics/plugins/layui/layui.js"></script>
<script>
    layui.use(['table','layer','form','element'], function(){
        var form = layui.form;
        var table = layui.table;
        var layer=layui.layer;
        var $=layui.jquery;
      var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块
        // var checkStatus = table.checkStatus('testReload');
  
  //监听导航点击
  element.on('nav(demo)', function(elem){
    //console.log(elem)
    layer.msg(elem.text());
  });
        //方法级渲染
        table.render({
            elem: '#allMessages'
            ,url: '/Message/getAllTextMessage'
            ,id: 'messageReload'
            ,page: true
            ,cols: [[
                // {checkbox: true, fixed: true},
                {type:'numbers',title:'序号',width:100}//自带排序列
                ,{field:'title', title: '标题', width:150}
                ,{field:'msgType', title: '消息类型', width:120}
                // ,{field:'createTime', title: '更新时间',templet: '#createTime', width:200}
                ,{ align:'center', title: '操作', toolbar: '#barDemo'}
            ]]
        });
        //工具条
        table.on('tool(textMessage)', function(obj){
            var data = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            var tr = obj.tr; //获得当前行 tr 的DOM对象
            if(obj.event === 'modify'){
                var openid = "<%=openids%>";
                var openids = [];
                openids[0]=openid;
                var messageId=data.baseID;
                var mark="message";
                if ("material"==mark) {
                    $.ajax({
                        url:'/Material/sendMaterial?messageId='+messageId+'&messageType=news',
                        method:'post',
                        contentType:"application/json",
                        data:JSON.stringify(openids),
                        dataType:'json',
                        success:function(result){
                            layer.msg(result.msg,{
                                icon:1,
                                time:1000
                            },function () {
                                parent.window.location.reload();
                            });
                        }
                    })
                }else if ("message"==mark) {
                    $.ajax({
                        url:'/Message/sendMessage?messageId='+messageId+'&messageType=text',
                        method:'post',
                        contentType:"application/json",
                        data:JSON.stringify(openids),
                        dataType:'json',
                        success:function(result){
                            layer.msg(result.msg,{
                                icon:1,
                                time:1000
                            },function () {
                                parent.window.location.reload();
                            });
                        }
                    })
                }
            }
        });

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

        }

        $('#searchBtn').on('click', function(){
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });
        $('.demoTable .layui-btn').on('click', function(){
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });

    });
</script>
<script id="createTime" type="text/html">
    {{createTime(d.createTime)}}
</script>
<script src="../statics/src/js/time.js"></script>
</body>
</html>