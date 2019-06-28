<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<title>新闻中心</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="author" content="萍乡市宏凯自动化设备有限公司" />
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script src="js/common.js" type="text/javascript"></script>
</head>

<body class="body_article">
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
				<div class="fixed"><a class="ui-title" id="popmenu">新闻中心</a><a class="ui-btn-back" href="javascript:history.go(-1)"></a>
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
					<!--<li><a href="hzjm.html"><span>合作加盟</span></a>-->
					</li>
					<li><a href="xwzx.jsp"><span>新闻中心</span></a>
					</li>
					<!--<li><a href="xswl.html"><span>销售网络</span></a>-->
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
		<div class="article">
			<!-- 30文章模型 31图片模型 32单页模型 33 链接模型 34视频模型 35下载模型 36产品模型-->
			<!--频道样式微信样式 0默认, 1图文, 2文字, 3橱窗, 4相册-->
			<!-- 文章模型-->
			<!-- 默认样式列表 开始-->
			<ul class="thumblist"><a href="#"><li><div class="InfoTitle">油压缓冲器工作的原理</div><div class="InfoPicture"><img src="images/company-int.jpg"  /></div><div class="InfoSContent">缓冲器有很多种类，像弹簧等，不过这些都存在着各种缺陷，而油压缓冲器在工作时候却非常的稳定。那么其到底是运用什么原理才如此平稳而安静而停止物体呢？

      油压缓冲器在整个缓冲工作中，提供的抵抗力近似于一个固定值，这样就可以将所有的动能都几乎转化成热能而散发到空气当中去。其有这种良好的性能，主要是因为其特殊的设计结构。油压缓冲器包括主工作部件以及其中的活塞等部件，在主部件外面有一排部件组作为泄压作用，这种构造可以快速的泄压，这样就解决了绝大部分的冲击，然后油其他辅助部件逐步的泄压，就可以很好地减少伤害，也就形成了其独特的稳定性能。

       还因为其受到撞击时候会使得活塞向内运动，然后特殊的油孔设计使得产生抵抗力，同时也是由于这种特殊设计，缸内的压力一直保持在一个稳定值，所以抵抗力也就维持在一个固定值，从而形成了油压缓冲器的平稳安静的停止物体的性能。</div></li></a>
				<a href="#">
					<li>
						<div class="InfoTitle">油压缓冲器使用维护</div>
						<div class="InfoPicture">
							<img src="images/company-int.jpg" />
						</div>
						<div class="InfoSContent">使用维护：

      油压缓冲器在使用的过程中，必须保持其自身的稳定及平衡。其斜角不得大于15度。工作温度必须保持在-10到80度之间；撞击速度控制之3.0米/秒之内。如果发现油压缓冲器在工作当中出现漏油，卡塞，断裂等情况，应立即停止使用。

    本公司专业生产AC,AD,ACD,HR.RBC,RB等系列油压缓冲器   .</div>
					</li>
					</a><a href="#"><li><div class="InfoTitle">油压缓冲器的作用</div><div class="InfoPicture">
						<img src="images/company-int.jpg"  /></div><div class="InfoSContent">油压缓冲器的作用：自动化机械作为中可减少震动及噪音，将移动中物体所产生之动能转换为热能并释放于大气中，在动作中将物体平衡有效的停止；使机械提高效率增加产能，使机器寿命延长降低维修成本，使机械动作稳定维护产品品质，使机器的操作更安全避免意外，使工作环境发送提高人员效率，增加企业的竞争优势。</div></li></a>
			</ul>
			<div class="page"></div>
			<!-- 默认样式列表 结束-->
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
				<div class="themeStyle plug-btn plug-btn1 close"><a href="websiteIndex.jsp"><span style="background-image: url(ky_img/home.png);"></span></a>
				</div>
				<div class="themeStyle plug-btn plug-btn2 close"><a href="tel:13588888888"><span style="background-image: url(ky_img/tel.png);"></span></a>
				</div>
				<div class="themeStyle plug-btn plug-btn3 close"><a href="gywm.jsp"><span style="background-image: url(ky_img/aboutus.png);"></span></a>
				</div>
			
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