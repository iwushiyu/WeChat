<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>图文素材管理</title>
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<link rel="stylesheet" href="../statics/plugins/layui/css/layui.css" media="all" />
		<style>
			.frm_input {
    width: 100%;
    background-color: transparent;
    border: 0;
    outline: 0;
    float: left;
}
		</style>
	</head>


	<body>
		<div style="height: 800px;width: 100%;">
			<div style="float: left;width: 20%;height: 800px; position: relative; background-color: gainsboro;">
			<div style="width: 90%; height: 180px;border:4px solid rgba(26,173,25,0.4); position: absolute;top: 5%; left: 4%; ">
				<div style="width: 100%; height: 100%; position: absolute;background-color: white;">
				<div style="width: 92%; height: 88%; position: absolute; top: 6%; left: 4%; background-color: #666;">
				<div style="width: 100%; height: 100%; opacity: 0.8; border-right:1px solid darkslategrey;background-image:url(../../../../target/web/resource/images/1.jpg);">
					
				<div style="width: 100%; height: 30px;position: absolute;bottom: 5px;left: 5px;"><h3>标题</h3></div>
			</div>
			</div>
			</div>
			</div>
		</div>
		<div style="float: left;width: 45%;height: 800px; margin-left: 50px;position: relative; border: 3px solid black;">
			<div class="layui-form-item">
        <label class="layui-form-label">标题：</label>
        <div class="layui-input-block">
            <input type="text" id="" name="title" lay-verify="required" autocomplete="off" placeholder="请输入标题" class="layui-input" maxlength="20">
        </div>
        <div id="title-size" style="width: 40px;height: 20px;position: absolute;left: 94%;top: 2.5%; ">
        	12/20
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">作者：</label>
        <div class="layui-input-block">
            <input type="text" name="author" lay-verify="required" placeholder="请输入作者" autocomplete="off" class="layui-input" maxlength="8">
        </div>
    </div>
			<!--<div >
				<label>标题：</label>
			<input  id="title" type="text" placeholder="请在这里输入标题" class="frm_input js_title js_counter js_field edui-default" name="title" maxlength="64">
			</div>-->
			<div>
				<textarea class="layui-textarea" id="LAY_demo1" style="display: none;" maxlength="200"> 
					从这里开始写正文
				</textarea>
				<button class="layui-btn site-demo-layedit" data-type="text">获取编辑器纯文本内容</button>

			</div>
		 <div class="layui-form-item">
        <label class="layui-form-label">封面和摘要</label>
    </div>
    <div style="height: 100px; width: 100%; ">
    	<div id="cover" style="height: 100px; width: 30%;position: relative; text-align: center; float: left; border: 2px dotted darkslategrey;">
    		<ul style="margin: 10%;color:#43b548; font-size: 20px;">
    				<li class="layui-icon layui-icon-add-1" style="font-size: 30px;"></li>
    				<li>选择封面</li>
    			</ul>
    			<div id="selectCover" style="position:absolute;top: 80px;display: none;">
    			<tr style="padding: 2px;">
    				<button id="uploadCover" style="float: left;border: 0px; font-size: 14px; opacity: 0.9; color: white; height: 40px; background-color: rgba(0,0,0,0.6);border-radius: 4px;"  data-type="text">从上传图片选择</button>
    			</tr>
    			<tr style="padding: 2px;">
    				<button id="materialCover" style="float: left;border: 0px; font-size: 14px; opacity: 0.9; color: white; height: 40px; background-color: rgba(0,0,0,0.6);border-radius: 4px;"  data-type="text">从图片素材选择</button>
    			</tr>
    			</div>
    			
    		
    		
    	</div>
    	 <div class="layui-input-block" style="height: 100px; width: 67%; float:right; margin: 0; ">
            <input type="text" style="width: 100%; height: 100%;background-color: greenyellow;" name="title" lay-verify="text" autocomplete="off" placeholder="选填，如果不填写会默认抓取正文前54个字" class="layui-input" maxlength="120">
        </div>
    	<!--<div style="height: 100px; width: 70%; float: left; background-color: greenyellow;"></div>-->
    </div>


		</div>
		</div>
		<div style="height: 100px;width: 100%; background-color: red;">
			<!--<button>保存</button>-->
			<button class="layui-btn" id="submit" style="background-color: green;" data-type="text">保存</button>
		</div>
		
	</body>
	<script src="../statics/plugins/layui/layui.js" charset="utf-8"></script>
	<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
	<script>
		layui.use('layedit', function(){
  var layedit = layui.layedit
  ,$ = layui.jquery;
  
  //构建一个默认的编辑器
  var index = layedit.build('LAY_demo1');
  
  //编辑器外部操作
  var active = {
    content: function(){
      alert(layedit.getContent(index)); //获取编辑器内容
    }
    ,text: function(){
      alert(layedit.getText(index)); //获取编辑器纯文本内容
    }
    ,selection: function(){
      alert(layedit.getSelection(index));
    }
  };
  $('.site-demo-layedit').on('click', function(){
    var type = $(this).data('type');
    active[type] ? active[type].call(this) : '';
  });
   $('#uploadCover').on('click', function(){
    alert("上传图文中的图片");
});
  $('#materialCover').on('click', function(){
   alert("从图片素材中选择图片");
});
 $('#submit').on('click', function(){
   alert("保存图文素材");
});
$("#uploadCover").mouseover(function() {   				
    					$("#uploadCover").css("background-color","#353535");
				});
$("#uploadCover").mouseout(function() {  				
    					$("#uploadCover").css("background-color","rgba(0,0,0,0.6)");
				});
$("#materialCover").mouseover(function() {   				
    					$("#materialCover").css("background-color","#353535");
				});
$("#materialCover").mouseout(function() {   				
    					$("#materialCover").css("background-color","rgba(0,0,0,0.6)");
				});
$("#cover").mouseover(function() {   				
    					$("#selectCover").css("display","block");
				});
$("#cover").mouseout(function() {   				
    					$("#selectCover").css("display","none");
		}); 
});
	</script>

</html>