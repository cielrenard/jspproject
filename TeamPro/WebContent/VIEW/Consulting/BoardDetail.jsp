<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c"  uri ="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
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
	//목록보기 버튼 클릭실행 함수.
	$('#1btn').click(function(){
		//목록 보기로 강제이동
		// 자바 스크립트 location.href="요청내용"
		//location.href="../ReBoard/BoardList.re?nowPage=${nowPage}";
		//jquery 방식
		//$(선택자).attr('속성명','요청내용')
		$(location).attr('href','../Consulting/BoardList.br?nowPage=${nowPage}')		
	})
	//적절한 이벤트를 이용해서 적절한 요청 처리하기 (컨트롤러 -> 뷰)<숙제>
	$('#2btn').click(function(){
		$(location).attr('href','../Consulting/ModifyForm.br?nowPage=${nowPage}&oriNo=${DVIEW.no}')
	})
	//적절한 이벤트를 이용해서 적절한 요청 처리하기 (컨트롤러 -> 뷰)<숙제>
	$('#3btn').click(function(){
		//1. 비밀번호를 입력 받는다.
					
		//2. hidden에 필요한 데이터를 심어 놓는 다.
			//자바 스크립트
			//jquery
		$("#imori").val("${DVIEW.no}");
		
		//3. 요청 들어간다.
			$('#Dfrm').submit();
		
		
	})
	//댓글 수정버튼을 클릭하면 상세화면에서 댓글 수정폼으로 일부 내용이 변경되도록 하고 싶다
	//
	
	
})
</script>
</head>
<body>
<div class="jumbotron jumbotron-fluid">
	<div class="container">    
		<table class="table table-primary table-striped text-center">
		<tr>
			<th>글번호</th>
			<td>${DVIEW.no}</td>
			<th>조회수</th>
			<td>${DVIEW.hit}</td>		
		</tr>
		<tr>
			<th>작성일</th>
			<td>${DVIEW.wday}</td>
			<th>작성자</th>
			<td>${DVIEW.writer}</td>
		</tr>
		<tr>
			<th>제목</th>
			<td colspan="3">${DVIEW.title}</td>
		</tr>
		<tr>
			<th>내용</th>
			<td colspan="3">${DVIEW.brBody}</td>
		</tr>	
	
		<tr>
			<td colspan="4">
				<input type="button"  id="1btn" class="btn btn-primary" value="목록보기"/>
				<%-- 수정 ,삭제는 자신이 쓴 글에 대해서만 권한이 부여되게 처리해 줄것이다.
						컨트롤러에서 알아낸 작성자와 로그인한 정보가 같은지 비교한 후 처리하여 권한을 부여할 것이다--%>
						<c:if test="${DVIEW.writer eq sessionScope.UID }">
							<input type="button" id="2btn" class="btn btn-primary" value="수정하기"/>
							<input type="button" id="3btn" class="btn btn-primary" value="삭제하기"/>
						</c:if>
			</td>
		</tr>
	</table>	
</div>
</div>
	<%--	원글 사용하기 위한 임시폼으로 만든다. --%>
	<form id="imsiFrm" method="POST" action="../Consulting/BoardDelete.br">
		<input type="hidden"	name="no"  id="imsiNo"/>
	</form>
	<script src="../js/bootstrap.min.js"></script>
	
</body>
</html>