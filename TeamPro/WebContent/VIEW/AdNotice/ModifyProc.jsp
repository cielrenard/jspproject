<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
		<%--
			수정이 완료 되었으므로  수정내용을 확인하기 위해 상세보기로 이동.
		 --%>
		<c:redirect url="../AdNotice/BoardDetail.br">
			<c:param name="no" 			value="${NO}"/>
			<c:param name="nowPage"		value="${nowPage}"/>
		</c:redirect>
		
</body>
</html>