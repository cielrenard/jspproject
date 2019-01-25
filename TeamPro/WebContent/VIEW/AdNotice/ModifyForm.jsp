<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
	
	$(document).ready(function(){
		//id="mBtn"	value="수정하기"
		$("#mBtn").click(function(){
			//무결성검사
			//무결성검사란? 필수항목이 입력이 안된 경우를 처리...
			
			//자바스크립트로 무결성 검사하는 방법
			//1. document.getElementById()를 이용해서 특정요소에 접근
			//2. value속성을 이용해서 입력한 값을 알아내고
			//3. 값의 존재여부를 판단.
			var title = document.getElementById("title");
			var titleData = title.value;
			//var titleData=document.getElementById("title").value;
			if(titleData==""){
				alert("제목은 반드시 입력해주세요.")
				title.focus();
				return;
			}
			//body.pw숙제
			var body = document.getElementById("body");
			var bodyData = body.value;
			if(bodyData==""){
				alert("내용은 반드시 입력해주세요.")
				body.focus();
				return;
			}
			//폼을 submit시켜줌.	
			$('#mFrm').submit();
		});
		//button"  id="cBtn"  value="수정취소"
		//수정하기 취소하고 상세페이지로 가기
		$('#cBtn').click(function(){
			$(location).attr("href", "../AdNotice/BoardDetail.br?no=${BOARD.no}&nowPage=${nowPage}") 
		});
	 });
	
</script>
</head>
<body>
<div class="jumbotron jumbotron-fluid">
	<div class="container">    
	 <%-- nowPage=${nowPage}<br/>
	 글번호=${BOARD.no}<br/>--%>
	 <form id="mFrm" method="post" action="../AdNotice/ModifyProc.br">
	 		<input type="hidden"	name="no"  value="${BOARD.no}"/>
	 		<input type="hidden"	name="nowPage"  value="${nowPage}"/>
		<table class="table table-primary table-striped text-center">	
			<tr>
				<th>글제목</th>
				<td>
					<input type="text"	name="title"  id="title"  value="${BOARD.title}"/>
				</td>
			</tr>
			<tr>
				<th>글내용</th>
				<td>
					<textarea name="body" id="body" >${BOARD.body}</textarea></br>
					<div id="counter">(0/최대 150자)</div>	
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<div class="btn-group">
    					<button type="button" class="btn btn-primary" id="mBtn" >수정하기</button>
    					<button type="button" class="btn btn-primary" id="cBtn" >수정취소</button>    						
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