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

<div class="demoTable" style="margin-top: 10px ;margin-left: 10px">
    <%--搜索关键词：--%>
    <blockquote class="layui-elem-quote">
        <div class="layui-inline">
            <input class="layui-input" name="username" id="demoReload" autocomplete="off" placeholder="请输入用户名">
        </div>
        <button id="searchBtn" class="layui-btn layui-btn-normal" data-type="reload"><i class="layui-icon">&#xe615;</i>  搜索</button>

    </blockquote>
</div>

<table class="layui-hide" id="LAY_table_user" lay-filter="userInfo"></table>
<div class="layui-btn-group demoTable"  style="width: 100%;height: 50px;position:relative; float: left;">
    <button class="layui-btn" data-type="getCheckData" style="margin-bottom: 30px; position: relative;left: 30%;top: 30px;" id="closeIframe">确定</button>
    <button class="layui-btn layui-btn-primary" style="margin-bottom: 30px; position: relative;left: 40%;top: 30px;" id="cancel">取消</button>
</div>
<script  type="text/javascript" src="../statics/plugins/layui/layui.js"></script>
<script type="text/javascript">
    layui.use(['table','layer','laydate','form'], function(){
        var form = layui.form;
        var table = layui.table;
        var laydate= layui.laydate;
        var layer=layui.layer;
        var $=layui.jquery;
        var checkStatus = table.checkStatus('testReload');
        //方法级渲染
        table.render({
            elem: '#LAY_table_user'
            ,url: '/User/selectUser'

            ,cols: [[
                {checkbox: true, fixed: true},
                {type:'numbers',title:'序号',width:70}//自带排序列
                ,{field:'username', title: '用户名', width:120,unresize:true,sort: true}//是否禁用拖拽列宽（默认：false）。
                // ,{field:'password', title: '密码', width:150}
                ,{field:'trueName', title: '真实姓名', width:100}
                // ,{field:'sex', title: '性别', width:80,templet: function(d){
                //         if (d.sex==1){return "男"} else if (d.sex==2) {return "女"}else {return "未知"}
                //     }}
                ,{field:'phone', title: '电话', width:120}
                ,{field:'email', title: '邮箱', width:180}
                ,{field:'information', title: '用户身份', width:120,templet: function(d){
                        return d.role.roleDescribe
                    }}
                // ,{field:'createTime', title: '创建时间', width:120,templet: function(d){
                //         return layui.laytpl.toDateString(d.createTime)
                //     }}

            ]]
            ,id: 'testReload'
            ,page: true
        });

        // var $ = layui.$, active = {
        //     getCheckData: function () { //获取选中数据
        //         var checkStatus = table.checkStatus('testReload')
        //             , data = checkStatus.data;
        //         var userIds = [];
        //         for (var i = 0;i<data.length;i++){
        //             userIds[i]=data[i].id;
        //         }
        //         $.ajax({
        //             url:'/User/addOldUser',
        //             method:'post',
        //             contentType:"application/json",
        //             data:JSON.stringify(userIds),
        //             dataType:'json',
        //             success:function(result){
        //                 layer.msg(result.msg,{
        //                     icon:1,
        //                     time:1000
        //                 },function () {
        //                     parent.window.location.reload();
        //                 });
        //             }
        //         })
        //     },
        //     reload: function(){
        //         var demoReload = $('#demoReload');
        //         //执行重载
        //         table.reload('testReload', {
        //             page: {
        //                 curr: 1 //搜索显示结果重新从第 1 页开始
        //             }
        //             ,where: {
        //                 keyword: demoReload.val()
        //             }
        //         });
        //     }
        //
        // }
        $('.demoTable').on('click', function(){
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });

        $('#closeIframe').on('click', function() {
            var index = parent.layer.getFrameIndex(window.name);
            var checkStatus = table.checkStatus('testReload')
                , data = checkStatus.data;
            var userIds = [];
            for (var i = 0;i<data.length;i++){
                userIds[i]=data[i].id;
            }
            $.ajax({
                url:'/User/addOldUser',
                method:'post',
                contentType:"application/json",
                data:JSON.stringify(userIds),
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
            window.parent.location.reload();
            parent.layui.layer.close(index);
            // reload: function(){
            //     var demoReload = $('#demoReload');
            //     //执行重载
            //     table.reload('testReload', {
            //         page: {
            //             curr: 1 //搜索显示结果重新从第 1 页开始
            //         }
            //         ,where: {
            //             keyword: demoReload.val()
            //         }
            //     });
            // }
        });

        $('#cancel').on('click', function() {
            var index = parent.layer.getFrameIndex(window.name);
            parent.layui.layer.close(index);
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




    });
</script>
<script id="createTime" type="text/html">
    {{createTime(d.createTime)}}
</script>
<script src="../statics/src/js/time.js"></script>
</body>
</html>