<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- adamin_member.jsp -->
<body>

<%@ include file="../include/Header.jsp"%>
<div align="center">

	<hr color="Green" width="99%">
	<h2>회원리스트</h2>
	<hr color="Green" width="99%">
	<table border="1" width="99%">
		<tr bgcolor="#ffdab9">
			<th align="center">아이디</th>
			<th align="center">이름</th>
			<th align="center">주민번호</th>
			<th align="center">전화번호</th>
			<th align="center">주소</th>
			<th align="center">이메일</th>
			<th align="center">비고</th>
		</tr>

		<c:if test="${requestScope.adminlist eq false}">
			<tr>
				<td colspan="7">등록된 회원이 없습니다.</td>
			</tr>
		</c:if>
		
		<c:if test="${requestScope.adminlist eq true}">
			<c:forEach var="temp" items="${LIST}">
				
				<tr>
					<td>${temp.m_id}</td>
					<td>${temp.m_name}</td>
					<td>${temp.m_jumin}</td>
					<td>${temp.m_phone}</td>
					<td>${temp.m_add}</td>
					<td>${temp.m_email}</td>
					<td><a href="../../VIEW/adminmember/admin_memberupdateform.brs?id=${temp.m_id}">수정</a> </td>
					|<!-- <a href="../../VIEW/adminmember/admin_memberdeletepro.brs?id=${temp.m_id}">삭제</a>-->
				</tr>
				
			</c:forEach>
		</c:if>
	</table>


	 <%-- 2.페이지 이동 기능을 추가   [이전][1][2][3][다음]--%>
  <table border="1" width="600" align="center">
  	<tr>
  		<td align="center">
  		<%-- 이전링크만들기 --%>
  		<c:if test="${PINFO.startPage eq 1}">
  			[이전]
  		</c:if>
  		<c:if test="${PINFO.startPage ne 1}">
  			<%-- 링크는 다시 목록보기를 요청+ 원하는 페이지를 알려주면된다--%>
  			<a href="../../VIEW/adminmember/admin_memberlist.brs?nowPage=${PINFO.startPage-1}">[이전]</a>
  		</c:if>
  		
  		<%-- [1][2][3] 링크만들기 --%>
  		<c:forEach var="page" begin="${PINFO.startPage}" 
  		                      end="${PINFO.endPage}">
			<a href="../../VIEW/adminmember/admin_memberlist.brs?nowPage=${page}">[${page}]</a>
  		</c:forEach>
  		
  		<%-- [다음]링크만들기 --%>
  		<c:if test="${PINFO.endPage eq PINFO.totalPage}">
  			[다음]
  		</c:if>
  		<c:if test="${PINFO.endPage ne PINFO.totalPage}">
  			<a href="../../VIEW/adminmember/admin_memberlist.brs?nowPage=${PINFO.endPage+1}">[다음]</a>
  		</c:if>
  		
  		</td>
  	</tr>	
  </table>



</div>
</div>

</body>
</html>