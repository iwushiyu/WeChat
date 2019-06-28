<%--<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">--%>
<!DOCTYPE html>
<%--不加会乱码--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    String messageId = request.getParameter("messageId");
    String messageType = request.getParameter("messageType");
    String mark = request.getParameter("mark");
%>
<html>
<head>
    <meta charset="utf-8">
    <title>layui</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="../statics/plugins/layui/css/layui.css" media="all" />
    <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body>
<div class="demoTable" style="margin-top: 10px ;margin-left: 10px">
    <%--搜索关键词：--%>
    <blockquote class="layui-elem-quote">
        <div class="layui-inline">
            <input class="layui-input" name="username" id="demoReload" autocomplete="off" placeholder="请输入粉丝昵称">
        </div>
        <button id="searchBtn" class="layui-btn layui-btn-normal" data-type="reload"><i class="layui-icon">&#xe615;</i>  搜索</button>
    </blockquote>
</div>

<table class="layui-hide" id="LAY_table_user" lay-filter="fansInfo"></table>
<!--<div class="layui-btn-group demoTable" style="height: 50px;width: 100%; position:relative;text-align: center; border: 1px solid black;">
    <button class="layui-btn" data-type="getCheckData" style=" position: relative;left: -10%%;top: 10px;">群发</button>
   <button class="layui-btn layui-btn-primary" lay-submit="" style=" position: relative;left: 5%;top: 10px;border: 1px solid black;" id="cancel">取消</button>
</div>-->
					<div class="layui-btn-group demoTable"  style="width: 100%;height: 50px;position:relative; float: left;">
				<button class="layui-btn" data-type="getCheckData" style="margin-bottom: 30px; position: relative;left: 30%;top: 30px;" id="closeIframe">确定</button>
				<button class="layui-btn layui-btn-primary" style="margin-bottom: 30px; position: relative;left: 40%;top: 30px;" id="cancel">取消</button>
			</div>
<script src="../statics/plugins/layui/layui.js"></script>

<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
    layui.use(['table','layer','form'], function(){
        var form = layui.form;
        var table = layui.table;
        var layer=layui.layer;
        var $=layui.jquery;
        var checkStatus = table.checkStatus('testReload');
        //方法级渲染
        table.render({
            elem: '#LAY_table_user'
            ,url: '/Fans/fansData'
            // ,contentType:"application/json"
            // ,response:{statusCode:200}
            ,cols: [[
                {checkbox: true, fixed: true},
                {type:'numbers',title:'序号',width:50}//自带排序列
                ,{field:'nickName', title: '昵称', width:100,unresize:true,sort: true}//是否禁用拖拽列宽（默认：false）。
                ,{field:'sex', title: '性别', width:60,templet: function(d){
                        if (d.sex==1){return "男"} else if (d.sex==2) {return "女"}else {return "未知"}
                    }}
                ,{field:'city', title: '城市', width:80,templet: function(d){
                        if (d.city==""){return "未知"}else {return d.city}
                    }}
                ,{field:'subscribeTime', title: '关注时间',templet:'#createTime'}
            ]]
            ,id: 'testReload'
            ,page: true
        });
        var $ = layui.$, active = {
            getCheckData: function () { //获取选中数据
                var checkStatus = table.checkStatus('testReload')
                    , data = checkStatus.data;
                var openids = [];
                for (var i = 0;i<data.length;i++){
                    openids[i]=data[i].openId;
                }
                var messageId = <%=messageId%>;
                var messageType ="<%=messageType%>";
                var mark ="<%=mark%>";

if ("material"==mark) {
    $.ajax({
        url:'/Material/sendMaterial?messageId='+messageId+'&messageType='+messageType,
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
        url:'/Message/sendMessage?messageId='+messageId+'&messageType='+messageType,
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
            },
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
        $('#cancel').on('click', function() {
			var index = parent.layer.getFrameIndex(window.name);
			parent.layui.layer.close(index);
		});
    });
</script>
<script id="createTime" type="text/html">
    {{createTime(d.subscribeTime)}}
</script>
<script src="../statics/src/js/time.js"></script>
</body>
</html>