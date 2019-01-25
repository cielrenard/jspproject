<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c"  uri ="http://java.sun.com/jsp/jstl/core" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>최종 결과 페이지</title>
<script src="https://d3js.org/d3.v5.min.js"></script>
<script src="../js/billboard.js"></script>
<link rel="stylesheet" href="../css/billboard.css">
<script src="../js/jquery-3.3.1.min.js"></script>
<link href="../css/bootstrap.min.css" rel="stylesheet">
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 <style>
 .container {
 				margin:auto;
 }
 @keyframes rot {
  to {  
    transform: rotate(360deg);
  }
}
        .solar-system { position:relative; margin:0 auto; width:20%; display:table-cell; vertical-align:middle;}
        .solar-system .circle01 { position:relative; border-radius:100%; border:1px solid #ccc; width:540px; height:540px; margin:0 auto; }
        .solar-system .circle01 .round01 { display:table; width:540px; height:540px; background:rgb(255, 255, 255, 0.7); border-radius:100%; position:relative; left:0px; top:0px; }
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
$(function(){	
	/* $('#rbtn').click(function(){		
		$("#Hfrm").show();
		//$("#Hfrm").css('display','block');
		return false;
	}) */
	$('#babtn').click(function(){
		$('#infrm').submit();	
	})
/* 	$('#GeneRe').click(function(){
		$('#gene').show();
		return false;		
	}) */
	/* $('#bodyre').click(function(){
	
		//$('#RadarChart').hide();
		$('#RadarChart').show();
		$('#RadarChart svg').attr('width','400');
		//$('#RadarChart svg').css('width','400');
		//$('#RadarChart').css('display','block');
		return false;
	}) */
	
	
	
})
	

</script>
</head>
<body>
<div class="box" id="section1" style="background-size: 300; background-image:url(${pageContext.request.contextPath}/img/architecture-1850129_1920.jpg)">
<%@ include file="../include/Header.jsp"%>

<div class="container">
	<form id="Hfrm" method="post">
		
				<span id="bodyre">체질 검사 결과 보기</span>
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
								<div id="RadarChart">
									<span> <script>
										var chart = bb
												.generate({
													data : {
														x : "x",
														columns : [
																[ "x", "성격",
																		"식습관",
																		"운동성",
																		"체질",
																		"체형" ],
																[
																		"${USER}",
																		"${RESULT.res1}",
																		"${RESULT.res2}",
																		"${RESULT.res3}",
																		"${RESULT.res4}",
																		"${RESULT.res5}" ], ],
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
	

				<table class="table table-primary table-striped text-left">
					<tr class="info">
						<td><span id="GeneRe">유전자 검사 결과 보기</span></td>
						<td id="gene" colspan="2">gccagtgagg gcaaccagag caacgccacg
							gccggggctg<br /> gaggcgcctg gtgccagggg ctcgacgtgc ccaacgaact<br /> 
							cttcctcacg ctggggctgg tgagcctggt ggagaacctg121 ctggtggtgg
							......<br/>
							>a=148, g=224, t=194, c=334 총 1146<br />
						</td>
					</tr>
				</table>		
	</form>	
	<form id="infrm" action="../index.jsp">	
	<button id="babtn" class="btn btn-primary pull-right">돌아가기</button>
</form>
</div>
</div>
</div>
 <script src="../js/bootstrap.min.js"></script>
</body>
</html>