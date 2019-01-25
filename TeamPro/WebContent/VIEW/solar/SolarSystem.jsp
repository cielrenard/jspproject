<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style>
	body {
			background:#003366;
	}
	
    @keyframes rot {
  to {
    transform: rotate(360deg);
  }
}

        .solar-system { 
        	position:relative; 
        	margin:0 auto; 
        	width:20%; 
        	display:table-cell; 
        	vertical-align:middle;}
        .solar-system .circle01 { 
        	position:relative; 
        	margin:0 auto; 
        	border-radius:100%; 
        	border:1px solid #ccc; 
        	width:540px; height:540px; }
        .solar-system .circle01 .round01 { 
        	position:absolute; 
        	margin:0 auto; 
        	display:table; 
        	border:1px solid #ccc;
        	width:510px; height:510px; 
        	left:15px; top:15px;
        	background:rgb(255, 255, 255, 1); 
        	border-radius:100%; 
        	 }
        .solar-system .circle01 .circle02 {/*작은 원  */
        	position:absolute; 
        	border:1px solid #fff;
        	width:80px; height:80px; 
        	left:215px; top:-55px;
        	transform-origin:40px 310px;
        	border-radius:100%;
        	animation: 20.5s rot linear infinite;  }
        .solar-system .circle01 .circle02 .round02 { /*작은 원 안의 원  */
        	position:absolute; 
        	width:8px; height:8px; 
        	left:36px; top:-4px;
        	transform-origin: 4px 44px;
        	border-radius:100%;
        	background:#fff; 
        	animation: 15s rot linear infinite;  }
        .solar-system .circle01 .round03 { 
        	position:absolute; 
        	width:12px; height:12px; 
        	bottom:-6px; left:264px; 
        	transform-origin: 6px -264px;
        	border-radius:100%;
        	background:#ffff00; 
        	animation: 25s rot linear infinite;   }
        .solar-system .circle01 .round04 { 
        	position:absolute; 
        	width:6px; height:6px; 
        	bottom:-3px; left:267px; 
        	transform-origin: 3px -267px;
        	border-radius:100%;
        	background:red; 
        	animation: 20s rot linear infinite;  }
        .solar-system .circle01 .round05 { 
        	position:absolute; 
        	bottom:-7px; left:282px; 
        	width:17px; height:17px; 
        	background:#009900; 
        	border-radius:100%; 
        	animation: 10s rot linear infinite; 
        	transform-origin: -13px -260.5px; }
        
       
        .solar-system .circle01 .round01 .tit { display: table-cell; vertical-align:middle; margin:0; color:#48494b; }
        .solar-system .circle01 .round01 .tit h1 { font-size:140px; font-size:2.375rem; line-height:1.18; width:30%; magin:0 auto; margin-top:0px; font-weight:30; word-break:keep-all; }
        .solar-system .circle01 .round01 .tit h1 div { font-weight:400; }
        .solar-system .circle01 .round01 .tit p { font-size:18px; font-size:1.125rem; line-height:1.5; width:30%; margin:0 auto; margin-top:50px; margin-top:1.563rem; }



</style>
<script>

</script>
</head>
<body>
</br></br></br></br></br></br>
<div class="solar-system" >
	<div class="circle01" align="center">
    	<div class="round03">R</div>
        <div class="round04">O</div>
        <div class="round05">S</div>
        <div class="round01">
        	<div class="circle02">
        		<div class="round02">B</div>
    		</div>
    		<div class="tit ta-c" >
        		<h1><div><marquee behavior=slide direction=right scrolldelay="50" onclick="index()">B</marquee></div>
        		<div><marquee behavior=slide direction=right scrolldelay="100" onclick="index()">R</marquee></div>
        		<div><marquee behavior=slide direction=right scrolldelay="150" onclick="index()">O</marquee></div>
        		<div><marquee behavior=slide direction=right scrolldelay="200" onclick="index()">S</marquee></div></h1>
        		<p><marquee behavior=slide direction=right scrolldelay="250" onclick="index()">BROS</marquee></p>
    		</div>
   		</div>
    </div>
</div>
<script>
function index(){
	
	location.href="../../index.brs"

}
</script>
</body>
</html>