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
    <title>layui</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="../statics/plugins/layui/css/layui.css" media="all" />
    <style>
        img.fans-portrait{
            width:50px;
            height:50px;
        }
        .fsh-rightPanel .layui-table-body .layui-table-cell {
            height: 50px;
            line-height: 50px;
        }
    </style>
    <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
    <%--<style type="text/css">--%>
    <%--.laytable-cell-1-picurl{--%>
    <%--height: 100%;--%>
    <%--max-width: 100%;--%>
    <%--}--%>
    <%--</style>--%>
</head>
<body>
<div class="fsh-rightPanel">
    <div class="demoTable" style="margin-top: 10px ;margin-left: 10px ">
        <%--搜索关键词：--%>
        <blockquote class="layui-elem-quote">
            <div class="layui-inline">
                <input class="layui-input" name="username" id="demoReload" autocomplete="off" placeholder="请输入关键词">
            </div>
            <button id="searchBtn" class="layui-btn layui-btn-normal" data-type="reload"><i class="layui-icon">&#xe615;</i>搜索</button>

            <div class="layui-inline " style="float: right;margin-right: 5px">
                <button class="layui-btn btn-danger" id="fans_sync">批量同步粉丝</button>
            </div>
        </blockquote>
    </div>

    <table class="layui-hide" id="LAY_table_user" lay-filter="fansInfo"></table>
</div>

<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-normal layui-btn-xs"  lay-event="sync"><i class="layui-icon">&#xe642;</i>同步粉丝信息</a>

    <a class="layui-btn layui-btn-xs" lay-event="mass"><i class="layui-icon">&#xe770;</i>发送消息</a>
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

            elem: '#LAY_table_user',
            url: '/Fans/fansData',
            align: "center",
//            toolbar: '#barDemo',
            // ,contentType:"application/json"
            // ,response:{statusCode:200}
            cols: [[
                {type: 'checkbox'},
                {type:'numbers',title:'序号',width:50,}//自带排序列
                ,{field:'nickName', title: '昵称',width:150,align: 'center'}//是否禁用拖拽列宽（默认：false）。
                ,{field:'headImgUrl', title: '头像',width:80,align: 'center',templet:function (d) {
                        return "<img class='fans-portrait' src=" + d.headImgUrl + " />"
                    }}
                ,{field:'sex', title: '性别', width:100,templet: function(d){
                        if (d.sex==1){return "男"} else if (d.sex==2) {return "女"}else {return "未知"}
                    }}
                ,{field:'city', title: '城市', width:100,templet: function(d){
                        if (d.city==""){return "未知"}else {return d.city}
                    }}
                ,{field:'subscribeTime', title: '关注时间', width: 180, align: 'center',templet:'#createTime'}
                ,{ align:'center',title: '管理粉丝操作',  toolbar: '#barDemo'}

            ]]
            ,id: 'testReload'
            ,page: true
//            ,height: 1000
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


        // 批量同步粉丝
        $("#fans_sync").click(function () {
            layer.confirm('确认同步粉丝？', {
                icon: 7,
                title: "提示",
                btn: ['确认', '取消'] //按钮
            }, function () {
                $.ajax({
                    url: '/wxapi/syncAccountFansList',
                    success: function (result) {
                        if (result.success) {
                            layer.msg("同步成功");
                            reloadTable(tableObj);
                        }
                    },
                    error: function () {
                        layer.msg("同步异常");
                    }
                })
            }, function () {
                layer.closeAll();
            });
        });


        //表格内部操作按钮监听
        table.on('tool(fansInfo)', function (obj) { //注：tool是工具条事件名，mainList是table原始容器的属性 lay-filter="对应的值"
            var data = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值
            //发送消息
            var openids=data.openId;
            // openids.push(data.openId);
            if (layEvent === 'mass') {
                layer.open({
                    title:'群发文本消息',
                    type: 2,
                    area: ['650px', '430px'],
//                shadeClose: false,
//                maxmin: false,
                    skin: 'layui-layer-rim', //加上边框
                    content: './selectTextMessage.jsp?openids='+openids
                });
            }
            // 同步粉丝
            if (layEvent === 'sync') {
                layer.confirm('确认同步该粉丝？', {
                    icon: 7,
                    title: "提示",
                    btn: ['确认', '取消'] //按钮
                },function () {
                    $.ajax({
                        url: '/Fans/syncAccountFans',
                        method:'post',
                        data:{openId:data.openId},
                        success: function (result) {
                            if (result) {
                                window.location.href="./fans.jsp";
                            }else {
                                layer.msg("请重试");
                            }
                        },
                        error: function () {
                            layer.msg("同步异常");
                        }
                    })
                })

            }
        });
    });
</script>
<script id="createTime" type="text/html">
    {{createTime(d.subscribeTime)}}
</script>
<script src="../statics/src/js/time.js"></script>
</body>
</html>