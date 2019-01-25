<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<!DOCTYPE html>
<html lang="en">
<link rel="stylesheet" type="text/css" href="..\..\css\template.css">
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style>
	
		.logo{
			background-color: #003366; width: 700px; height: 110px;
			margin:20px 0px;
		}
		.loginFormDiv{
			text-align:center;
		}

</style>


<c:if test="${!empty param.isLoginComp && param.isLoginComp==false}">
	<script type="text/javascript">
		alert("ID,PW를 다시 확인해 주세요.");
	</script>
</c:if>
 


<c:if test="${param.mode eq 'serchID' }">
	<c:if test="${empty param.serchID}">
		<script type="text/javascript">
			alert('계정 검색 실패');
		</script>
	</c:if>
	<c:if test="${!empty param.serchID}">
		<script type="text/javascript">
			alert('검색한 결과 : ${param.serchID}');
		</script>
	</c:if>
</c:if>

<c:if test="${param.mode eq 'serchPW' }">
	<c:if test="${empty param.serchPW}">
		<script type="text/javascript">
			alert('패스워드 찾기  실패');
		</script>
	</c:if>
	<c:if test="${!empty param.serchPW}">
		<script type="text/javascript">
			alert('pw: ${param.serchPW}');
		</script>
	</c:if>
</c:if>




</head>
<body>
<section class="loginContent">
	<nav></nav>
	<div class="memberLoginContainer">
	<div class="logo"><img src="../../img/title-img2.png" width="700px" height="110px"></div>
		<div class="loginButtonContainer">
			
		</div>

		<div class="loginFormDiv">
			
			 
			<form name="login_form" action="../../VIEW/login/loginproc.brs" class="loginForm"  method="post">
				<input type="text" name="id" size="40"
					onclick="if(this.value=='아디를 입력하세여'){this.value=''}"
					value="아디를 입력하세여"><br>
				<br> <input type="password" name="pw" size="40">
				<input id="submit" type="submit" value="로그인">				
			</form>
		</div>

		<div class="serchDiv">
			<div class="serchDivItem">
				<button class="serchDivItem" onclick="location.href='../../VIEW/login/membersearchIDform.brs'">ID 찾기</button>
			</div>
			<div class="serchDivItem">
				<button class="serchDivItem" onclick="location.href='../../VIEW/login/membersearchPWform.brs'">패스워드 찾기</button>
			</div>
			<div class="serchDivItem">
				<button class="serchDivItem" onclick="location.href='../../VIEW/member/memberCheckform.brs'">회 원 가 입</button>
			</div>
		</div>
		
	</div>
	<aside></aside>
	
</section>
</body>
</html>
