<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<!-- 로그인 성공 -->
	<c:if test="${isLoginComp eq true&&isLoginadmin eq false}">
	
		<c:redirect url="../../index.brs">
			<c:param name="UID"  		value="${UID}" />
		</c:redirect> 
	</c:if>
	
	
	<!-- 로그인 실패 -->
	<c:if test="${isLoginComp eq false}">
		<c:redirect url="../../VIEW/login/loginform.brs">
			<c:param name="isLoginComp"  		value="${requestScope.isLoginComp}" />
		</c:redirect> 
	</c:if>
	
	<!-- 관리자 -->
	<c:if test="${isLoginComp eq true&&isLoginadmin eq true}">
		<c:redirect url="../../index.brs">
			<c:param name="UID"  		value="${UID}" />
		</c:redirect> 
	</c:if>
	
</body>
</html>