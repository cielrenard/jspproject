<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
	$(document).ready(function(){	//body를 다 읽고 시작
		//목록보기 버튼 클릭시
		$('#lBtn').click(function(){
			//목록보기로 강제 이동
			//자바스크립트 location.href="요청내용";
			//location.href="../ReBoard/BoardList.re?nowPage=${nowPage}";
			
			//jQuery $(선택자).attr('속성명',"요청내용")
			$(location).attr("href","../Notice/BoardList.br?nowPage=${nowPage}");
		});
		//적절한 이벤트를 이용하여 적절한 요청처리(컨트롤러->뷰)
		//id="mBtn" value="(원글)수정하기"/>
		$('#mBtn').click(function(){
			$(location).attr("href","../Notice/ModifyForm.br?no=${VIEW.no}&nowPage=${nowPage}")
		})
		//id="dBtn" value="삭제하기"/>
		$('#dBtn').click(function(){
			//1. 삭제선택,취소(팝업)
			var result = confirm("삭제하시겠습니까?");
			if(result){
				//삭제
				//2. hidden에 필요한 데이터를 심어놓는다.
				//자바스크립트
					//특정id요소의 값을 가져오기
					//document.getElementById("id명").value;	
					//특정 id요소의 값을 설정하기
					//document.getElementById("id명").value=값;
				
				//jQuery
					//$(선택자).val();				//특정id요소의 값을 가져오기
					//$(선택자).val(데이터);	//특정 id요소의 값을 설정하기
				$("#imsiNo").val("${VIEW.no}");
				//$("#imsiPw").val(pw);		//pw:변수
				
				//3. 데이터를 요청 한다
				$("#imsiFrm").submit();
			}
			else{
				//삭제안함
			}
		});
	
	});
</script>
</head>
<body>
<div class="box" id="section1" style="background-size: 300; background-image:url(${pageContext.request.contextPath}/img/grand-palace-1822487_640.jpg)">
<%@ include file="../include/Header.jsp"%>
	<%-- 1. 상세보기 내용 보기 --%>
<div class="jumbotron jumbotron-fluid">
	<div class="container">    
		<table class="table table-primary table-striped text-center">
			<tr>
				<th>글번호</th>
				<td>${VIEW.no}</td>
				<th>조회수</th>
				<td>${VIEW.hit}</td>
			</tr>
			<tr>
				<th>글쓴이</th>
				<td>${VIEW.writer}</td>
				<th>작성일</th>
				<td>${VIEW.wday}</td>
			</tr>
			<tr>
				<th>제목</th>
				<td colspan="3">${VIEW.title}</td>
			</tr>
			<tr>
				<th>내용</th>
				<td colspan="3">${VIEW.brBody}</td>
			</tr>
			<tr>
				<td colspan="4">	
					<div class="btn-group">			
    						<button type="button" class="btn btn-primary" id="lBtn" >목록보기</button>
    						<%-- <c:if test="${VIEW.writer eq sessionScope.UID}"	>
    						<button type="button" class="btn btn-primary" id="mBtn">수정하기</button>
    						<button type="button" class="btn btn-primary" id="dBtn">삭제하기</button>
    						</c:if> --%>
    				</div> 									
				</td>
			</tr>
			
		</table>
	</div>
</div>
	<%--	원글 사용하기 위한 임시폼으로 만든다. --%>
	<form id="imsiFrm" method="POST" action="../Notice/BoardDelete.br">
		<input type="hidden"	name="no"  id="imsiNo"/>
	</form>
	</div>
	<script src="../js/bootstrap.min.js"></script>
</body>
</html>