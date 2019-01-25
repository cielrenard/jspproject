<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c"  uri ="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://d3js.org/d3.v5.min.js"></script>
<script src="../js/billboard.js"></script>
<link rel="stylesheet" href="../css/billboard.css">
<script src="../js/jquery-3.3.1.min.js"></script>
<link href="../css/bootstrap.min.css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script>
	$(function(){
		$('#backbtn').click(function(){
			location.href="../index.html"			
		})
		$('#inbtn').click(function(){
			
			$('#hfrm').submit();

		})
	})
</script>
<style>
@keyframes rot {
  to {  
    transform: rotate(360deg);
  }
}
        .solar-system { position:relative; margin:0 auto; width:20%; display:table-cell; vertical-align:middle;}
        .solar-system .circle01 { position:relative; border-radius:100%; border:1px solid #ccc; width:540px; height:540px; margin:0 auto; }
        .solar-system .circle01 .round01 { display:table; width:510px; height:510px; background:rgb(255, 255, 255, 0.9); border-radius:100%; position:relative; left:14px; top:14px; }
        .solar-system .circle01 .circle02 { width:80px; height:80px; top:-50px; left:230px; border:1px solid #00000f; border-radius:100%; position:absolute; animation: 20.5s rot linear infinite; transform-origin: 25px 305px; }
        .solar-system .circle01 .circle02 .round02 { position:absolute; left:36.5px; top:-4px; width:7px; height:7px; background:#c00; border-radius:100%; animation: 13s rot linear infinite; transform-origin: 3px 43px; }
        .solar-system .circle01 .round03 { position:absolute; bottom:-6.5px; left:263.5px; width:13px; height:13px; background:#0c0; border-radius:100%; animation: 17.5s rot linear infinite; transform-origin: 6px -263px;  }
        .solar-system .circle01 .round05 { position:absolute; bottom:-3px; left:281.5px; width:17px; height:17px; background:#0cc; border-radius:100%; animation: 18.5s rot linear infinite; transform-origin: -13px -260.5px; }
        .solar-system .circle01 .round04 { position:absolute; bottom:-3px; left:281.5px; width:7px; height:7px; background:#00c; border-radius:100%; animation: 15.5s rot linear infinite; transform-origin: -13px -265.5px; }
        .solar-system .circle01 .round01 .tit { display: table-cell; vertical-align:middle; color:#48494b; }
        .solar-system .circle01 .round01 .tit h1 { font-size:38px; font-size:2.375rem; line-height:1.18; width:66.66%; margin:0 auto; font-weight:300; word-break:keep-all; }
        .solar-system .circle01 .round01 .tit h1 span { font-weight:400; }
        .solar-system .circle01 .round01 .tit p { font-size:18px; font-size:1.125rem; line-height:1.5; width:66.66%; margin-left:auto; margin-right:auto; margin-top:25px; margin-top:1.563rem; }



    </style>
    <script>
    
    </script>
</head>
<body>
<div class="box" id="section1" style="background-size: 300; background-image:url(${pageContext.request.contextPath}/img/architecture-1850129_1920.jpg)">
<%@ include file="../include/Header.jsp"%>
<form id="hfrm" method="post" Action="../Question/QuesResult.br">
	<input type="hidden" name="sum1" value="${SUM1}">
	<input type="hidden" name="sum2" value="${SUM2}">
	<input type="hidden" name="sum3" value="${SUM3}">	
	<input type="hidden" name="sum4" value="${SUM4}">
	<input type="hidden" name="sum5" value="${SUM5}">
</form>
	<div class="container">
		<div class="solar-system">
			<div class="circle01" align="center">
				<div class="round03"></div>
				<div class="round04"></div>
				<div class="round05"></div>
				<div class="round01">
					<div class="circle02">
						<div class="round02"></div>
					</div>
					<div class="tit ta-c">
						<p>${USER}</p>
						<p>님의 설문 결과는 다음과 같습니다.</p>
						<br>
						<div id="RadarChart">
							<span> <script>
								var sum1 = '<c:out value="${SUM1}"/>'
								var sum2 = '<c:out value="${SUM2}"/>'
								var sum3 = '<c:out value="${SUM3}"/>'
								var sum4 = '<c:out value="${SUM4}"/>'
								var sum5 = '<c:out value="${SUM5}"/>'
									
								var chart = bb.generate({
									data : {
										x : "x",
										columns : [
												[ "x", "성격", "식습관", "운동성",
														"체질", "체형" ],
												[ "<c:out value="${USER}"/>",
														sum1, sum2, sum3, sum4,
														sum5 ], ],
										type : "radar",
										labels : true
									},
									radar : {
										axis : {
											max : 50
										},
										level : {
											depth : 5
										},
										direction : {
											clockwise : true
										}
									},
									bindto : "#RadarChart"
								});
							</script>
							</span>
						</div>
					</div>
				</div>
			</div>
		</div>
		<input type="button" id="backbtn" class="btn btn-primary" value="돌아가기">
		<input type="button" id="inbtn" class="btn btn-primary" value="저장하기">
	</div>


</div>
	<script src="../js/bootstrap.min.js" ></script>
</body>
</html>