<%--
  Created by IntelliJ IDEA.
  User: 吴仕宇
  Date: 2018/6/23
  Time: 16:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="referrer" content="never">
    <title>选择封面</title>
    <link rel="stylesheet" href="../statics/plugins/layui/css/layui.css">
</head>
<body>
<form class="layui-form layui-form-pane" action="" style="margin-left: 6px">
<!--<input value="" />-->
    <div class="layui-inline">
        <label class="layui-form-label">封面素材</label>
        <div class="layui-input-inline">
            <select name="modules" id="selectThumb" lay-verify="" lay-filter="selectThumb" lay-search="">
                <option value="">直接选择或搜索选择</option>
                <%--<option value="1">layer</option>--%>
          <%--<option value="2">form</option>--%>
          <%--<option value="3">layim</option>--%>
          <%--<option value="4">element</option>--%>
          <%--<option value="5">laytpl</option>--%>
          <%--<option value="6">upload</option>--%>
          <%--<option value="7">laydate</option>--%>
          <%--<option value="8">laypage</option>--%>
          <%--<option value="9">flow</option>--%>
          <%--<option value="10">util</option>--%>
          <%--<option value="11">code</option>--%>
          <%--<option value="12">tree</option>--%>
          <%--<option value="13">layedit</option>--%>
          <%--<option value="14">nav</option>--%>
          <%--<option value="15">tab</option>--%>
          <%--<option value="16">table</option>--%>
          <%--<option value="17">select</option>--%>
          <%--<option value="18">checkbox</option>--%>
          <%--<option value="19">switch</option>--%>
          <%--<option value="20">radio</option>--%>

            </select>
        </div>
    </div>
   </div>
        <input id="weNeedID" style="display: none" value=""></input>
    </div>
    <%--<div>--%>
        <%--<button id="demo" class="layui-btn" lay-submit="" lay-filter="demo2">立即提交</button>--%>
        <%--<button type="reset" class="layui-btn layui-btn-primary">重置</button>--%>
    <%--</div>--%>

</form>
</body>
<script src="../statics/plugins/layui/layui.js"></script>
<script>
    layui.use(['form', 'layedit','jquery','layer','laydate'], function(){
        var form = layui.form;
        var layer = layui.layer;
        var $=layui.jquery;
        var thumbID;
     $(function() {
         var selectString;
         // selectString='<select id="selectimage" name="modules" lay-search="" lay-verify="required"><option value="">直接选择或搜索选择</option>';
         $.ajax({
             url: '/Material/showThumbs',
             method: 'post',
             dataType: 'JSON',
             data: {
                 fileType:'thumb'
             },
             success: function(res) {
                 $.each(res, function(i, item) {
                     $("#selectThumb").append('<option value="'+item.id+'">'+item.thumbName+'</option>');
                 });
                 // selectString+='</select>';
                 form.render();
             }
           });

     });
//      $("#demo").click(function(data) {
//          var index = layer.getFrameIndex(window.name);
//          alert(layer.index);
// //          console.log(index);
//          $('#parentIframe', window.parent.document).text('我被改变了');
// //          parent().$('#parentIframe').text('我被改变了');
// //          parent().layer.tips('Look here', '#parentIframe', {time: 5000});
//          window.opener.layer.close(layer.index);
//      });
form.on('select(selectThumb)', function(data){
//	console.log("modules:"+data.field.modules);
	//得到select原始DOM对象
    $('#weNeedID').val(data.value);
	console.log("value:"+data.value);
	//得到被选中的值
//	console.log(data.othis);
	//得到美化后的DOM对象
	});

//             form.on('submit(demo2)', function(data){
// //             parent.$('#parentIframe').text('我被改变了');
// //             parent.layer.tips('Look here', '#parentIframe', {time: 5000});
// //             parent.layer.close(index);
//
//                // // console.log(JSON.stringify(data.field));
//                // imageID=JSON.stringify(data.field);
//                // // parent.callbackdata(imageID);
//                // // parent.callbackdata(imageID);
//                // parent.$('#parentIframe').text('我被改变了');
//                // layer.close(index);
// //
// //
// // //  return data.field.modules;
// //             return false
//            });
    });
</script>
</html>

