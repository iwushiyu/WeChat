<%--
  Created by IntelliJ IDEA.
  User: Shio
  Date: 2018/6/19
  Time: 16:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/";
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <title>微信公众号管理平台</title>
  <link rel="shortcut icon" href="../favicon.ico">
  <link rel="Bookmark" href="../favicon.ico">
  <link rel="stylesheet" href="../statics/plugins/layui/css/layui.css" media="all" />
  <link rel="stylesheet" href="../statics/plugins/font-awesome/css/font-awesome.min.css" media="all" />
  <link rel="stylesheet" href="../statics/src/css/app.css" media="all" />
  <link rel="stylesheet" href="../statics/src/css/themes/default.css" media="all" id="skin" kit-skin />
  <link rel="icon" href="../statics/resource/images/favicon.ico" type="image/x-icon">
</head>

<body class="kit-theme">
  <div class="layui-layout layui-layout-admin kit-layout-admin">
    <div class="layui-header">
      <div class="layui-logo">微信管理平台</div>
      <div class="layui-logo kit-logo-mobile">K</div>
      <ul class="layui-nav layui-layout-left kit-nav">
        <li class="layui-nav-item"><a href="javascript:;" id="pay"><i class="fa fa-gratipay" aria-hidden="true"></i> 联系我们</a></li>
        <li class="layui-nav-item"><a href="javascript:;">当前公众号</a></li>
        <li class="layui-nav-item">
          <a href="javascript:;" class="achange" name="jspAccountName">${sessionScope.accountName}</a>
          <dl class="layui-nav-child" id="accountShow">
          </dl>
        </li>
      </ul>
      <ul class="layui-nav layui-layout-right kit-nav">
        <li class="layui-nav-item">
          <a href="javascript:;">
            <i class="layui-icon">&#xe63f;</i> 皮肤
          </a>
          <dl class="layui-nav-child skin">
            <dd><a href="javascript:;" data-skin="default" style="color:#393D49;"><i class="layui-icon">&#xe658;</i> 默认</a></dd>
            <dd><a href="javascript:;" data-skin="orange" style="color:#ff6700;"><i class="layui-icon">&#xe658;</i> 橘子橙</a></dd>
            <dd><a href="javascript:;" data-skin="green" style="color:#00a65a;"><i class="layui-icon">&#xe658;</i> 原谅绿</a></dd>
            <dd><a href="javascript:;" data-skin="pink" style="color:#FA6086;"><i class="layui-icon">&#xe658;</i> 少女粉</a></dd>
            <dd><a href="javascript:;" data-skin="blue.1" style="color:#00c0ef;"><i class="layui-icon">&#xe658;</i> 天空蓝</a></dd>
            <dd><a href="javascript:;" data-skin="red" style="color:#dd4b39;"><i class="layui-icon">&#xe658;</i> 枫叶红</a></dd>
          </dl>
        </li>
        <li class="layui-nav-item">
          <a href="javascript:;">
            <img src="http://m.zhengjinfan.cn/images/0.jpg" class="layui-nav-img"> ${sessionScope.systemUserSession.username}
          </a>
          <dl class="layui-nav-child">
            <dd><a href="javascript:;" kit-target data-options="{url:'<%=basePath%>/jsp/basic.jsp',icon:'&#xe658;',title:'基本资料',id:'966'}"><span>基本资料</span></a></dd>
          </dl>
        </li>
        <li class="layui-nav-item"><a href="/System/logout"><i class="fa fa-sign-out" aria-hidden="true"></i> 注销</a></li>
      </ul>
    </div>

    <div class="layui-side layui-bg-black kit-side">
      <div class="layui-side-scroll">
        <div class="kit-side-fold"><i class="fa fa-navicon" aria-hidden="true"></i></div>
        <ul class="layui-nav layui-nav-tree" lay-filter="kitNavbar" id="systemMenu" kit-navbar>
            <li class="layui-nav-item">
               <a href="javascript:;" data-url="<%=basePath%>/jsp/basic.jsp" data-icon="fa-user" data-title="个人信息" kit-target data-id='4' ><i class="fa fa-user" aria-hidden="true"></i><span> 个人信息</span></a>
            </li>
            <li class="layui-nav-item">
              <a href="javascript:;" data-options="{url:'<%=basePath%>/jsp/showAllMessage.jsp',icon:'&#xe6c6;',title:'消息管理', id:'5'}" kit-target><i class="layui-icon">&#xe628;</i><span> 消息管理</span></a>
            </li>
            <li class="layui-nav-item">
              <a href="javascript:;" data-url="<%=basePath%>/jsp/menu.jsp" data-icon="&#xe60f"  data-title="菜单管理" kit-target data-id='6'><i class="layui-icon ">&#xe60f;</i><span> 菜单管理</span></a>
            </li>
            <li class="layui-nav-item">
              <a href="javascript:;" data-url="<%=basePath%>/jsp/fans.jsp" data-icon="&#xe614" data-title="粉丝管理" kit-target  data-id='7'><i class="layui-icon">&#xe614;</i><span> 粉丝管理</span></a>
            </li>
            <li class="layui-nav-item">
              <a href="javascript:;"><i class="layui-icon layui-icon-console;" aria-hidden="true">&#xe665;</i><span> 素材管理</span></a>
                <dl class="layui-nav-child">
                    <dd>
                        <a href="javascript:;" data-url="<%=basePath%>/jsp/showNews.jsp" data-icon="&#xe663" data-title="图文管理" kit-target  data-id='8'><i class="layui-icon">&#xe663;</i><span> 图文管理</span></a>
                    </dd>
                    <dd>
                        <a href="javascript:;" data-url="<%=basePath%>/jsp/showImage.jsp" data-icon="&#xe64a;" data-title="图片管理" kit-target  data-id='9'><i class="layui-icon">&#xe64a;</i><span> 图片管理</span></a>
                    </dd>
                    <dd>
                        <a href="javascript:;" data-url="<%=basePath%>/jsp/showThumb.jsp" data-icon="&#xe64a;" data-title="封面管理" kit-target  data-id='12'><i class="layui-icon">&#xe64a;</i><span> 封面管理</span></a>
                    </dd>
                    <dd>
                        <a href="javascript:;" data-url="<%=basePath%>/jsp/showVideo.jsp" data-icon="&#xe6ed;" data-title="视频管理" kit-target  data-id='10'><i class="layui-icon">&#xe6ed;</i><span> 视频管理</span></a>
                    </dd>
                    <dd>
                        <a href="javascript:;" data-url="<%=basePath%>/jsp/showVoice.jsp" data-icon="&#xe6fc;" data-title="音频管理" kit-target  data-id='11'><i class="layui-icon">&#xe6fc;</i><span> 音频管理</span></a>
                    </dd>
                </dl>
            </li>
          <li class="layui-nav-item">
            <a href="javascript:;" kit-target data-options="{url:'https://www.baidu.com',icon:'&#xe658;',title:'百度一下', id:'32'}"><i class="layui-icon">&#xe658;</i><span> 百度一下</span></a>
          </li>
            <li class="layui-nav-item">
              <a href="javascript:;" data-options="{url:'<%=basePath%>/jsp/showWebsite.jsp',icon:'&#xe7ae;',title:'微官网管理', id:'62'}" kit-target><i class="layui-icon">&#xe7ae;</i><span> 微官网管理</span></a>
            </li>
            <%--<li class="layui-nav-item">--%>
            <%--<a href="javascript:;" data-options="{url:'<%=basePath%>/statics/website/websiteIndex.jsp',icon:'&#xe6c6;',title:'测试', id:'6'}" kit-target><i class="layui-icon">&#xe628;</i><span> 测试</span></a>--%>
            <%--</li>--%>
            <%--<li class="layui-nav-item">--%>
              <%--<a href="javascript:;" data-options="{url:'<%=basePath%>/jsp/selectUser.jsp',icon:'&#xe6c6;',title:'图片选择', id:'7'}" kit-target><i class="layui-icon">&#xe628;</i><span> 图片选择</span></a>--%>
            <%--</li>--%>
        </ul>
      </div>
    </div>
    <div class="layui-body" id="container">
      <iframe src="" id="ifram">
      <div style="padding: 15px;"><i class="layui-icon layui-anim layui-anim-rotate layui-anim-loop">&#xe63e;</i>
      </div>
      </iframe>
    </div>

    <div class="layui-footer">
      <!-- 底部固定区域 -->
      欢迎使用微信公众号管理平台！
    </div>
  </div>
  <script src="../statics/plugins/layui/layui.js"></script>
  <script>
    var message;
    layui.config({
      base: '../statics/src/js/',
      version: '1.0.1'
    }).use(['app', 'message'], function() {
      var app = layui.app,
        $ = layui.jquery,
        layer = layui.layer;
      //将message设置为全局以便子页面调用
      message = layui.message;
      //主入口
      app.set({
        type: 'iframe'
      }).init();
      $('#pay').on('click', function() {
        layer.open({
          title: false,
          type: 1,
          content: '<img src="../statics/src/images/pay.jpg" />',
          area: ['400px', '450px'],
          shadeClose: true
        });
      });
      $('dl.skin > dd').on('click', function() {
        var $that = $(this);
        var skin = $that.children('a').data('skin');
        switchSkin(skin);
      });
      var setSkin = function(value) {
          layui.data('kit_skin', {
            key: 'skin',
            value: value
          });
        },
        getSkinName = function() {
          return layui.data('kit_skin').skin;
        },
        switchSkin = function(value) {
          var _target = $('link[kit-skin]')[0];
          _target.href = _target.href.substring(0, _target.href.lastIndexOf('/') + 1) + value + _target.href.substring(_target.href.lastIndexOf('.'));
          setSkin(value);
        },
        initSkin = function() {
          var skin = getSkinName();
          switchSkin(skin === undefined ? 'default' : skin);
        }();
    });
  </script>
  <script type="text/javascript" src="../statics/src/js/jquery.min.js"></script>
  <script type="text/javascript">
      $(document).ready(function(){
          var obj ;
          var menu=${sessionScope.systemMenuList};
        var userRole=${sessionScope.systemUserRole};
          var d = ${sessionScope.accountSession};
          console.log(d);
          var accountNum = ${sessionScope.accountNum};
          console.log(d);
          $.each(menu, function (i, item) {
              var order=i;
              $("#systemMenu").prepend('<li class="layui-nav-item layui-nav-itemed" >'+item.menuDescribe+'</li>');
          });
          if(0==d.length){
              $(".achange").html("点击此处添加公众号");
          }else{
              $.each(d, function (i, item) {
                  $("#accountShow").append('<dd><a href="javascript:;" class = "d" id='+i+'>'+item.name+'</a></dd>');
              });
          }

          if (userRole.id!==3){
            $("#accountShow").append('<dd><a href="javascript:;" kit-target data-options="{url:\'<%=basePath%>/jsp/account.jsp\',icon:\'&#xe658;\',title:\'添加公众号\',id:\'96\'}">添加公众号</a></dd>')
          }
           $(".d").click(function(){
              var accountName = $(this).html();
              $(".achange").html(accountName);
              $.ajax({
                          url: '/System/getaccountName',
                          type:'post',
                          data:{accountName:accountName},
                          success:function(res){
                            window.location.href="<%=basePath%>/jsp/index.jsp"
                          }
                      });
          });
      });
  </script>

</body>

</html>