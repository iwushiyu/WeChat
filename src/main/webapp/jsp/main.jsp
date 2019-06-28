<%--
  Created by IntelliJ IDEA.
  User: 吴仕宇
  Date: 2018/6/23
  Time: 16:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>添加消息</title>
    <link rel="stylesheet" href="../statics/plugins/layui/css/layui.css">
    <link rel="stylesheet" href="../statics/src/css/main.css">
</head>
<body>
<div style="margin-left: 15px;margin-top: 15px; ">
    <h1 class="site-h1" style="color: #2E2D3C;">欢迎使用 - 享轻微信公众号管理平台</h1>
    <hr style="margin-top: 20px">
    <blockquote class="layui-elem-quote" style="margin-top: 15px">本项目是一个完整的微信公众号web操作版，采用最流行的Spring语言，来实现多公众号的管理。让用户不再用关心微信的底层接口，直接使用页面进行操作，简单方便。</blockquote>

    <div class="hugh-main" style=" border-style: none;border-width: 10px; width: auto;height: 400px;"></div>
    <div style="margin-top: 20px">
        <fieldset class="layui-elem-field layui-field-title">
            <legend><h3>功能模块</h3></legend>
        </fieldset>
        <ul class="layui-timeline" >

            <li class="layui-timeline-item">
                <i class="layui-icon layui-timeline-axis">&#xe63f;</i>
                <div class="layui-timeline-content layui-text">
                    <h3 class="layui-timeline-title">用户管理</h3>
                    <p>
                        不同用户不同使用权限
                        <%--<br>不枉近百个日日夜夜与之为伴。因小而大，因弱而强。--%>
                        <%--<br>无论它能走多远，抑或如何支撑？至少我曾倾注全心，无怨无悔 <i class="layui-icon"></i>--%>
                    </p>
                </div>
            </li>

            <li class="layui-timeline-item">
                <i class="layui-icon layui-timeline-axis">&#xe63f;</i>
                <div class="layui-timeline-content layui-text">
                    <h3 class="layui-timeline-title">账号信息</h3>
                    <%--<p>--%>
                        <%--绑定公众号信息--%>
                        <%--&lt;%&ndash;<br>不枉近百个日日夜夜与之为伴。因小而大，因弱而强。&ndash;%&gt;--%>
                        <%--&lt;%&ndash;<br>无论它能走多远，抑或如何支撑？至少我曾倾注全心，无怨无悔 <i class="layui-icon"></i>&ndash;%&gt;--%>
                    <%--</p>--%>
                    <ul>
                        <li>绑定公众号信息</li>
                        <li>多个公众号切换</li></li>
                    </ul>
                </div>
            </li>
            <li class="layui-timeline-item">
                <i class="layui-icon layui-timeline-axis">&#xe63f;</i>
                <div class="layui-timeline-content layui-text">
                    <h3 class="layui-timeline-title">文本信息</h3>
                    <%--<p>杜甫的思想核心是儒家的仁政思想，他有“<em>致君尧舜上，再使风俗淳</em>”的宏伟抱负。个人最爱的名篇有：</p>--%>
                    <ul>
                        <li>新建消息</li>
                        <li>搜索消息</li>
                        <li>消息发送</li>
                    </ul>
                </div>
            </li>
            <li class="layui-timeline-item">
                <i class="layui-icon layui-timeline-axis">&#xe63f;</i>
                <div class="layui-timeline-content layui-text">
                    <h3 class="layui-timeline-title">粉丝管理</h3>
                    <%--<p>--%>
                        <%--中国人民抗日战争胜利72周年--%>
                        <%--<br>常常在想，尽管对这个国家有这样那样的抱怨，但我们的确生在了最好的时代--%>
                        <%--<br>铭记、感恩--%>
                        <%--<br>所有为中华民族浴血奋战的英雄将士--%>
                        <%--<br>永垂不朽--%>
                    <%--</p>--%>
                    <ul>
                        <li>批量同步粉丝</li>
                        <li>单个粉丝同步</li>
                        <li>发送文本消息和图文消息</li>
                    </ul>
                </div>
            </li>
            <li class="layui-timeline-item">
                <i class="layui-icon layui-timeline-axis">&#xe63f;</i>
                <div class="layui-timeline-content layui-text">
                    <h3 class="layui-timeline-title">未完待续...</h3>
                    <%--<div class="layui-timeline-title">过去</div>--%>
                </div>
            </li>
        </ul>
    </div>
</div>

<script src="../statics/plugins/layui/layui.js"></script>
</body>
</html>
