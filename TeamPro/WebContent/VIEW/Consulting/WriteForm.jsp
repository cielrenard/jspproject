<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>WriteForm</title>
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
	//글등록버튼 클릭시
	function WriteProc(){
		//무결성검사
		//무결성검사란? 필수항목이 입력이 안된 경우를 처리...
				
		//자바스크립로 무결성 검사하는 방법
		//1. document.getElementById()를 이용해서 특정요소에 접근
		//2. value속성을 이용해서 입력한 값을 알아내고
		//3. 값의 존재여부를 판단
		var title = document.getElementById("title");
		var titleData = title.value;
		//var titleData = document.getElementById("title").value;
		if(titleData==""){
			alert("제목은 반드시 입력해주세요");
			title.focus();
			return;
		}
		function goBack(){
			window.history.back();
		}	
				
		//폼을 submit
		document.getElementById("wFrm").submit();
	}	
</script>
</head>
<body>
	
	<%-- 글쓰기 폼만들어 보여주자 --%>
	<div class="jumbotron jumbotron-fluid">
	<div class="container">    
	<form id="wFrm" method="POST" action="../Consulting/WriteProc.br">
		<table class="table table-primary table-striped text-center">
			<tr>
				<th>글제목</th>
				<td>
					<input type="text" name="title" id="title"/>
				</td>
			</tr>
			<tr>
				<th>글내용</th>
				<td>
					<textarea name="body" id="body"></textarea>
				</td>
			</tr>
			<tr>
				<th colspan="2">
					<input type="button" id="wBtn" value="글등록" class="btn btn-primary pull-right" onClick="WriteProc()"/>
					<button type="button" class="btn btn-primary" id="wBtn" onClick="goBack()">목록보기</button>
				</th>
			</tr>
		</table>
	</form>
		</div>
</div>
	<script src="../js/bootstrap.min.js"></script>
</body>
</html>














