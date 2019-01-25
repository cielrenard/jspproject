<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c"  uri ="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ModifyForm</title>
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
	$(function(){
		//수정하기 버튼 클릭
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
	})
</script>
</head>
<body><div class="jumbotron jumbotron-fluid">
	<div class="container">    
<form id="mFrm" method="POST" action="../Consulting/ModifyProc.br">
<%-- 폼을 이용해서 submit 시킬때 폼안에 없는 데이터는 절대로 서버에 전달 되지 않는다. 
		같이 보내야할 필요한 데이터가 있으면 <input type="hidden" 으로 숨겨서 보내야 한다.--%>
	<input type="hidden" name="nowPage" value="${nowPage}"/>
	<input type="hidden" name="oriNo" value="${BOARD.no}"/>
		<table class="table table-primary table-striped text-center">	
			<tr>
				<th>글제목</th>
				<td>
					<input type="text" name="title" id="title" value="${BOARD.title}"/>
				</td>
			</tr>
			<tr>
				<th>글내용</th>
				<td>
					<textarea name="body" id="body" >${BOARD.body}</textarea>					
				</td>
			</tr>			
			<tr>
				<th colspan="2" align="center">
					<div class="btn-group">
    					<button type="button" class="btn btn-primary" id="mBtn" >수정하기</button>
    					<button type="button" class="btn btn-primary" id="cBtn" >수정취소</button>    						
 					</div>	
				</th>
			</tr>
		</table>
	</form>
	</div>
</div>
	<script src="../js/bootstrap.min.js"></script>


</body>
</html>