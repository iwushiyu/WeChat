<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

	<head>
		<title>联系我们</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="author" content="萍乡市宏凯自动化设备有限公司" />
		<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
		<link href="css/style.css" rel="stylesheet" type="text/css" />
			<!--<script type="text/javascript" src="js/api?key=&v=1.1&services=true"></script>-->
		<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
		<script src="js/common.js" type="text/javascript"></script>
	</head>

	<body class="body_single">
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
						<a class="ui-title" id="popmenu">联系我们</a>
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
						<!--<li><a href="hzjm.html"><span>合作加盟</span></a>-->
						</li>
						<li>
							<a href="xwzx.jsp"><span>新闻中心</span></a>
						</li>
						<!--<li><a href="xswl.html"><span>销售网络</span></a>-->
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
			<div class="single">
				<ul class="wxlist">
					<li>
						<div class="ChannelName" style="text-align: center;">
							<h1>联系我们</h1>
						</div>

						<div class="contcat-desc" data-spm-protocol="i">
							<dl data-spm-anchor-id="a2615.7691479.autotrace-contactColumn.i4.68f7231cDMLkXr">
								<dt data-spm-anchor-id="a2615.7691479.autotrace-contactColumn.i1.68f7231cDMLkXr" style="float: left;">电&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;话：</dt>
								<dd>86 0799 7611166</dd>
							</dl>
							<dl class="m-mobilephone" >
								<dt style="float: left;">移动电话：</dt>
								<dd>18858770292
								</dd>
							</dl>
							<dl data-spm-anchor-id="a2615.7691479.autotrace-contactColumn.i5.68f7231cDMLkXr">
								<dt style="float: left;">传&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;真：</dt>
								<dd>86 0799 7611167</dd>
							</dl>
							<dl data-spm-anchor-id="a2615.7691479.autotrace-contactColumn.i3.68f7231cDMLkXr">
								<dt style="float: left;">地&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;址：</dt>

								<dd class="address">中国 江西 芦溪县 宣风镇排楼村
								</dd>
							</dl>
							<dl data-spm-anchor-id="a2615.7691479.autotrace-contactColumn.i0.68f7231cDMLkXr">
								<dt style="float: left;">公司主页：</dt>
								<dd style="float: left;margin: 0;">
									<div>
										<a href="http://www.cnhok.cn" class="topdomain" target="_blank">http://www.cnhok.cn </a>
									</div>
									<div>
										<a href="http://shop8287473671n68.1688.com" class="subdomain" target="_blank">http://shop8287473671n68.1688.com</a>
									</div>
								</dd>
							</dl>
						</div>

					
					</li>
				</ul>
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