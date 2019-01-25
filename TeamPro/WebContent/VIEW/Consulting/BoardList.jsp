<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BoardList</title>
<script src="../js/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link href="../css/bootstrap.min.css" rel="stylesheet">
<script src="../js/bootstrap.min.js"></script>
<script>
	function WriteForm(){
		//할일
		// 글쓰기 폼을 요청
		//자바스크립트에서 새로운 요청을 하는 방법
		// location.href="요청내용";
		location.href="../Consulting/WriteForm.br";
		
	}
	function goBack(){
		location.href="../index.brs"
	}
</script>
</head>
<body>
  <%-- 1.목록을 출력 --%>
  <div class="jumbotron jumbotron-fluid">
	<div class="container primary">
    	<h1>1:1 상담</h1>      
    	<p>C&S에서 함께합니다.</p>
	</div>
	<div class="container">    
  <table class="table table-primary table-striped">
  	<tr>
  		<th>번호</th>
  		<th>글쓴이</th>
  		<th>제목</th>
  		<th>조회수</th>
  		<th>작성일</th>  	
  	</tr>
  	<c:forEach var="temp" items="${LIST}">
  		<tr>
  			<td>${temp.no}</td>
  			<td>${temp.writer}</td>
  			<td><a href="../Consulting/BoardDetail.br?oriNo=${temp.no}&nowPage=${PINFO.nowPage}">${temp.title}</a></td>
  			<td>${temp.hit}</td>
  			<td>${temp.wday}</td>  		
  		</tr>
  	</c:forEach>
  </table>
  <%-- 2.페이지 이동 기능을 추가   [이전][1][2][3][다음]--%>
  <table class="table table-primary table-striped">
  	<tr class="text-center">
				<td colspan="6">
					<ul class="pagination">
					<%-- 이전 링크만들기 --%>
    					<li class="page-item">
    						<c:if test="${PINFO.startPage eq 1}"	>
    							<a class="page-link">이전</a>
    						</c:if>
							<c:if test="${PINFO.startPage ne 1}"	>
								<a class="page-link" href="../Consulting/BoardList.br?nowPage=${PINFO.startPage-1}">이전</a>
							</c:if>
						</li>
						<%-- [1][2][3][4][5]만들기 --%>
    					<li class="page-item">
    						<c:forEach var="page"		begin="${PINFO.startPage}"	 end="${PINFO.endPage}">
    							<a class="page-link" href="../Consulting/BoardList.br?nowPage=${page}">${page}</a> 
    						</c:forEach>   		
    					</li>   
    					 <%-- 다음 링크만들기 --%>
    					<li class="page-item">
    						<c:if test="${PINFO.endPage eq PINFO.totalPage}"	>
								<a class="page-link">다음</a>
							</c:if>
    						<c:if test="${PINFO.endPage ne PINFO.totalPage}"	>
								<a class="page-link" href="../Consulting/BoardList.br?nowPage=${PINFO.endPage+1}">다음</a>
							</c:if>    
    					</li>
  					</ul>	
  				</td>
  			</tr>	
  		
  </table>
  <%-- 3.목록보기에서 필요한 다른 기능(글쓰기)을 처리하도록 한다 --%>	
  <table class="table table-primary table-striped">
  	<tr>
  		<td align="center">
  			<input type="button" id="wbtn" class="btn btn-primary pull-right" value="글쓰기" onClick="WriteForm();"/>
  			<input type="button" id="bbtn" class="btn btn-primary pull-right" value="홈으로" onClick="goBack();"/>
  		</td>
  	</tr>
  </table>
  	</div>
</div>
	<script src="../js/bootstrap.min.js"></script>	
</body>
</html>
















