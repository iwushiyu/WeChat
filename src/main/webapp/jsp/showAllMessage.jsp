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
</head>
<body>

<form lay-filter="textMessage" id="showTextMessage"  class="layui-form layui-form-pane" action="" style="margin-left: 6px;display: none">
    <div class="layui-form-item">
        <label class="layui-form-label">标题：</label>
        <div class="layui-input-block">
        	  <label class="layui-form-label" style="background-color: transparent;border: none; text-align: left;"><span id="text-title"></span></label>
        </div>
    </div>
     <div class="layui-form-item">
        <label class="layui-form-label">消息类型：</label>
        <div class="layui-input-inline">
          <label class="layui-form-label"  style="background-color: transparent;border: none; text-align: left;"><span >文本消息</span></label>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">关键词：</label>
        <div class="layui-input-inline">
          <label class="layui-form-label"  style="background-color: transparent;border: none; text-align: left;"><span id="text-inputCode"></span></label>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">消息描述：</label>
        <div class="layui-input-block">
        	<textarea name="Content" id="text-content"  disabled="disabled" style="border: none;overflow-y:visible; text-align: left;" class="layui-textarea" required lay-verify="required|content"></textarea>
        </div>
    </div>
</form>


<form lay-filter="imageMessage" id="showImageMessage"  class="layui-form layui-form-pane" action="" style="margin-left: 6px;display: none">
    <div class="layui-form-item">
        <label class="layui-form-label">标题：</label>
        <div class="layui-input-block">
        	  <label class="layui-form-label" style="background-color: transparent;border: none; text-align: left;"><span id="image-title"></span></label>
        </div>
    </div>
     <div class="layui-form-item">
        <label class="layui-form-label">消息类型：</label>
        <div class="layui-input-inline">
          <label class="layui-form-label"  style="background-color: transparent;border: none; text-align: left;"><span >图片消息</span></label>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">关键词：</label>
        <div class="layui-input-inline">
          <label class="layui-form-label"  style="background-color: transparent;border: none; text-align: left;"><span id="image-inputCode"></span></label>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">图片名称：</label>
        <div class="layui-input-inline">
          <label class="layui-form-label"  style="background-color: transparent;border: none; text-align: left;"><span id="imageName">无图片</span></label>
        </div>
    </div>
     <div class="layui-form-item">
        <label class="layui-form-label">图片内容：</label>
        <div class="show-image"><img id="image-content" alt="图片不存在，请修改图片" style="width: 160px; height: 120px;" src=""></div>
    </div>
</form>

<form lay-filter="newsMessage" id="showNewsMessage"  class="layui-form layui-form-pane" action="" style="margin-left: 6px;display: none">
    <div class="layui-form-item">
        <label class="layui-form-label">标题：</label>
        <div class="layui-input-block">
        	  <label class="layui-form-label" style="background-color: transparent;border: none; text-align: left;"><span id="news-title"></span></label>
        </div>
    </div>
     <div class="layui-form-item">
        <label class="layui-form-label">消息类型：</label>
        <div class="layui-input-inline">
          <label class="layui-form-label"  style="background-color: transparent;border: none; text-align: left;"><span >图文消息</span></label>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">关键词：</label>
        <div class="layui-input-inline">
          <label class="layui-form-label"  style="background-color: transparent;border: none; text-align: left;"><span id="news-inputCode"></span></label>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">图文标题：</label>
        <div class="layui-input-inline">
          <label class="layui-form-label"  style="background-color: transparent;border: none; text-align: left;"><span id="newsTitle">无图文</span></label>
        </div>
    </div>
     <div class="layui-form-item">
        <label class="layui-form-label">封面：</label>
        <div class="show-image"><img id="news-content" alt="封面不存在，请修改封面" style="width: 160px; height: 120px;border: 1px solid blue;" src=""></div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">描述：</label>
        <div class="layui-input-inline">
        		<textarea name="Content" id="news-digest"  disabled="disabled" style="border: none;overflow-y:visible; text-align: left;" class="layui-textarea" required lay-verify="required|content">无图文</textarea>
        </div>
    </div>
    
</form>

<form lay-filter="videoMessage" id="showVideoMessage"  class="layui-form layui-form-pane" action="" style="margin-left: 6px;display: none">
    <div class="layui-form-item">
        <label class="layui-form-label">标题：</label>
        <div class="layui-input-block">
        	  <label class="layui-form-label" style="background-color: transparent;border: none; text-align: left;"><span id="video-title"></span></label>
        </div>
    </div>
     <div class="layui-form-item">
        <label class="layui-form-label">消息类型：</label>
        <div class="layui-input-inline">
          <label class="layui-form-label"  style="background-color: transparent;border: none; text-align: left;"><span >视频消息</span></label>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">关键词：</label>
        <div class="layui-input-inline">
          <label class="layui-form-label"  style="background-color: transparent;border: none; text-align: left;"><span id="video-inputCode"></span></label>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">视频标题：</label>
        <div class="layui-input-inline">
          <label class="layui-form-label"  style="background-color: transparent;border: none; text-align: left;"><span id="videoTitle">无视频</span></label>
        </div>
    </div>
     <div class="layui-form-item">
        <label class="layui-form-label">视频：</label>
        <div class="show-video"><video width="220px" height="130px" controls="controls">
							<source id="video-content" src="" type="video/mp4">Your browser does not support the video tag.</video>		</div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">视频描述：</label>
        <div class="layui-input-inline">
        		<textarea name="Content" id="video-introduction"  disabled="disabled" style="border: none;overflow-y:visible; text-align: left;" class="layui-textarea" required lay-verify="required|content">无视频</textarea>
        </div>
    </div>
    
</form>


<form lay-filter="voiceMessage" id="showVoiceMessage"  class="layui-form layui-form-pane" action="" style="margin-left: 6px;display: none">
    <div class="layui-form-item">
        <label class="layui-form-label">标题：</label>
        <div class="layui-input-block">
            <label class="layui-form-label" style="background-color: transparent;border: none; text-align: left;"><span id="voice-title"></span></label>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">消息类型：</label>
        <div class="layui-input-inline">
            <label class="layui-form-label"  style="background-color: transparent;border: none; text-align: left;"><span >语音消息</span></label>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">关键词：</label>
        <div class="layui-input-inline">
            <label class="layui-form-label"  style="background-color: transparent;border: none; text-align: left;"><span id="voice-inputCode"></span></label>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">语音标题：</label>
        <div class="layui-input-inline">
            <label class="layui-form-label"  style="background-color: transparent;border: none; text-align: left;"><span id="voiceTitle">无音频</span></label>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">语音：</label>
        <div class="show-voice">
            <audio controls="controls" style="width: 250px;height: 40px;"><source src="" id="voice-content" type="audio/mpeg">Your browser does not support the audio tag.</audio>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">语音描述：</label>
        <div class="layui-input-inline">
            <textarea name="Content" id="voice-introduction"  disabled="disabled" style="border: none;overflow-y:visible; text-align: left;" class="layui-textarea" required lay-verify="required|content">无音频</textarea>
        </div>
    </div>

</form>


<div class="demoTable" style="margin-top: 10px ;margin-left: 10px;position: relative;">
    <%--搜索关键词：--%>
        <blockquote class="layui-elem-quote">
    <div class="layui-inline">
        <input class="layui-input" name="username" id="demoReload" autocomplete="off" placeholder="请输入关键词">
    </div>
    <button id="searchBtn" class="layui-btn layui-btn-normal" data-type="reload"><i class="layui-icon">&#xe615;</i>  搜索</button>
           <div class="layui-inline "  style="float: left; position: relative; left: 65%;">
              <ul class="layui-nav layui-layout-left kit-nav layui-bg-green">
        <li class="layui-nav-item">
        	 <a href="javascript:;" class="layui-btn " ><i class="layui-icon">&#xe608;</i> 添加</a>
            <dl class="layui-nav-child" id="accountShow">
               <dd><a href="javascript:;" class = "addMessage"  id="Text" >文本消息</a></dd>
                <dd><a href="javascript:;" class = "addMessage" id="News">图文消息</a></dd>
                <dd><a href="javascript:;" class = "addMessage" id="Image">图片消息</a></dd>
                <dd><a href="javascript:;" class = "addMessage" id="Video">视频消息</a></dd>
                <dd><a href="javascript:;" class = "addMessage" id="Voice" >语音消息</a></dd>
           </dl>
        </li>
    </ul>  </div>

      </blockquote>
      
</div>

<table class="layui-hide" id="allMessages" lay-filter="baseMessage"></table>

<script type="text/html" id="operation">
	<a class="layui-btn layui-btn-normal layui-btn-xs"  lay-event="show"><i class="layui-icon layui-icon-list"></i>查看</a>
    <a class="layui-btn layui-btn-normal layui-btn-xs"  lay-event="edit"><i class="layui-icon">&#xe642;</i>修改</a>
    <a class="layui-btn  layui-btn-danger layui-btn-xs" lay-event="del"><i class="layui-icon">&#xe640;</i>删除</a>
    <a class="layui-btn layui-btn-xs" lay-event="send"><i class="layui-icon">&#xe770;</i>群发</a>
    <%--<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="mass">群发</a>--%>
</script>
<script src="../statics/plugins/layui/layui.js"></script>

<script>
    layui.use(['table','layer','form','element'], function(){
        var form = layui.form;
        var table = layui.table;
        var layer=layui.layer;
        var $=layui.jquery;
      var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块
  
  //监听导航点击
  element.on('nav(demo)', function(elem){
    //console.log(elem)
    layer.msg(elem.text());
  });
        //方法级渲染
        table.render({
            elem: '#allMessages'
            ,url: '/Message/showMessage'
            ,id: 'messageReload'
            ,page: true
            ,cols: [[
                // {checkbox: true, fixed: true},
                {type:'numbers',title:'序号',width:100}//自带排序列
                ,{field:'title', title: '标题', width:150}
                ,{field:'inputCode', title: '关键词', width:120}
                ,{field:'msgType', title: '消息类型', width:120}
                ,{field:'createTime', title: '更新时间',templet: '#createTime', width:200}
                ,{ align:'center',title: '管理操作',  toolbar: '#operation'}
            ]]
        });
        <%--$(".addMessage").click(function(){--%>
            <%--var type =$(this).attr('id');--%>
            <%--window.location.href="<%=basePath%>/jsp/add"+type+"Message.jsp";--%>
        <%--});--%>

        //重载实现搜索
        var $ = layui.$, active = {
            reload: function(){
                var demoReload = $('#demoReload');
                //执行重载
                table.reload('messageReload', {
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
        $('.addMessage').on('click', function(){

            var type = $(this).attr('id');
            var d = <%=session.getAttribute("accountSession")%>;
           if (d.length==0){
               layer.msg("请先添加公众号！");
           } else{
               if(type=="Text"){
                   window.location.href= "<%=basePath%>/jsp/addTextMessage.jsp?mark=add&baseID=0";
               }else if(type=="News"){
                   window.location.href= "<%=basePath%>/jsp/editNewsMessage.jsp?mark=add&baseID=0";
               }else if(type=="Image"){
                   window.location.href= "<%=basePath%>/jsp/editImageMessage.jsp?mark=add&baseID=0";
               }else if(type=="Video"){
                   window.location.href= "<%=basePath%>/jsp/editVideoMessage.jsp?mark=add&baseID=0";
               }else if(type=="Voice"){
                   window.location.href= "<%=basePath%>/jsp/editVoiceMessage.jsp?mark=add&baseID=0";
               }
           }
        });
//        //新增
//         $('#addBtn').on('click', function() {
//             layer.open({
//                 title:'新增',
//                 type: 2,
//                 area: ['470px', '430px'],
//                 skin: 'layui-layer-rim', //加上边框
//                 content: '/Message/addtext'
//             });
//         });

        //工具条
        table.on('tool(baseMessage)', function(obj){
            var data = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            var tr = obj.tr; //获得当前行 tr 的DOM对象
            var baseID=data.id;
            if(obj.event === 'show'){
            if(data.msgType=="text"){
                $.ajax({
                    url:'/Message/getTextMessage',
                    method:'post',
                    dataType: 'JSON',
                    data: {
                    		baseMessageID: baseID
                    },
                    success:function(result){
                        $("#text-title").html(data.title);
                        $("#text-inputCode").html(data.inputCode);
                        $("#text-content").html(result.content);
                        layer.open({
                            title:'消息详情',
                            type:1,
                            btnAlign: 'c',
                            area:['450px','400px'],
                            content:$("#showTextMessage"),
                            btn: '返回',
                            yes: function(index,layero){
                                layer.close(index);//这块是点击确定关闭这个弹出层
                                //最后关闭弹出层
                            }
                        });
                    },
                    error: function(result) {
                        return layer.msg('获取文本消息失败，请刷新页面重试！');
                    }
                });
            }else if (data.msgType==="news"){
            	 $.ajax({
                    url:'/Message/getNewsMessage',
                    method:'post',
                    dataType: 'JSON',
                    data: {
                    		baseMessageID: baseID
                    },
                    success:function(result){
                    	if(result.news!=null){
                    	$("#newsTitle").html(result.news.title);
                       $("#news-content").attr("src",result.news.thumb.thumbURL);
                       $("#news-digest").html(result.news.digest);
                    	}else{
                            $("#newsTitle").html("无图文");
                    	}
                    	 $("#news-title").html(data.title);
                        $("#news-inputCode").html(data.inputCode);
                       
                    
                        layer.open({
                            title:'消息详情',
                            type:1,
                            btnAlign: 'c',
                            area:['400px','480px'],
                            content:$("#showNewsMessage"),
                            btn: '返回',
                            yes: function(index,layero){
                                layer.close(index);//这块是点击确定关闭这个弹出层
                                //最后关闭弹出层
                            }
                        });
                    },
                    error: function(result) {
                        return layer.msg('获取图片消息失败，请刷新页面重试！');
                    }
               });
                $("#newsTitle").html(data.title);
                <%--window.location.href="<%=basePath%>/jsp/addTextMessage.jsp?mark=edit";--%>
            }else if (data.msgType=="image"){
               $.ajax({
                    url:'/Message/getImageMessage',
                    method:'post',
                    dataType: 'JSON',
                    data: {
                    		baseMessageID: baseID
                    },
                    success:function(result){
                    	if(result.image!=null){
                            $("#imageName").html(result.image.imageName);
                            $("#image-content").attr("src",result.image.picUrl);
                    	}
                        $("#image-title").html(data.title);
                        $("#image-inputCode").html(data.inputCode);

                        layer.open({
                            title:'消息详情',
                            type:1,
                            btnAlign: 'c',
                            area:['400px','450px'],
                            content:$("#showImageMessage"),
                            btn: '返回',
                            yes: function(index,layero){
                                layer.close(index);//这块是点击确定关闭这个弹出层
                                //最后关闭弹出层
                            }
                        });
                    },
                    error: function(result) {
                        return layer.msg('获取图片消息失败，请刷新页面重试！');
                    }
                });
            }
            else if (data.msgType==="voice"){
               $.ajax({
                    url:'/Message/getVoiceMessage',
                    method:'post',
                    dataType: 'JSON',
                    data: {
                    		baseMessageID: baseID
                    },
                    success:function(result){
                    	if(result.voice.mediaId!=null){
                            $("#voiceTitle").html(result.voice.title);
                            $("#voice-introduction").html(result.voice.description);
                            var filePath=result.voice.url;
                    	    filePath=filePath.substring(44,filePath.length);
                        	$("#voice-content").attr("src",filePath);
                    	}else{
                    		 $("#voiceTitle").html("无视频");
                    	}
                    	$("#voice-title").html(data.title);
                        $("#voice-inputCode").html(data.inputCode);
                        layer.open({
                            title:'消息详情',
                            type:1,
                            btnAlign: 'c',
                            area:['400px','480px'],
                            content:$("#showVoiceMessage"),
                            btn: '返回',
                            yes: function(index,layero){
                                layer.close(index);//这块是点击确定关闭这个弹出层
                                //最后关闭弹出层
                            }
                        });
                    },
                    error: function(result) {
                        return layer.msg('获取语音消息失败，请刷新页面重试！');
                    }
               });
                $("#voiceTitle").html(data.title);
            }
            else if (data.msgType==="video"){
                $.ajax({
                    url:'/Message/getVideoMessage',
                    method:'post',
                    dataType: 'JSON',
                    data: {
                    		baseMessageID: baseID
                    },
                    success:function(result){
                    	if(result.video.mediaId!=null){
                    		  $("#videoTitle").html(result.video.title);
                    		  	$("#video-introduction").html(result.video.description);
                    			var filePath=result.video.url;
                    	filePath=filePath.substring(44,filePath.length);
                       	$("#video-content").attr("src",filePath);
                    	}else{
                    		 $("#videoTitle").html("无视频");
                    	
                    	}
                    	$("#video-title").html(data.title);
                        $("#video-inputCode").html(data.inputCode);
                      
                    
                        layer.open({
                            title:'消息详情',
                            type:1,
                            btnAlign: 'c',
                            area:['400px','480px'],
                            content:$("#showVideoMessage"),
                            btn: '返回',
                            yes: function(index,layero){
                                layer.close(index);//这块是点击确定关闭这个弹出层
                                //最后关闭弹出层
                            }
                        });
                    },
                    error: function(result) {
                        return layer.msg('获取视频消息失败，请刷新页面重试！');
                    }
               });
                $("#videoTitle").html(data.title);
            }
                
            } else if(obj.event === 'edit'){
                if(data.msgType==="text"){
                    window.location.href="./addTextMessage.jsp?mark=edit&baseID="+baseID;
                }else if (data.msgType==="news"){
                    window.location.href="./editNewsMessage.jsp?mark=edit&baseID="+baseID;
                  
                }else if (data.msgType==="image"){
                    window.location.href="./editImageMessage.jsp?mark=edit&baseID="+baseID;
                }
                else if (data.msgType==="voice"){
                      window.location.href="./editVoiceMessage.jsp?mark=edit&baseID="+baseID;
         
                }
                else if (data.msgType==="video"){
                    window.location.href="./editVideoMessage.jsp?mark=edit&baseID="+baseID;
                }
            } else if(obj.event === 'del'){
                layer.confirm('真的删除行么', function(index){
                    console.log(data);
                    $.ajax({
                        url: "/Message/deleteMessage",
                        type: "POST",
                        dataType: "json",
                        data: {
                            baseMessageID: data.id,
                            msgType:data.msgType
                        },
                        success: function(res){
                            if (res){
                                window.location.href="./showAllMessage.jsp";
                            }else{
                                layer.msg("删除失败，请刷新页面重试！", {icon: 5});
                            }
                        }

                    });
                });
            } else if(obj.event === 'send'){
                    // $.ajax({
                    //     url: "/Message/TextMsg",
                    //     type: "POST",
                    //     contentType: "application/json",
                    //     data: JSON.stringify(data),
                    //     dataType: "json",
                    // });
                layer.open({
                    title:'群发文本消息',
                    type: 2,
                    area: ['600px', '430px'],
//                shadeClose: false,
//                maxmin: false,
                    skin: 'layui-layer-rim', //加上边框
                    content: './selectFans.jsp?messageId=' + data.id+'&messageType='+data.msgType+'&mark=message'
                });
            }
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