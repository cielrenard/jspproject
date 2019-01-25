<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글쓰기</title>
<style>
	div {
			text-align:right;
		}
	#title {
				width:500px;
			}
	#body {
				width:500px;
				height:100px;
				resize:none;
			}
</style>
<script src="../js/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link href="../css/bootstrap.min.css" rel="stylesheet">
<script src="../js/bootstrap.min.js"></script>

<script>	
	//글자수 제한
	$(document).ready(function(){
		$('#body').on('keyup', function(){
			var body=$(this).val();
			$('#counter').html("("+body.length+"/최대 150자)");	//글자수 실시간 카운팅
			//글자수 세기
			if(body.length>250){
				alert("최대 150자까지 입력 가능합니다.")
				$(this).val(body.substring(0,250));
				$('#counter').html("(150/최대 150자)");
			}
		});
	});
	//무결성검사
	function WriteProc(){				
				var title = document.getElementById("title");
				var titleData = title.value;				
				if(titleData==""){
					alert("제목은 반드시 입력해주세요.")
					title.focus();
					return;
				}				
				var body = document.getElementById("body");
				var bodyData = body.value;
				if(bodyData==""){
					alert("내용은 반드시 입력해주세요.")
					body.focus();
					return;
				}		
		document.getElementById("wFrm").submit();
	}		
	function goBack(){
		window.history.back();
	}	
</script>
</head>
<body>
 <%
 	String uid = (String)session.getAttribute("UID");
 %>
<div class="jumbotron jumbotron-fluid">
	<div class="container">    
		<form id="wFrm" method="post" action="../AdNotice/WriteProc.br" >
			<table class="table table-primary table-striped text-center">	
				<tr>
					<th>글제목</th>
					<td>
						<input type="text"	name="title"  id="title" value="제목을 입력해주세요"	
								onfocus="this.value=''" autocomplete="off"	maxlength="75"/>
				</tr>
				<tr>
					<th>글내용</th>
					<td>
						<textarea  name="body" id="body"   onfocus="this.value=''">내용을 입력하세요</textarea></br>
						<div id="counter">(0/최대 150자)</div>		
					</td>
				</tr>
				<tr>
					<td colspan="2">
					<div class="btn-group">
    					<button type="button" class="btn btn-primary" id="bBtn" onClick="WriteProc();" >글등록</button>
    					<button type="button" class="btn btn-primary" id="wBtn" onClick="goBack();">목록보기</button>    						
 					</div>					
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>
	<script src="../js/bootstrap.min.js"></script>
</body>
</html>