<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
<title>企业介绍</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="author" content="萍乡市宏凯自动化设备有限公司" />
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script src="js/common.js" type="text/javascript"></script>
</head>

<body class="body_single">
	<!--顶部开始-->
	<div id="top">
		<!--频道导航 开始-->
		<script>
			window.onload = function () {

				var oWin = document.getElementById("window");

				var oLay = document.getElementById("overlay");

				var oBtn = document.getElementById("popmenu");

				var oClose = document.getElementById("close");

				oBtn.onclick = function () {
					oLay.style.display = "block";
					oWin.style.display = "block"
				};

				oLay.onclick = function () {
					oLay.style.display = "none";
					oWin.style.display = "none"
				}

			};
		</script>
		<div style="margin-bottom:55px;">
			<div id="toolbar">
				<div class="fixed"><a class="ui-title" id="popmenu">企业介绍</a><a class="ui-btn-back" href="javascript:history.go(-1)"></a>
					<a
					class="ui-btn-home" href="websiteIndex.jsp"></a>
				</div>
			</div>
			<div id="overlay"></div>
			<div id="window">
				<ul class="windowlist">
					<li><a href="gywm.jsp"><span>关于我们</span></a>
					</li>
					<li><a href="cpzx.jsp"><span>产品中心</span></a>
					</li>
					<li><a href="xwzx.html"><span>新闻中心</span></a>
					</li>
					<li><a href="job.jsp"><span>人才招聘</span></a>
					</li>
					<li><a href="fwzc.jsp"><span>服务支持</span></a>
					</li>
					<li><a href="contactus.jsp"><span>联系我们</span></a>
					</li>
					<div class="clear"></div>
				</ul>
			</div>
		</div>
		<!--频道导航 结束-->
	</div>
	<!--顶部结束-->
	<div id="content">
		<div class="single">
			 <div class="about_inf" style="text-align: center;width: 96%;">
   <h3>
  萍乡市宏凯自动化设备有限公司  
   </h3>
     <p><img src="images/company.jpg" style="width: 100%;"></p>
   <p>萍乡市宏凯自动化设备有限公司是油压缓冲器、液压元件、精密稳速器等产品专业生产加工的公司，拥有完整、科学的质量管理体系。萍乡市宏凯自动化设备有限公司的诚信、实力和产品质量获得业界的认可。欢迎各界朋友莅临参观、指导和业务洽谈。</p>

  <p><img src="images/company.jpg" style="width: 100%;"></p>
 
  </div>
    <div  class="hr_bg"></div>
		</div>
	</div>
	<!--页脚开始-->
	<div id="footer">
		<!-- 微信分享导引 开始-->
		<script>
			function openGuide() {
				document.getElementById('guide').style.display = 'block';
			}

			function closeGuide() {
				document.getElementById('guide').style.display = '';
			}
		</script>
		<div id="guide" onClick="closeGuide()">
			<img src="images/guide.png">
		</div>
		<!-- 微信分享导引 结束-->
		<!--快捷按钮 开始-->
		<div class="plug-div">
			<div class="plug-phone">
				<div class="plug-menu themeStyle"><span class="close"></span>
				</div>
				<div class="themeStyle plug-btn plug-btn1 close"><a href="/"><span style="background-image: url(ky_img/home.png);"></span></a>
				</div>
				<div class="themeStyle plug-btn plug-btn2 close"><a href="tel:13588888888"><span style="background-image: url(ky_img/tel.png);"></span></a>
				</div>
				<div class="themeStyle plug-btn plug-btn3 close"><a href="gywm.jsp"><span style="background-image: url(ky_img/aboutus.png);"></span></a>
				</div>
				<div class="themeStyle plug-btn plug-btn4 close"><a href="guestbook.html"><span style="background-image: url(ky_img/guestbook.png);"></span></a>
				</div>
				<div class="plug-btn plug-btn5 close"></div>
			</div>
		</div>
		<!--快捷按钮 结束-->
		<div>
			<ul class="wxlist"><a href="#top"><li><div  class="GoTop"><img src="images/top.png" />回顶部</div></li></a>
			</ul>
		</div>
		
		<div class="copyright">  萍乡市宏凯自动化设备有限公司&nbsp;版权所有</div>
	</div>
	<!--页脚结束-->
</body>

</html>