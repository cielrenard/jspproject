<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../css/normalize.css">
<link rel="stylesheet" href="../css/main.css">
<link rel="stylesheet" href="../css/headhesive.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> 
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Karma">
<title>Insert title here</title>
<%--이벤트--%>
	<%--이미지 크기--%>
<!-- 	<script>
		var div = document.getElementById('#item1');
		var img = document.getElementById('#item2')
		var divAspect = 300 / 200;
		var imgAspect = img.height / img.width;

		if(imgAspect <= divAspect) {
			var imgWidthActual = div.offsetHeight / imgAspect;
			var imgWidthToBe = div.offsetHeight / divAspect;
			var marginLeft = Math.round((imgWidthActual - imgWidthToBe) / 2);
			img.style.cssText = 'width: auto; height: 100%; margin-left:' + marginLeft + 'px;'
		} else {
			img.style.cssText = 'width: 100%; height: auto; margin-left: 0;';
		}
	</script>	 --> 
	
	 <script>
	window.open('/BROS/VIEW/Product/ad.jsp','aa','width=1000 height=460');
	</script> 
	<%--베너 이벤트--%>	
	<script type="text/javascript" src="../js/headhesive.min.js"></script>	
	<script>
		//Set options 
		var options = {
			offset: '#showHere',
			offsetSide: 'top',
			classes: {
				clone: 'banner--clone',
				stick: 'banner--stick',
				unstick: 'banner--unstick'
			}
		};
		//Initialise with options
		var banner = new Headhesive('.banner',options);
		
		//Headhesive destroy
		//banner.destroy();		
	</script>
    <script type="text/javascript">
        var _gaq = _gaq || [];
            _gaq.push(['_setAccount', 'UA-17303121-4']);
                            _gaq.push(['_trackPageview']);
            (function(){
                var ga = document.createElement('script');
                ga.type = 'text/javascript';
                ga.async = true;
                ga.src = ('https:' == document.location.protocol ? 'https://ss1' : 'http://www') + '.google-analytics.com/ga.js';
                var s = document.getElementsByTagName('script')[0];
                s.parentNode.insertBefore(ga,s);
                })();
    </script>
    		
	<%--스크롤스파이 이벤트--%>
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>	
  	
	<%--마우스휠 이벤트--%>
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script type="text/javascript">
		window.onload = function () {
			$(".box").each(function(){
				//개별적으로 Wheel 이벤트 적용
				$(this).on("mousewheel DOMMouseScroll", function(e){
					e.preventDefault();
					var delta = 0;
					if (!event) event = window.event;
					if (event.wheelDelta) {
						delta = event.wheelDelta / 120;
						if (window.opera) delta = -delta;						
					} else if (event.detail) delta = -event.detail / 3;
					var moveTop = null;
					//마우스휠을 위에서 아래로
					if (delta<0) {
						if($(this).next() != undefined) {
							moveTop = $(this).next().offset().top;
						}
					//마우스휠을 아래에서 위로
					}else {
						if ($(this).prev() != undefined) {
							moveTop = $(this).prev().offset().top;
						}
					}
					// 화면 이동 0.8초 (800)
					$("html,body").stop().animate({
						scrollTop: moveTop + 'px'
					}, {
						duration: 800, complete: function(){
						}	
					});
				});
			});
		}
	</script>
<%--할일--%>		
<script>
	function UpdateForm(){
		//할일
		//글쓰기 폼 요청
		//자바스크립트에서 문서이동(새로운 요청을 하는 방법)
		//location객체의 href속성이용
		location.href="../Product/UpdateForm.br";
	}
</script>	
<%--스타일--%>  
	<style type="text/css">
		html,body{ margin: 0; padding: 0; width: 100%; height: 100%;}
		.box{ width:100%; height:100%; position:relative; color:#ffffff; font-size:24pt;}
	</style>
	
	<style>
	body,h1,h2,h3,h4,h5,h6 {font-family: "Karma", sans-serif}
	.w3-bar-block .w3-bar-item {padding:20px}
	</style>
	
	<style>
      ul.nav-pills {
          top: 370px;
          left: 92.5%;
          position: fixed;
          z-index: 10;
          font-size: 15pt
      }
      
      .navbar .navbar-nav {
      	display:inline-block;
      	float:none;
      }    
      
      .navbar .navbar-collapse {
      	text-align:center;
      }
          
      #section1-1 {padding: 50px 0px 0px; height: 1150px; color: #000000; background-color: #ffffff;  opacity: 0.2; top: 1942px; right: 0px; left: 0px;}
      #section3-1 {padding: 50px 0px 0px; height: 910px; color: #000000; background-color: rgba(255,255,255,0); top: 1942px; right: 0px; left: 0px;}
      #section3-a {margin: 285px 0px;}
      #section3-b {padding: 120px; background-color: #ffffff;}
      #section4-1 {padding: 50px 0px 0px; height: 910px; color: #000000; background-color: rgba(255,255,255,0); top: 1942px; right: 0px; left: 0px;}
      #section4-a {margin: 296px 0px;}
      #section4-b {padding: 120px; background-color: #ffffff;}
      #section5-1 {padding: 50px 0px 0px; height: 910px; color: #000000; background-color: rgba(255,255,255,0); top: 1942px; right: 0px; left: 0px;}
      #section5-a {margin: 296px 0px;}
      #section5-b {padding: 120px; background-color: #ffffff;}                   
            
      #banner2 {height: 466px;}
      
      #section6 table, th, td {
      	text-align: center;
      	font-weight: lighter;
      	font-size: 20px;
      	color: black     	
      } 
             
	</style>
</head>
<%--보여지는 페이지--%>
<body>	
	<%--네이게이션--%>
	<nav class="col-sm-3" id="myScrollspy">
	      <ul class="nav nav-pills nav-stacked">
	        <li><a href="#section1">HOME</a></li>
	        <li><a href="#section2">INTRODUCTION</a></li>
	        <li><a href="#section3">BEST 1</a></li>
			<li><a href="#section4">BEST 2</a></li>
			<li><a href="#section5">BEST 3</a></li>
			<li><a href="#section6">All PRODUCT</a></li>
	      </ul>
    </nav>
    
    <%--내용--%>	
	<div class="box" id="section1" style="background-image:url(../img/architecture-1850129_1920.jpg);
		-webkit-background-size: cover;
  		-moz-background-size: cover;
  		-o-background-size: cover;
  		background-size: cover;
	">
		<%--베너--%>
		<header class="banner banner--clone banner--stick" id="banner1" style="height: 50px">
			<nav class="navbar navbar-default" style="margin: 0px; border: 0px; background-color: rgba(255,255,255,0)">
				<div class="container-fluid">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
							data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
								<span class="sr-only"></span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
							</button>
							<a class="navbar-brand" href="#" style="padding: 5px; font-family: Serif; font-weight: bold; font-size: 20px"><img style="max-width: 350px"src="../img/title-img2.png"/></a>
					</div>
					<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
						<ul class="nav navbar-nav navbar-left" style="font-family: Serif; font-weight: bold; font-size: 25px; color: #ffffff">
							<li><a href="../index.brs">HOME</a></li>
							<li><a href="#">NOTICE</a></li>
							<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
									aria-haspopup="true" aria-expanded="false">TEST</a>
								<ul class="dropdown-menu" style="font-family: 돋움;">
									<li><a href="#">유전자 검사</a></li>
									<li><a href="#">설문 조사</a></li>
									<li><a href="#">최종 검사 결과 확인</a></li>
								</ul>
							</li>
							<li class="active"><a href="#section6">PRODUCT<span class="sr-only"></span></a></li>
							<li><a href="#">1:1 CONSULTATION</a></li>
							<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
									aria-haspopup="true" aria-expanded="false">MY PAGE</a>
								<ul class="dropdown-menu" style="font-family: 돋움">
									<li><a href="#">회원정보 수정</a></li>
								</ul>
							</li>
						</ul>
						<form class="navbar-form navbar-right" style="padding: 0px; margin: 0px" >
							<div class="form-group">
								<input type="text" class="form-control" placeholder="Enter search term">
							</div>
							<button type="submit" class="btn btn-default">Search</button>
						</form> 
						<ul class="nav navbar-nav navbar-right" style="font-family: Serif; font-weight: bold; font-size: 25px; color: #ffffff">
							<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
									aria-haspopup="true" aria-expanded="false">GUEST</a>
								<ul class="dropdown-menu" style="font-family: 돋움">
									<li><a href="#">로그인</a></li>
									<li><a href="#">회원가입</a></li>
								</ul>	
							</li>
						</ul>					
					</div>
				</div>
			</nav>
		</header>					
		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
		<script src="../js/bootstrap.js"></script> 
		<header class="banner" id="banner2" style="align: center; border: 0px">
			<nav class="navbar navbar-default" style="margin: 0px; height: 130px; border: 0px; background-color: rgba(255,255,255,0)">
				<img src="../img/title-img.png"/></br>
					<div class="container-fluid">
						<div class="navbar-header">
							<button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
								data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
									<span class="sr-only"></span>
									<span class="icon-bar"></span>
									<span class="icon-bar"></span>
									<span class="icon-bar"></span>
							</button>
						</div>
						<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
							<ul class="nav navbar-nav" style="font-family: Serif; font-weight: bold; font-size: 30px; color: #ffffff">
								<li><a href="../index.brs">HOME</a></li>
								<li><a href="#">NOTICE</a></li>
								<li class="dropdown">
									<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
										aria-haspopup="true" aria-expanded="false">TEST</a>
									<ul class="dropdown-menu" style="font-family: 돋움">
										<li><a href="#">유전자 검사</a></li>
										<li><a href="#">설문 조사</a></li>
										<li><a href="#">최종 검사 결과 확인</a></li>
									</ul>
								</li>
								<li class="active"><a href="#section6">PRODUCT<span class="sr-only"></span></a></li>
								<li><a href="#">1:1 CONSULTATION</a></li>
								<li class="dropdown">
									<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
										aria-haspopup="true" aria-expanded="false">MY PAGE</a>
									<ul class="dropdown-menu" style="font-family: 돋움">
										<li><a href="#">회원정보 수정</a></li>
									</ul>
								</li>
							</ul>															
						</div>
					</div>
				</nav>	
			</nav>
		</header>
		<a id="showHere"></a>	
	</div>		
	
	<%--Section--%>
	<div class="box" id="section2" style="background-image:url(../img/eunwoo3.jpg);
		-webkit-background-size: cover;
  		-moz-background-size: cover;
  		-o-background-size: cover;
  		background-size: cover;	
	">
       <div id="section1-1" class="container-fluid"> 
       
	    <div id="section1-2" style="position: absolute; top: 50%; left: 2%"> 
	       	<h1 style="text-align: center; color: grey;
	       		text-shadow: 2px 2px 10px silver, 2px -2px 10px silver, -2px 2px 10px silver, -2px -2px 10px silver">       	
<!-- 	       	It's choice - not chance - that determines your destiny.</br> -->
	       	<h1 style="text-align: left">-Bros Company- Present</h1>
	       	</h1>
       	</div>     	
       </div>	
	</div>			
	<div class="box" id="section3" style="background-size: 100%; background-image:url(../img/apple-1873078_1280.jpg)">
        <div id="section3-1" class="container-fluid">
            <div id="section3-a" class="container-fluid">
                <h1 style="font-size: 50pt; color: white; font-weight: bold(=500); text-decoration: underline">Eco-friendly Material</h1>
            </div>
            <div id="section3-b" class="container-fluid" style="font-size: 18pt">
                <h3 style="font-weight: bold(=500); text-align: left; font-family: 돋움; font-size: 17pt; color: grey">
                	브로스그룹은 기업 활동의 접점에 있는 모든 이해관계자가 환경적 사회적 가치를 보다 잘 이해하고,</br>
                	일상 속 라이프 스타일을 지속 가능한 방식으로 전환할 수 있도록 돕고자 합니다. 제품과 매장, 그리고 </br>
                	브랜드 활동을 혁신하여 누구나 손쉽게 지속 가능한 삶의 방식을 실천할 수 있도록 노력하고 있습니다.
                </h3>
                </br>
                </br>
                <h3 style="font-weight: bold(=500); text-align: left; font-family: 돋움; font-size: 17px; color: grey">
                	자세히보기
                </h3>
			</div>
            </div>
        </div>		
	</div>
	<div class="box" id="section4" style="background-size: 100%; background-image:url(../img/lavender-blossom-1595581_1280.jpg)">
        <div id="section4-1" class="container-fluid">
            <div id="section4-a" class="container-fluid">
                <h1 style="font-size: 50pt; color: white; font-weight: bold(=500); text-decoration: underline">Aromatic</h1>
            </div>
            <div id="section4-b" class="container-fluid" style="font-size: 18pt">
                 <h3 style="font-weight: bold(=500); text-align: left; font-family: 돋움; font-size: 17pt; color: grey">
                	브로스그룹은 기업 시민의 일원으로서 사회적,경제적 주체들과의 공생 및 협력을 도모하여 함께 멀리 가는</br>
                	기업이 되고자 합니다.임직원과 비즈니스 파트너,그리고 지역사회와 함께 포용적으로 성장하기 위해 노력합니다.</br>
                </h3>
                </br>
                </br>
                <h3 style="font-weight: bold(=500); text-align: left; font-family: 돋움; font-size: 17px; color: grey">
                	자세히보기
                </h3>
            </div>
        </div>			
	</div>	
	<div class="box" id="section5" style="background-size: 100%; background-image:url(../img/dna-3539309_1280.jpg)">
        <div id="section5-1" class="container-fluid">
            <div id="section5-a" class="container-fluid">
                <h1 style="font-size: 50pt; color: white; font-weight: bold(=500); text-decoration: underline">Scientific</h1>
            </div>
            <div id="section5-b" class="container-fluid" style="font-size: 18pt">
                  <h3 style="font-weight: bold(=500); text-align: left; font-family: 돋움; font-size: 17pt; color: grey">
                	브로스그룹은 기업 활동 전 과정에 걸쳐 순환 경제를 실현하기 위해 노력합니다.온실가스의 배출을 줄이고 </br>
                	신재생 에너지의 사용을 확대하며 자원효율성을 제고하여 미래 세대가 누릴 자연과 생태를 보전하고자 합니다.</br>
                </h3>
                </br>
                </br>
                <h3 style="font-weight: bold(=500); text-align: left; font-family: 돋움; font-size: 17px; color: grey">
                	자세히보기
                </h3>
            </div>
        </div>		
	</div>	
	<div class="box" id="section6" style=" padding: 80px; background-color:#f2f2f2;">
	<%--1.목록 출력--%>
	<table style="margin: auto; height: 200px; width: 1835px; background-color: #ffffff">
		<tr>
			<th style="font-decoration: nuderline; font-size: x-large">ALL PRODUCT</th>
		</tr>
	</table>
		<c:forEach var="temp" items="${LIST}">
			<ul style="list-style:none; float:left">
				<li style="font-size: large; color: black; text-align: center">${temp.no}</li>
				<li style="color: black; text-align: center">
					<a href="../Product/ProductDetail.br?oriNo=${temp.no}&nowPage=${PINFO.nowPage}">
					<img id="item2" style="width: 330px; height: 330px;" src="../img/${temp.cfile}"/>
					</a>
				</li>
				<li style="font-size: xx-large; color: black; text-align: center; text-transform: capitalize"><a href="../Product/ProductDetail.br?oriNo=${temp.no}&nowPage=${PINFO.nowPage}">${temp.pname}</a></li>
				<li style="font-size: large; color: black; text-align: center">${temp.sen}</li>
				<li style="font-size: large; color: black; text-align: center">${temp.price}</li>
			</ul>
		</c:forEach>
	</br>			
	<%--2.페이지 이동 기능을 추가 [이전][1][다음]--%>
	<table style="margin: auto; height: 190px; width: 1835px; background-color: #ffffff">
		<tr>
			<td align="center" style="font-size: 20pt">
			<%--[이전]링크만들기--%>
			<c:if test="${PINFO.startPage eq 1}">
				Before
			</c:if>
			<c:if test="${PINFO.startPage ne 1}">
				<%--링크는 다시 목록보기를 요청+원하는 페이지를 알려주면 된다--%>
				<a href="../Product/ProductList.br?nowPage=${PINFO.startPage-1}">Before</a>
			</c:if>
			<%--[1]링크 만들기--%>
			<c:forEach var="page" begin="${PINFO.startPage}" end="${PINFO.endPage}">
				<a href="../Product/ProductList.br?nowPage=${page}">[${page}]</a>
			</c:forEach>
			<%--[다음]링크만들기--%>
			<c:if test="${PINFO.endPage eq PINFO.totalPage}">
				Next
			</c:if>
			<c:if test="${PINFO.endPage ne PINFO.totalPage}">
				<a href="../Product/ProductList.br?nowPage=${PINFO.endPage+1}">Next</a>
			</c:if>
			</td>
		</tr>
	</table>
	<%--3.목록보기에서 필요한 다른 기능(글쓰기)을 처리하도록 한다--%>
	<table style="margin: auto; height: 150px; width: 1835px; background-color: #ffffff">
		<tr>
			<td align="center">
				<%-- <input type="button" id="wbtn" value="<img src='/BROS/VIEW/Product/ubtn.png'>" onClick="UpdateForm();"/> --%>
				<!-- <button id="wbtn" onClick="UpdateForm()" ><img style="width: 200px; height: 100px" src='/BROS/VIEW/Product/ubtn.png'></button> -->
			 <form action="../Product/UpdateForm.br">
				<input type="image" src="../img/ubtn.png" style="width: 200px; height: 100px">
			 </form>
			</td>
		</tr>
	</table>
	</div>
	<div class="box" id="section6" style="padding: 80px; background-color:#f2f2f2;">
	<table style="margin: auto; height: 1030px; width: 1750px; background-image:url(../img/eunwoo2.jpg);
		-webkit-background-size: cover;
  		-moz-background-size: cover;
  		-o-background-size: cover;
  		background-size: cover;		
	">
		<tr>
			<th style="font-decoration: nuderline; font-size: x-large; text-align: center; color: white;
	       		text-shadow: 2px 2px 10px silver, 2px -2px 10px silver, -2px 2px 10px silver, -2px -2px 10px silver">ALL PRODUCT
	       		It's choice - not chance - that determines your destiny.
	       	</th>	       	     		
		</tr>
	</table>		
	</div>
	</body>
</html>	