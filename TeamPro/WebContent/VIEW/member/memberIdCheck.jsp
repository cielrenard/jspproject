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

<c:if test="${memberIdCheckResult eq true}">

		<c:redirect url="../../VIEW/member/memberform.brs">
			<c:param name="memberIdCheckResult"  	value="${requestScope.memberIdCheckResult}" />
			<c:param name="checkOk"		value="${requestScope.checkOk}" />
			<c:param name="id"		value="${requestScope.id}" />
			<c:param name="name"  	value="${requestScope.name}" />
			<c:param name="ssn"  	value="${requestScope.ssn}" />
			<c:param name="hp"  	value="${requestScope.hp}" />
			<c:param name="temp"		value="${requestScope.temp}" />
		</c:redirect>
</c:if>

<c:if test="${memberIdCheckResult eq false}">

		<c:redirect url="../../VIEW/member/memberform.brs">
			<c:param name="id"		value="${requestScope.id}" />
			<c:param name="name"  	value="${requestScope.name}" />
			<c:param name="ssn"  	value="${requestScope.ssn}" />
			<c:param name="hp"  	value="${requestScope.hp}" />
			<c:param name="temp"		value="${requestScope.temp}" />
			<c:param name="memberIdCheckResult"  	value="${requestScope.memberIdCheckResult}" />
		</c:redirect>
</c:if>
</body>
</html>