<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<title>萍乡市宏凯自动化设备有限公司</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="author" content="萍乡市宏凯自动化设备有限公司" />
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script src="js/common.js" type="text/javascript"></script>

</head>
<body>

<!--页眉开始-->
<div id="header">
	<!--幻灯片 开始-->
	<script type="text/javascript" src="js/jquery.flexslider-min.js"></script>
	<script type="text/javascript">
	$(document).ready(function() {

		$('.flexslider').flexslider({
		
			controlNav: true, 
			
			directionNav: false,
			
			animation: "slide",
			
			//manualControls: ".myflexslider .slidenav"
		
		});

	});
	</script>
	<div id="banner" class="flexslider" >
		<ul class="slides">
			<!--这里需要保存图片-->
			<li><img src="images/company.jpg" /></li>
			<li><img src="images/quality.jpg" /></li>
		</ul>
	</div>
	<!--幻灯片 结束-->
</div>
		
<div id="content">
	<!--导航开始-->
	<ul class="channellist1">
		<li><a href="gywm.jsp" style="background:#ff6564; " class="ChannelName1">关于我们<img src="images/1418289799.png" class="ChannelIcon1" /></a></li>
		<li><a href="cpzx.jsp" style="background:#52cb41;"  class="ChannelName2"><img src="images/1418290014.png"  class="ChannelIcon2" />产品中心</a></li>
		<li><a href="xwzx.jsp" style="background:#00b6dc;"  class="ChannelName2"><img src="images/1418290303.png"  class="ChannelIcon1" />新闻中心</a></li>
		<li><a href="contactus.jsp" style="background:#d468aa;"  class="ChannelName1"><img src="images/call.png" style="width: 35px; height: 35px;"  class="ChannelIcon2"  />联系我们</a></li>
				<!--<li><a href="hzjm.html" style="background:#00b6dc;"  class="ChannelName2"><img src="images/1418290303.png"  class="ChannelIcon1" />新闻中心</a></li>
		<li><a href="xswl.html" style="background:#d468aa;"  class="ChannelName1"><img src="images/1418290447.png"  class="ChannelIcon2"  />联系我们</a></li>-->
	</ul>
	<!--导航结束-->
	<!--导航开始-->
	<ul class="channellist2">
		<!--<li><a href="xwzx.jsp"><img src="images/1418348781.png"  />新闻中心</a></li>-->
		<li><a href="job.jsp"><img src="images/1418348796.png"  />人才招聘</a></li>
		<li><a href="fwzc.jsp"><img src="images/1418348810.png"  />服务支持</a></li>
		<!--<li><a href="contactus.jsp"><img src="images/1418348821.png"  />联系我们</a></li>-->
	</ul>
	<!--导航结束-->
	<div class="clear"></div>
</div>
<!--页脚开始-->

<div id="footer">
	<!-- 微信分享导引 开始-->
	<script type="text/javascript">
	function openGuide(){document.getElementById('guide').style.display='block'; }
	function closeGuide(){ document.getElementById('guide').style.display=''; }
	</script>
	<div id="guide" onClick="closeGuide()"><img src="images/guide.png"></div>
	<!-- 微信分享导引 结束-->
	<!--快捷按钮 开始-->
	<div class="plug-div">
		<div class="plug-phone">
			<div class="plug-menu themeStyle"><span class="close"></span></div>
			<div class="themeStyle plug-btn plug-btn1 close"><a href="websiteIndex.jsp"><span style="background-image: url(ky_img/home.png);"></span></a></div>
			<div class="themeStyle plug-btn plug-btn2 close"><a href="tel:18858770292"><span style="background-image: url(ky_img/tel.png);"></span></a></div>
			<div class="themeStyle plug-btn plug-btn3 close"><a href="gywm.jsp"><span style="background-image: url(ky_img/aboutus.png);"></span></a></div>
			<!--<div class="themeStyle plug-btn plug-btn4 close" ><a href="guestbook.html"><span style="background-image: url(ky_img/guestbook.png);"></span></a></div>-->
			<div class="plug-btn plug-btn5 close"></div>
		</div>
	</div>
	<!--快捷按钮 结束-->
		<div>
			<ul class="wxlist"><a href="#top"><li><div  class="GoTop"><img src="images/top.png" />回顶部</div></li></a>
			</ul>
		</div>
	<div class="copyright">萍乡市宏凯自动化设备有限公司&nbsp;版权所有</div>
</div>
<!--页脚结束-->

</body>
</html>