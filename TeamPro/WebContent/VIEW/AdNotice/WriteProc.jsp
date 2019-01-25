<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	 <%--
		뷰는 처리결과(모델)를 클라이언트에게 보여주는 역할을 담당하는 문서
		글쓰기 후에는 보여주지 않고 다른문서가 대신 응답하도록 할 것이다.
	 --%>
	<% 
		response.sendRedirect("../AdNotice/BoardList.br");
	%>
</body>
</html>