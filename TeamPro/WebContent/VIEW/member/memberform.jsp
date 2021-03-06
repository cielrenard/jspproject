<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<title>회원가입폼</title>

<!-- Bootstrap -->
<link href="../../css/bootstrap.min.css" rel="stylesheet">
<!-- font awesome -->
<link rel="stylesheet" href="../../css/font-awesome.min.css" media="screen"
	title="no title" charset="utf-8">
<!-- Custom style -->
<link rel="stylesheet" href="../../css/style.css" media="screen"
	title="no title" charset="utf-8">

<script type="text/javascript">
	function checkValidate() {

		var expId = /^[a-z0-9]{4,10}$/; //소문자, 숫자로 4~10자
		var expPass = /^[a-zA-Z0-9]{6,15}$/; //소문자, 대문자, 숫자로 6~15자까지
		var expMail = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
		var checkOk=null;
		if("${param.checkOk}"!=""){
			checkOk = "${param.checkOk}";
		}
		
		if(checkOk==null){
			alert('아이디 중복확인을 체크해주세요.');
			return false;
		}
		if (!expId.test(member_form.id.value)) {
			alert("아이디가 형식에 맞지 않습니다.")
			member_form.id.focus();
			return false;
		}
		if (member_form.pw.value != member_form.pw2.value) {
			alert("비밀번호가 다릅니다.")
			member_form.pw.focus();
			return false;
		}
		if (!expPass.test(member_form.pw.value)) {
			alert("비밀번호가 형식에 맞지 않습니다.")
			member_form.pw.focus();
			return false;
		} else if (expPass.test(member_form.pw.value)
				&& member_form.pw != memberform.pw2) {
			alert("비밀번호가 일치하지 않습니다.")
			member_form.pw.focus();
			return false;
		}
		if (!expMail.test(member_form.email.value)) {
			alert("이메일 주소가 형식에 맞지 않습니다.")
			member_form.email.focus();
			return false;
		}
		
		return true;
	}
</script>
</head>
<body>
<body bgcolor="white" onload="memberform.name.focus()">

	<article class="container">
		<div class="page-header">
			<center>
				<img src="../../img/membercheck/logo.gif">
			</center>
			<p>
			<p>
			<p>
			<p>
		</div>

		<div class="col-md-6 col-md-offset-3">

			<form name="member_form" method="POST" action="../../VIEW/member/memberInsert.brs"
				onsubmit="return checkValidate()">

				<input type="hidden" name="ssn" value="${param.ssn}"> <input
					type="hidden" name="hp" size="40" value="${param.hp}">

				<div class="form-group">
					<label for="username">이름</label> <input class="form-control"
						type="text" name="name" value="${param.name}" readonly="readonly">
				</div>

				<div class="form-group">
					<label for="InputID">아이디</label>
					<c:if test="${empty param.memberIdCheckResult}">
						<input type="text" name="id" placeholder="*아이디(영문 소문자, 숫자 4~20자)"
							maxlength="20" style="width: 70%" class="form-control">
					</c:if>
					<c:if test="${param.temp eq true}">
						<script type="text/javascript">
						alert('사용가능한 아이디 입니다.');
						</script>
						<input type="text" name="id" placeholder="*아이디(영문 소문자, 숫자 4~20자)"
							maxlength="20" style="width: 70%" value="${param.id}"
							disabled="disabled">
						<input type="hidden" name="idr" value="${param.id}"
							class="form-control">
					</c:if>
					<c:if test="${param.temp eq false}">
						<script type="text/javascript">
						alert('중복된 아이디 입니다.');
						</script>
						<input type="text" name="id" placeholder="*아이디(영문 소문자, 숫자 4~20자)"
							maxlength="20" style="width: 70%" class="form-control">
					</c:if>
					<button type="button" onclick="idCheck()" style="height: 30px;"
						class="btn btn-warning">
						중복확인<i class="fa fa-times spaceLeft"></i>
					</button>
				</div>

				<div class="form-group">
					<label for="InputPassword1">비밀번호</label> <input name="pw"
						type="password" class="form-control"
						placeholder="비밀번호 (영문, 대소문자, 숫자로 6~15자)">
				</div>
				<div class="form-group">
					<label for="InputPassword2">비밀번호 확인</label> <input type="password"
						name="pw2" class="form-control" placeholder="비밀번호 확인">
					<p class="help-block">비밀번호 확인을 위해 다시 한번 입력 해 주세요</p>
				</div>
				<!-- 주소 -->
				<div class="form-group">
					<label for="InputJumin">주소</label> 
					<input type="text" name="add1" id="add1" class="form-control">
					<input type="text" name="add2" id="add2" class="form-control">
					<button type="button" onclick="juminCheck()" style="height: 30px;"
							class="btn btn-warning">
							우편번호<i class="fa fa-times spaceLeft"></i>
					</button>
				</div>
				<!-- ------------------------------------------------------ -->
				<div class="form-group">
					<label for="InputEmail">이메일 주소</label> <input type="text"
						name="email" class="form-control"
						placeholder="이메일 주소 (영문 소문자,숫자로 4~10자)입력">
				</div>
				
				<div class="form-group text-center">
					<button type="submit" class="btn btn-info">
						회원가입<i class="fa fa-check spaceLeft"></i>
					</button>
					<button type="button" class="btn btn-warning"
						onClick="window.location='../../index.br'">
						홈으로<i class="fa fa-times spaceLeft"></i>
					</button>
				</div>
			</form>
		</div>

		<script type="text/javascript">
		function idCheck(){
			var expId = /^[a-z0-9]{4,10}$/; //소문자, 숫자로 4~10자
			var id = document.getElementsByName("id")[0].value; 
			if (!expId.test(member_form.id.value)) {
				alert("아이디가 형식에 맞지 않습니다.")
				id.focus();
				return false;
			}
			location.href="../../VIEW/member/memberIdCheck.brs?id="+id+"&name=${param.name}&ssn=${param.ssn}&hp=${param.hp}";
		}
	</script>
	<script type="text/javascript">
		
		function juminCheck(){
		
				window.open("zipSearchForm.jsp","zip",
				"width=800, height=500,toolbar=no,menubar=no")
			
		}
	
	</script>
	
</body>
</html>

