<%--
  Created by IntelliJ IDEA.
  User: Shio
  Date: 2018/7/5
  Time: 10:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>error</title>
</head>
<body>
<dl class="layui-nav-child" id="imagesShow"></dl>
不好意思，刚刚您修改密码失败了，请点击<a href="login.jsp"><button>登录</button></a>重新登录！
</body>
<script type="text/javascript">
    window.onload(function requestData(){
        $.ajax({
            url: "/Material/show",
            type: "post",
            dataType: "json",
            success: function(data){
                /*这个方法里是ajax发送请求成功之后执行的代码*/
                showData(data);//我们仅做数据展示
            },
            error: function(msg){
                alert("ajax连接异常："+msg);
            }
        });
    });
    //展示数据
    function showData(data) {
        var str = "";//定义用于拼接的字符串
        for (var i = 0; i < data.length; i++) {
            //拼接表格的行和列
            str = "<tr><td>" + data[i].url + "</td></tr>";
            //追加到table中
            $("#imagesShow").append(str);         }
    }
</script>

</html>
