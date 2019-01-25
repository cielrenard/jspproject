<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- admin_top.jsp -->

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>PROJECT</title>

<!-- 
<c:if test="${not empty msg}">
	<script type="text/javascript">
		alert("${msg}");
		location.href = history.go(-1);
	</script>
</c:if>
-->
<div class="box" id="section1" style="background-size: 300; background-image:url(${pageContext.request.contextPath}/img/architecture-1850129_1920.jpg)">
<%@ include file="../include/Header.jsp"%>
<div align="center">
	<a href="${pageContext.request.contextPath}/VIEW/admin/admin_index.br?loginId=${loginId}"> 
		<img alt="" src="${pageContext.request.contextPath}/img/admin/logo.gif" height="60px">
	</a>
</div>
<div align="right">
	<c:if test='${!empty loginId}'>
		<a href="${pageContext.request.contextPath}/VIEW/login/logoutproc.br"> 로그아웃</a>
	</c:if>
</div>
<ul class="topBox">
	<a href="${pageContext.request.contextPath}/VIEW/adminmember/admin_memberlist.br">
		<li class="hover effect4"><span>회원관리</span></li>
	</a>
</ul>
</div>

</head>
<body>