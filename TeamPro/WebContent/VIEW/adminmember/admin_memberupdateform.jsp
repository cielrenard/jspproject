<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../include/Header.jsp"%>
<script type="text/javascript">
		
		function juminCheck(){
		
				window.open("../member/zipSearchForm.jsp","zip",
				"width=800, height=500,toolbar=no,menubar=no")
			
		}
	
</script>

<c:set var="dto" value="${requestScope.dto}"/>
<div style="text-align:center; width: 90%; margin-top:20px; margin-left:auto; margin-right: right;">
	
	
	
		<table border="1">
		<tr bgcolor="#ffdab9">
			<th align="center">ID</th>
			<th align="center">이름</th>
			<th align="center">주민번호</th>
			<th align="center">전화번호</th>
			<th align="center">주소</th>
			<th align="center">이메일</th>
		</tr>
		<form name="member_update_form" action="../../VIEW/adminmember/admin_memberupdatepro.brs" method="post">
				<input type="hidden" name="id" value="${param.id}">
			 <tr>
			 			
			 			
						<td><input type="text" name="idr" disabled="disabled" value="${param.id}"></td>
						<td><input type="text" name="name" value="${dto.m_name}"></td>
						<td><input type="text" name="jumin" value="${dto.m_jumin}"></td>
						<td><input type="text" name="phone" value="${dto.m_phone}"></td>
						<td>
							
								<input type="text" id="add1" name="add1" onclick="juminCheck()" value="${fn:substring(dto.m_add,0,5)}">
								<input type="text" id="add2" name="add2" onclick="juminCheck()" value="${fn:substring(dto.m_add,5,100)}">
						
						</td>
						<td><input type="text" name="email" value="${dto.m_email}"></td>
				
			</tr>
			<tr>
				<td colspan="7" align="right"> <input type="button" value="뒤로가기" onclick="history.back();">&nbsp;&nbsp;<input type="submit" value="수정하기"></td>
			</tr>
		</form>
        
	</table>
</div>

</body>
</html>