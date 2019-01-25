<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c"  uri ="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>Board Delete.jsp</h1>
<%--1.  이 화면에서는 먼저 유저에게 삭제 성공여부를 alert 로 알려준다.
			1 = 삭제 성공   0 = 삭제 실패
		2. 목록보기로 이동한다. --%>
		<c:if test="${CHA eq 1}">
		<script>	alert('게시물 삭제에 성공했다.')</script>
		</c:if>
		<c:if test="${CHA eq 0}">
		<script>	alert('게시물 삭제에 실패 했다.')</script>
		</c:if>
		<%--
			주의!!!!! ★★★★★★★★★
			redirect시키면  이전의 작업내용은 실행되지 않는다.
		 --%>
		 <script>
		 location.href="../Consulting/BoardList.br"
		 </script>
</body>
</html>