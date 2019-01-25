<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원확인</title>
<script>
	function checkMember() {
		var expname = /^([가-힝]{2,4}|[a-zA-Z]{2,10})[가-힣]*$/;
//		var expname = /^[가-힝]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/;
		var expssn = /^(\d+){6}$/;
		var expphone = /^(\d+){7,8}$/;
		
	
		
		if (!expname.test(member_form.name.value)) {
			alert("이름이 형식에 맞지 않습니다.")
			member_form.name.focus();
			return false;
		}
		else if (!expssn.test(member_form.ssn.value)) {
			alert("주민번호가 형식에 맞지 않습니다.")
			member_form.ssn.focus();
			return false;
		}
		else if (!expphone.test(member_form.hp.value)) {
			alert("전화번호가 형식에 맞지 않습니다.")
			member_form.hp.focus();
			return false;
		}
		
		
		
		
		return true;
	}
</script>

</head>

<body>
	<div align="center">
		<img src="../../img/membercheck/logo.gif"><br>
		<form name="member_form" action="../../VIEW/member/memberCheckproc.brs" method="post" onsubmit="return checkMember()">
			<table width="700" cellpadding="10" cellspacing="5">
				<tr>
					<td colspan="3" align="left"><br>
						<h2 style="color:515151;">회원가입 여부를 먼저 확인해 주세요.</h2>
						<hr color="515151" border="2" width="700" align="left">
					</td>
				</tr>
				<tr>
					<td colspan="3" align="left" bgcolor="fefcf0" style="color: purple; font-size: 0.8rem;">
						<img src="../../img/membercheck/memberChk1.jpg">입력하신 정보는 별도 저장되지 않으며, 기 회원가입 여부 확인 용도로만 사용됩니다.<br>
						<img src="../../img/membercheck/memberChk1.jpg">휴대전화 국번 3자리(01X)를 제외한 번호가 7자리인 경우, 0을 포함하여 입력 (Ex. 011-123-4567 > 01234567 입력) <br>
						<img src="../../img/membercheck/memberChk1.jpg">기존 회원의 경우 기존 회원가입 정보와 일치하는 정보를 입력하셔야 회원가입 여부를 정확하게 확인하실 수 있습니다.<br>
					</td>
				</tr>
				<tr bgcolor="white">
					<td colspan="1"  style="font-size: 0.9rem;">
						ex) 홍길동<br>
						<input type="text" name="name" size="30" onclick="if(this.value=='이름을 입력하세요'){this.value=''}" 
						value="이름을 입력하세요" maxlength="6">
					</td>
					<td colspan="1"  style="font-size: 0.9rem;">
						ex) 1980년 1월 1일생 → 800101<br>
						<input type="text" name="ssn" size="30" onclick="if(this.value=='법정생년월일 6자리'){this.value=''}"
						value="법정생년월일 6자리" maxlength="6">
					</td>
					<td colspan="1"  style="font-size: 0.9rem;">
						ex)010-1234-5678 → 12345678<br>
						<input type="text" name="hp" size="30" onclick="if(this.value=='휴대전화번호 뒤 8자리'){this.value=''}"
						value="휴대전화번호 뒤 8자리" maxlength="8">
					</td>
				</tr>
				<tr>
					<td colspan="3" align="center" >
						<input type="submit" value="조회">
						<input type="button" value="홈으로" onClick="window.location='../../index.brs'">
					</td>
				</tr>
			</table>
		</form>
	</div>
	

</body>
</html>