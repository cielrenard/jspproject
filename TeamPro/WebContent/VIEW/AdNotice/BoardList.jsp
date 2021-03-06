<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 목록</title>
<style>
	.page-link {
					font-weight:bold;
					}
</style>
<script src="../js/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link href="../css/bootstrap.min.css" rel="stylesheet">
<script src="../js/bootstrap.min.js"></script>
<script>
	  $(document).ready(function(){
	    $('#Bbtn').click(function() {
	    	location.href="../index.brs"
	        
	    });
		$('#wBtn').click(function(){
			
		location.href="../AdNotice/WriteForm.br";
		})
		
		});  
</script>
</head>
<body>
	<div class="box" id="section1" style="background-size: 300; background-image:url(${pageContext.request.contextPath}/img/grand-palace-1822487_640.jpg)">
<%@ include file="../include/Header.jsp"%>
<div class="jumbotron jumbotron-fluid">
<div class="container primary">
    	<h1>공지사항</h1>      
    	<p>C&S에서 알려드립니다.</p>
	</div>
	<div class="container">    
		<table class="table table-primary table-striped">
			<thead>
				<tr>
					<td>번호</td>
					<td>제목</td>
					<td>작성자</td>
					<td>작성일</td>
					<td>조회수</td>
				</tr>
			</thead>
		<c:forEach var="temp"		items="${LIST}">
			<tr>
				<td>${temp.no}</td>
				<td class="left"><a href="../AdNotice/BoardDetail.br?no=${temp.no}&nowPage=${PINFO.nowPage}">${temp.title}</a></td>
				<td>${temp.writer}</td>
				<td>${temp.wday}</td>
				<td>${temp.hit}</td>
			</tr>
		</c:forEach>
			<tr class="text-center">
				<td colspan="6">
					<ul class="pagination">
					<%-- 이전 링크만들기 --%>
    					<li class="page-item">
    						<c:if test="${PINFO.startPage eq 1}"	>
    							<a class="page-link">이전</a>
    						</c:if>
							<c:if test="${PINFO.startPage ne 1}"	>
								<a class="page-link" href="../AdNotice/BoardList.br?nowPage=${PINFO.startPage-1}">이전</a>
							</c:if>
						</li>
						<%-- [1][2][3][4][5]만들기 --%>
    					<li class="page-item">
    						<c:forEach var="page"		begin="${PINFO.startPage}"	 end="${PINFO.endPage}">
    							<a class="page-link" href="../AdNotice/BoardList.br?nowPage=${page}">${page}</a> 
    						</c:forEach>   		
    					</li>   
    					 <%-- 다음 링크만들기 --%>
    					<li class="page-item">
    						<c:if test="${PINFO.endPage eq PINFO.totalPage}"	>
								<a class="page-link">다음</a>
							</c:if>
    						<c:if test="${PINFO.endPage ne PINFO.totalPage}"	>
								<a class="page-link" href="../AdNotice/BoardList.br?nowPage=${PINFO.endPage+1}">다음</a>
							</c:if>    
    					</li>
  					</ul>	
  				</td>
  			</tr>	
			<tr>
				<td colspan="6">
					<input type="button" class="btn btn-primary pull-right" id="wBtn"	  value="글쓰기"/>
					<input type="button" class="btn btn-primary" id="Bbtn" value= "홈으로"/> 
				</td>
			</tr>
		</table>
	</div>
</div>
	<script src="../js/bootstrap.min.js"></script>
	</div>
</body>
</html>