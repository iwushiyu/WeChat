<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

	<head>
		<title>产品中心</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="author" content="萍乡市宏凯自动化设备有限公司" />
		<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
		<link href="css/style.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
		<script src="js/common.js" type="text/javascript"></script>
	</head>

	<body class="body_product">
		<!--顶部开始-->
		<div id="top">
			<!--频道导航 开始-->
			<script>
				window.onload = function() {

					var oWin = document.getElementById("window");

					var oLay = document.getElementById("overlay");

					var oBtn = document.getElementById("popmenu");

					var oClose = document.getElementById("close");

					oBtn.onclick = function() {
						oLay.style.display = "block";
						oWin.style.display = "block"
					};

					oLay.onclick = function() {
						oLay.style.display = "none";
						oWin.style.display = "none"
					}

				};
			</script>
			<div style="margin-bottom:55px;">
				<div id="toolbar">
					<div class="fixed">
						<a class="ui-title" id="popmenu">产品中心</a>
						<a class="ui-btn-back" href="javascript:history.go(-1)"></a>
						<a class="ui-btn-home" href="websiteIndex.jsp"></a>
					</div>
				</div>
				<div id="overlay"></div>
				<div id="window">
					<ul class="windowlist">
						<li>
							<a href="gywm.jsp"><span>关于我们</span></a>
						</li>
						<li>
							<a href="cpzx.jsp"><span>产品中心</span></a>
						</li>

						<li>
							<a href="xwzx.jsp"><span>新闻中心</span></a>
						</li>

						<li>
							<a href="job.jsp"><span>人才招聘</span></a>
						</li>
						<li>
							<a href="fwzc.jsp"><span>服务支持</span></a>
						</li>
						<li>
							<a href="contactus.jsp"><span>联系我们</span></a>
						</li>
						<div class="clear"></div>
					</ul>
				</div>
			</div>
			<!--频道导航 结束-->
		</div>
		<!--顶部结束-->
		<div id="content">
			<div class="product">
				<!--子频道样式有三种（图文、文字、橱窗），默认均为微信样式 0：默认,1：图文,2：文字,3：橱窗,4：相册-->
				<!--3|橱窗-->
				<!--<ul class="channellist">
				<li><div class="ChannelIcon" style="border: 1px black solid;width: 90%; height: 100%;"><img src="images/AC1416.jpg" style="width: 100%; height: 100%;border: 1px blue solid;"/></div><div class="ChannelName">AC1416</div>
				</li>
				<li><div class="ChannelIcon"style="border: 1px black solid;width: 90%; height: 100%;"><img src="images/RBC2015.jpg" style="width: 100%; height: 100%;border: 1px blue solid;"/></div><div class="ChannelName">RBC2015</div>
				</li>
				<li><div class="ChannelIcon"style="border: 1px black solid;width: 90%; height: 100%;"><img src="images/HR60.jpg" style="width: 100%; height: 100%;border: 1px blue solid;"/></div><div class="ChannelName">HR60</div>
				</li>
				<li><div class="ChannelIcon"style="border: 1px black solid;width: 90%; height: 100%;"><img src="images/ACD2050-W.jpg" style="width: 100%; height: 100%;border: 1px blue solid;"/></div><div class="ChannelName">ACD2050-W</div>
				</li>
			</ul>-->
				<div class="channellist" style="float: left;width: 45%; height: 160px;margin-left: 15px;">
					<div class="ChannelIcon" style="border: 1px black solid;width: 160px; height: 120px;">
						<img src="images/AC1416.jpg" style="width: 100%; height: 100%;border: 1px blue solid;" /></div>
					<div class="ChannelName" style="text-align: center;">AC1416</div>
				</div>
				<div class="channellist" style="float: left;width: 45%; height: 160px;margin-left: 15px;">
					<div class="ChannelIcon" style="border: 1px black solid;width: 160px; height: 120px;">
						<img src="images/RBC2015.jpg" style="width: 100%; height: 100%;border: 1px blue solid;" />
					</div>
					<div class="ChannelName" style="text-align: center;">RBC2015</div>
				</div>
				<div class="channellist" style="float: left;width: 45%; height: 160px;margin-left: 15px;">
					<div class="ChannelIcon" style="border: 1px black solid;width: 160px; height: 120px;">
						<img src="images/HR60.jpg" style="width: 100%; height: 100%;border: 1px blue solid;" />
					</div>
					<div class="ChannelName" style="text-align: center;">HR60</div>
				</div>
				<div class="channellist" style="float: left;width: 45%; height: 160px;margin-left:15px;">
					<div class=" ChannelIcon" style="border: 1px black solid;width: 160px; height: 120px;">
						<img src="images/ACD2050-W.jpg" style="width: 100%; height: 100%;border: 1px blue solid;" />
					</div>
					<div class="ChannelName" style="text-align: center;">ACD2050-W</div>
				</div>
				<div class="clear"></div>
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
					<div class="themeStyle plug-btn plug-btn1 close">
						<a href="websiteIndex.jsp"><span style="background-image: url(ky_img/home.png);"></span></a>
					</div>
					<div class="themeStyle plug-btn plug-btn2 close">
						<a href="tel:13588888888"><span style="background-image: url(ky_img/tel.png);"></span></a>
					</div>
					<div class="themeStyle plug-btn plug-btn3 close">
						<a href="gywm.jsp"><span style="background-image: url(ky_img/aboutus.png);"></span></a>
					</div>

					<div class="plug-btn plug-btn5 close"></div>
				</div>
			</div>
			<!--快捷按钮 结束-->
			<div>
				<ul class="wxlist">
					<a href="#top">
						<li>
							<div class="GoTop"><img src="images/top.png" />回顶部</div>
						</li>
					</a>
				</ul>
			</div>

			<div class="copyright">萍乡市宏凯自动化设备有限公司&nbsp;版权所有</div>
		</div>
		<!--页脚结束-->
	</body>

</html>