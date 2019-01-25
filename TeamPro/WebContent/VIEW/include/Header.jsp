<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/normalize.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/headhesive.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> 
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Karma">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
<title>Insert title here</title>
<%--회원 --%>
<c:if test="${!empty param.insertResult && param.insertResult eq false}">
		<script type="text/javascript">
			alert("회원가입 실패!");
		</script>
</c:if>
<c:if test="${!empty param.insertResult && param.insertResult eq true}">
		<script type="text/javascript">
			alert("회원가입을 축하드립니다! 로그인 해 주세요.");
		</script>
</c:if>
	
<c:if test="${!empty param.memberCheck && param.memberCheck eq false}">
	<script type="text/javascript">
		alert("이미 가입된 회원입니다. 로그인 해주세요.");
	</script>
	<script>
$(function(){
	$('#sub').click(function(){
		$('#Qfrm1').submit()		
	})
})
</script>
</c:if>
<%--이벤트--%>
	<%--이미지 크기--%>
	<%--베너 이벤트--%>	
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/headhesive.min.js"></script>
		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
		
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
	
<%--스타일--%>  
	<style type="text/css">
		html,body{ margin: 0; padding: 0; width: 100%; height: 100%;}
		.box{ width:100%; height:100%; position:relative; color:#ffffff; font-size:24pt;}
	
	body,h1,h2,h3,h4,h5,h6 {font-family: "Karma", sans-serif}
	.w3-bar-block .w3-bar-item {padding:20px}
	
      ul.nav-pills {
          top: 370px;
          left: 92%;
          position: fixed;
          z-index: 10;
      }
      
      .navbar .navbar-nav {
      	display:inline-block;
      	float:none;
      }    
      
      .navbar .navbar-collapse {
      	text-align:center;
      }
          
      #section1-1 {padding: 50px 0px 0px; height: 910px; color: #000000; background-color: #ffffff;  opacity: 0.2; top: 1942px; right: 0px; left: 0px;}
      #section3-1 {padding: 50px 0px 0px; height: 910px; color: #000000; background-color: rgba(255,255,255,0); top: 1942px; right: 0px; left: 0px;}
      #section3-a {margin: 200px 0px;}
      #section3-b {padding: 161px; background-color: #ffffff;}
      #section4-1 {padding: 50px 0px 0px; height: 910px; color: #000000; background-color: rgba(255,255,255,0); top: 1942px; right: 0px; left: 0px;}
      #section4-a {margin: 200px 0px;}
      #section4-b {padding: 161px; background-color: #ffffff;}
      #section5-1 {padding: 50px 0px 0px; height: 910px; color: #000000; background-color: rgba(255,255,255,0); top: 1942px; right: 0px; left: 0px;}
      #section5-a {margin: 200px 0px;}
      #section5-b {padding: 161px; background-color: #ffffff;}                   
            
      #banner2 {height: 284px;}
      
      #section6 table, th, td {
      	text-align: center;
      	font-weight: lighter;
      	font-size: 20px;
      	color: black     	
      } 
             
	</style>

<%--보여지는 페이지--%>

	<header class="banner" id="banner2" style="align: center; border: 0px">
			<nav class="navbar navbar-default" style="margin:0px; height: 130px; border: 0px; background-color: rgba(255,255,255,0);">
				<div style=" width:1051px;margin-left:auto;margin-right:auto">
				<img src="${pageContext.request.contextPath}/img/title-img.png" style="align:center;height:210px"/></div>
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
								<li><a href="#">HOME</a></li>
								<c:if test='${empty UID}'>
									<li><a href="../Notice/BoardList.br">NOTICE</a></li>
								</c:if>
								<c:if test='${!empty UID&&isLoginadmin eq false}'>
									<li><a href="../Notice/BoardList.br">NOTICE</a></li>
								</c:if>
								<c:if test='${!empty UID&&isLoginadmin eq true}'>
									<li><a href="../AdNotice/BoardList.br">NOTICE</a></li>
								</c:if>
								<li class="dropdown">
									<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
										aria-haspopup="true" aria-expanded="false">TEST</a>
									<ul class="dropdown-menu" style="font-family: 돋움">
										<li><a href="#">유전자 검사</a></li>
									<c:if test='${empty UID}'>
										<li><a href="../VIEW/login/loginform.brs">설문 조사</a></li>
										<li><a href="../VIEW/login/loginform.brs">최종 검사 결과 확인</a></li>									
									</c:if>
									<c:if test='${!empty UID&&isLoginadmin eq false}'>
										<li><a href="../Question/StartQuestion.br">설문 조사</a></li>
										<li><a href="../Result/EndResult.br">최종 검사 결과 확인</a></li>
									</c:if>
									</ul>
								</li>
								<li><a href="../Product/ProductList.br">PRODUCT<span class="sr-only"></span></a></li>
								<li><a href="../Consulting/BoardList.br">1:1 CONSULTATION</a></li>
								<li class="dropdown">
									<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
										aria-haspopup="true" aria-expanded="false">MY PAGE</a>
									<ul class="dropdown-menu" style="font-family: 돋움">
										<li><a href="#">회원정보 수정</a></li>
									</ul>
								</li>
						<ul class="nav navbar-nav" style="font-family: Serif; font-weight: bold; font-size: 30px; color: #ffffff">
							<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
									aria-haspopup="true" aria-expanded="false">Member</a>
								<ul class="dropdown-menu" style="font-family: 돋움">
									<c:if test='${empty UID}'>
										<li><a href="../VIEW/login/loginform.brs">로그인</a></li>
										<li><a href="../VIEW/member/memberCheckform.brs">회원가입</a></li>
									</c:if>
									<!-- 회원 로그아웃 링크 메뉴  -->
									<c:if test='${!empty UID&&isLoginadmin eq false}'>
										<a href="${pageContext.request.contextPath}/VIEW/login/logoutproc.brs">회원 로그아웃 </a>
									</c:if>
									<!-- 관리자 페이지  -->
									<c:if test='${!empty UID&&isLoginadmin eq true}'>
										<c:redirect url="../VIEW/admin/admin_index.brs">
											<c:param name="UID"  	value="${UID}" />
										</c:redirect>
									</c:if>
								</ul>	
							</li>
						</ul>
							</ul>															
						</div>
					</div>
				</nav>	
			</nav>
			
		</header>
		
</head>
