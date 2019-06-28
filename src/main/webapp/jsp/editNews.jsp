<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<title>图文素材管理</title>
		<meta name="renderer" content="webkit">
		<meta name="referrer" content="never">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<link rel="stylesheet" href="../statics/plugins/layui/css/layui.css" media="all" />
		<!--页面导航栏小图标-->
		<link rel="icon" href="../statics/resource/images/favicon.ico" type="image/x-icon">
		<%
			String path = request.getContextPath();
			String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/";
			String mark = request.getParameter("mark");
			String newsID = request.getParameter("newsID");
		%>
	</head>

	<body style="position: relative; background-color: gainsboro;height:auto;min-height:600px;">
		<div style="float: left;width: 20%;height:auto;min-height:600px; position: relative; background-color: gainsboro;">
			<div style="width: 90%; height: 180px;border:4px solid rgba(26,173,25,0.4); position: absolute;top: 15%; left: 4%; ">
				<div style="width: 100%; height: 100%; position: absolute;background-color: white;">
					<div style="width: 92%; height: 88%; position: absolute; top: 6%; left: 4%; background-color: #666;">
						<div class="news-img" style="width: 100%; height: 100%; opacity: 0.8; border-right:1px solid darkslategrey;">
							<div id="titleView" style="width: 100%; height: 30px; color: white; position: absolute;bottom: 5px;left: 5px;">标题</div>

						</div>
					</div>
				</div>
			</div>
		</div>
		<div style="float: left;width: 45%;height:auto;min-height:600px;background-color: white; padding:20px 30px 0px 30px;margin: 30px 30px 30px;">
			<div class="layui-form-item">
				<label class="layui-form-label">标题：</label>
				<div class="layui-input-block" style="position: relative;">
					<input type="text" id="title" onkeyup="this.value=this.value.replace(/\s+/g,'')" name="title" lay-verify="required" autocomplete="off" placeholder="请输入标题" class="layui-input" maxlength="20">
					</input>
					<div id="title-size" style="width: 45px;height: 25px;position: absolute;left: 90%;top: 60%; text-align: right;">

        			</div>
				</div>
				
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">作者：</label>
				<div class="layui-input-block" style="position: relative;">
					<input id="author" type="text" name="author" lay-verify="required" placeholder="请输入作者" autocomplete="off" class="layui-input" maxlength="12"></input>
					<div id="author-size" style="width: 45px;height: 25px;position: absolute;left: 90%;top: 60%;text-align: right; ">

        		</div>
				</div>
			</div>
			<div class="layui-form-item" style="position: relative;margin-left: 40px;">
				<textarea class="layui-textarea" id="textarea-content" lay-verify="required" placeholder="从这里开始写正文" style="display: inline; height: 300px;" maxlength="500"></textarea>
				<div id="artical-size" style="width: 60px;height: 25px;position: absolute;left: 88.5%;top: 92%;text-align: right;">
        		</div>
			</div>
			<div class="layui-form-item" style="padding: 15px;margin-left: 40px;">
				<h2>封面和摘要</h2>
			</div>
			<div class="layui-form-item" style="height: 100px; width: 100%; margin-left: 40px;">
				<div class="cover" id="0" style="height: 100px; width: 30%;position: relative; text-align: center; float: left; border: 2px dotted #D0D0D0;">
					<ul style="margin: 10%;color:#43b548; font-size: 15px;">
						<li class="layui-icon layui-icon-add-1" style="font-size: 25px;"></li>
						<li>选择封面</li>
					</ul>
					<div id="select-cover" style="position:absolute;top: 80px;display: none;">
						<tr style="padding: 2px; ">
							<a href="/Material/thumbManage"><button id="upload-cover" style="float: left;border: 0px;width: 50%; font-size: 14px; opacity: 0.9; color: white; height: 40px; background-color: rgba(0,0,0,0.6);border-radius: 4px;" data-type="text">上传封面</button></a>
						</tr>
						<tr style="padding: 2px;">
						<button id="material-cover" style="float: left;border: 0px; font-size: 14px; opacity: 0.9; color: white; height: 40px; background-color: rgba(0,0,0,0.6);border-radius: 4px;" data-type="text">选择封面</button>
							<!--<button id="material-cover" style="float: left;border: 0px; font-size: 14px; opacity: 0.9; color: white; height: 40px; background-color: rgba(0,0,0,0.6);border-radius: 4px;" data-type="text">从图片素材选择</button>-->
						</tr>
					</div>

				</div>
				<div class="layui-input-block" style="height: 100px; width: 53%; float:left; margin: 0;margin-left: 50px; ">
                    <textarea type="text" id="digest" name="title" lay-verify="text" autocomplete="off" placeholder="选填，如果不填写会默认抓取正文前54个字" class="layui-input" maxlength="120" style="vertical-align:top;outline:none;padding-top: 5px; width: 100%; height: 100%;background-color: #CCFF99;"></textarea>
					<%--<input type="text" id="digest" style="width: 100%; height: 100%;background-color: greenyellow;" name="title" lay-verify="text" autocomplete="off" placeholder="选填，如果不填写会默认抓取正文前54个字" class="layui-input" maxlength="120">--%>
				<%--</input>--%>
					<div id="digest-size" style="width: 60px;height: 25px;position: absolute;left: 80%;top: 85%;text-align: right; ">
					</div>
				</div>
			</div>
<div style="margin: 50px; text-align: right;">
	<button id="submit" class="layui-btn layui-btn-normal"> 保存</button>
	<button id="submit-and-view" class="layui-btn layui-btn-normal"> 保存并预览</button>
	<a href="<%=basePath%>/jsp/showNews.jsp" id="acncel" class="layui-btn layui-btn-normal"> 取消</a>
</div>
		</div>
		
    <div id="parentIframe"></div>
	</body>
	<script src="../statics/plugins/layui/layui.js" charset="utf-8"></script>
	<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
	<script>
		layui.use(['element','layer','upload', 'layedit'], function() {
		  var element = layui.element;
			var layedit = layui.layedit;
			var layer = layui.layer;
			var	$= layui.jquery;
            var upload = layui.upload;
			var newsID=0;
			var thumbID=0;
            var thumbURL=null;
			var mark = "<%=mark%>";
            var index=layedit.build('textarea-content'); //建立编辑器
            $.fn.extend({'getThumbByThumbID':function(data){
                    $.ajax({
                        url: '/Material/getThumb',
                        method: 'post',
                        dataType: 'JSON',
                        data: {
                            id: data,
                            fileType:'thumb'
                        },
                        success: function(res) {
								thumbURL=res.thumbURL;
								$(".cover").css({'background-image':('url("'+thumbURL+'")'),"background-size":"100% 100%"});
								$(".news-img").css({'background-image':('url("'+thumbURL+'")'),"background-size":"100% 100%"});

                        }
                    });
                }});
			$(function() {
				<%--var newsType = "<%=request.getSession().getAttribute("newsType")%>";--%>
				newsID = "<%=newsID%>";
				if ("edit"==mark){
					$.ajax({
						url: '/Material/getNews',
						method: 'post',
						dataType: 'JSON',
						data: {
							id: newsID
						},
						success: function(res) {
							$("#title").val(res.title);
							$("#titleView").html(res.title);
							$("#author").val(res.author);
							 layedit.setContent(index,res.content);
							// $("#textarea-content").val(res.content);
							$('.cover').attr('id',res.thumbId);
//							alert(res.thumbId);
							console.log(res.thumbId);
							$("#digest").val(res.digest);
							$("#title-size").html(res.title.length+"/20");
							$("#author-size").html(res.author.length+"/12");
							$("#artical-size").html(res.content.length+"/500");
							$("#digest-size").html(res.digest.length+"/120");
							console.log("res.content.length:"+res.content.length);
							if (res.thumb.thumbURL!="error") {
                                thumbURL=res.thumb.thumbURL;
								$(".cover").css({'background-image':('url("'+thumbURL+'")'),"background-size":"100% 100%"});
								$(".news-img").css({'background-image':('url("'+thumbURL+'")'),"background-size":"100% 100%"});
							}
							console.log(res);
						}
					});
				}else{
					$("#title-size").html("0/20");
					$("#author-size").html("0/12");
					$("#artical-size").html("0/500");
					$("#digest-size").html("0/120");
				}
			});
			$("#title").on('keyup', function() {
				//  alert($("#title").val());
				var str=$("#title").val();
//				str=$.trim(str);
				$("#title").html(str);
				$("#titleView").html(str);
				$("#title-size").html(str.length+"/20");
				if($("#title").val() == "") {
					$("#titleView").html("标题");
				};
			});
			$("#author").on('keyup', function() {
				var str=$("#author").val();
				str=str.replace(/\s+/g," ");
				if(str.length>0){
					if(str.substr(0,1)==" "){
						str=$.trim(str);
						$("#author-size").html(str.length+"/12");
					}else if(str.substring(str.length-1,str.length)==" "){
						$("#author-size").html(str.length-1+"/12");
					}else{
						$("#author-size").html(str.length+"/12");
					}
				}
				$("#author").val(str);
			});
			$("#textarea-content").on('keyup', function() {
//			    alert(layedit.getText(index));
                // layedit.sync(index);
                // var str= layedit.getText(index);
                // str=str.replace(/\s+/g," ");
                // if(str.length>0){
                //     if(str.substr(0,1)==" "){
                //         str=$.trim(str);
                //         $("#artical-size").html(str.length+"/500");
                //     }else if(str.substring(str.length-1,str.length)==" "){
                //         $("#artical-size").html(str.length-1+"/500");
                //     }else{
                //         $("#artical-size").html(str.length+"/500");
                //     }
                // }
                // layedit.sync(index);
                // console.log(str);
                // $("#author").val(str);
				// var str=$("#textarea-content").val();
				// $("#artical-size").html(str.length+"/500");
			});
            $("#digest").on('keyup', function() {
                var str=$("#digest").val();
                str=str.replace(/\s+/g," ");
                if(str.length>0){
                    if(str.substr(0,1)==" "){
                        str=$.trim(str);
                        $("#digest-size").html(str.length+"/120");
                    }else if(str.substring(str.length-1,str.length)==" "){
                        $("#digest-size").html(str.length-1+"/120");
                    }else{
                        $("#digest-size").html(str.length+"/120");
                    }
                }
                $("#digest").val(str);
            });

            //普通图片上传
            // upload.render({
            //     url: '/Material/doUpload'
            //     ,elem: '#upload-cover'
            //     ,auto: false
            //     ,bindAction: '#submit'
            //     ,data: {
            //         fileType: 'image'
            //     }
            //     ,before: function(obj){
            //     //预读本地文件示例，不支持ie8
            //     obj.preview(function(index, file, result){
            //         // $('#demo1').attr('src', result); //图片链接（base64）
            //         $(".cover").css({'background-image':('url("'+result+'")'),"background-size":"100% 100%"});
            //         $(".news-img").css({'background-image':('url("'+result+'")'),"background-size":"100% 100%"});
            //     });
            //     },
            //     done: function(res, index, upload){
            //         console.log("code:"+res.code+" thumbID:"+res.fileID);
            //         //如果上传失败
            //         if(res.code > 0) {
            //             return layer.msg('上传失败');
            //         }else{
            //             thumbID=res.fileID;
            //             // window.location.reload();
            //             $('.cover').attr('id',res.code);
            //             $('.cover').getThumbByThumbID(thumbID);
            //             $("#select-cover").css("display", "none");
            //             // $(".cover ul").css("display","none");
            //         }
            //         layer.closeAll('loading'); //关闭loading
            //     }
            // });
			$('#material-cover').on('click', function() {
                layer.open({
                    title:'图片选择',
                    type: 2,
                    area: ['400px', '300px'],
                    id:'selectThumb',
                    skin: 'layui-layer-rim', //加上边框
                    content: '<%=basePath%>/jsp/selectThumb.jsp',
                    btn: ['确定','关闭'],
                    yes: function(index,layero){
                        var body = layer.getChildFrame('body', index);  //此处我理解的是加载目标页面的内容
                        thumbID=body.find('#weNeedID').val();　　//查到目标页面的内容赋给当前页面元素
                        $('.cover').attr('id',thumbID);
                        $('.cover').getThumbByThumbID(thumbID);
                        $("#select-cover").css("display", "none");
                        // $(".cover ul").css("display","none");
                        layer.close(index);//这块是点击确定关闭这个弹出层
//                         console.log(layero.context.body,index);
                        //最后关闭弹出层
                    },
                    cancel: function(index){
                        layer.close(index);
                        //右上角关闭回调
                    }
                });
			});
			
			$("#upload-cover").mouseover(function() {
				$("#upload-cover").css("background-color", "#353535");
			});
			$("#upload-cover").mouseout(function() {

				$("#upload-cover").css("background-color", "rgba(0,0,0,0.6)");
			});
			
			$("#material-cover").mouseover(function() {

				$("#material-cover").css("background-color", "#353535");			   
			});
			$("#material-cover").mouseout(function() {

				$("#material-cover").css("background-color", "rgba(0,0,0,0.6)");
			});
			$(".cover").mouseover(function() {

				$("#select-cover").css("display", "block");
			});
			$(".cover").mouseout(function() {

				$("#select-cover").css("display", "none");
			});
			$("#submit").click(function() {
                var title=$("#title").val();
                var author=$("#author").val();
                var content=layedit.getContent(index);
				var text=layedit.getText(index);
                var thumbID=$(".cover").attr('id');
                var digest=$("#digest").val();
                if (digest==''){
					if (text.length>54){
						digest=text.substring(0,54);
					}else {
						digest=text;
					}
				}
                console.log("title："+title+"author："+author+"content："+content+"thumbID："+thumbID+"digest："+digest);
                if ("edit"==mark){
                    $.ajax({
                        url: '/Material/editNews',
                        method: 'post',
                        dataType: 'JSON',
                        data: {
							title: title,
							author:author,
							content: content,
							thumbId:thumbID,
							digest: digest
                        },
                        success: function(result) {
                            if(result.code>0){
								window.location.href="<%=basePath%>/jsp/showNews.jsp";
                            }else {
								return layer.msg('修改失败，错误提示：'+result.errcode+'，请刷新页面重试！');
                            }

                        },
                        error: function(result) {
                                return layer.msg('修改失败，请刷新页面重试！');
                        }
                    });
                }else{
                    $.ajax({
                        url: '/Material/addNews',
                        method: 'post',
                        dataType: 'JSON',
                        data: {
							title: title,
							author:author,
							content: content,
							thumbId:thumbID,
							digest: digest
                        },
						success: function(res) {
							if(res.code > 0) {
								window.location.href="<%=basePath%>/jsp/showNews.jsp";
							}else{
								return layer.msg('添加失败，错误提示：'+res.errcode);
							}
                        },
						error: function(result) {
							return layer.msg('添加失败，请刷新页面重试！');
						}
                    });
                }


			});
            $("#submit-and-view").click(function() {
				var title=$("#title").val();
				var author=$("#author").val();
				var content=layedit.getContent(index);
				var text=layedit.getText(index);
				var thumbID=$(".cover").attr('id');
				var digest=$("#digest").val();
				if (digest==''){
					if (text.length>54){
						digest=text.substring(0,54);
					}else {
						digest=text;
					}
				}
                console.log("title："+title+"author："+author+"content："+content+"thumbID："+thumbID+"digest："+digest);
                if ("edit"==mark){
                    $.ajax({
                        url: '/Material/editNews',
                        method: 'post',
                        dataType: 'JSON',
                        data: {
							title: title,
							author:author,
							content: content,
							thumbId:thumbID,
							digest: digest
                        },
                        success: function(result) {
//                          alert("保存并预览："+result);
                            if(result.code>0){
								window.location.href="/Material/turnPreviewNews?newsID="+res.code;
                            }else {
								return layer.msg('修改失败，错误代码：'+result.errcode+'，请刷新页面重试！');
                            }
                        },
						error: function(result) {
							return layer.msg('修改失败，请刷新页面重试！');
						}
                    });
                }else{
                    $.ajax({
                        url: '/Material/addNews',
                        method: 'post',
                        dataType: 'JSON',
                        data: {
							title: title,
							author:author,
							content: content,
							thumbId:thumbID,
							digest: digest
                        },
                        success: function(res) {
//                          alert("保存并预览："+res);
							if(res.code > 0) {
								window.location.href="/Material/turnPreviewNews?newsID="+res.code;
							}else{
								return layer.msg('添加失败，错误提示：'+res.errcode);
							}
                        },
						error: function(result) {
							return layer.msg('添加失败，请刷新页面重试！');
						}
                    });
                }

            });
			
		});
	</script>

</html>