<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>아이디 찾기</title>
<style>
DIV.brd-list {
	clear: both;
	width: 450;
	table-layout: fixed;
	margin-top: 200px;
	border-bottom: 2px solid #333;
}

DIV.brd-list th {
	background-color: #333;
	white-space: nowrap;
	overflow: hidden;
	text-align: center;
	font: normal 11px dotum, tahoma;
	color: #e1e1e1;
	border-bottom: 2px solid #888;
}

DIV.brd-list a:link, .board_list th a:visited, .board_list th a:active {
	text-decoration: none;
	color: #e1e1e1
}

DIV.brd-list a:hover {
	color: #aaa
}

DIV.brd-list td {
	padding: .1em;
	border-bottom: 1px solid #ddd;
	font: normal 12px gulim, tahoma;
	white-space: nowrap
}

.input {
	font: normal 12px gulim, tahoma;
	color: #555;
}

.board {
	font: normal 12px gulim, tahoma;
	color: #555;
}
</style>
</head>

<body>

	<div align="center">
		<div align="center" class="brd-list">
			<table>
				<tr>
					<td>
						<h2>
							<font align="left"><img src="../../img/login/btn_id_search.png">
								아 이 디 찾 기</font>
						</h2>
					</td>
				<tr>
					<td><font size="2px"><br>아이디가 기억나지 않으세요? <br>
							이름, 이메일을 입력하여 아이디를 확인하실 수 있습니다. <br> 본인인증시 제공되는 정보는 해당
							인증기관에서 직접 수집하며, <br> 인증 이외의 용도로 이용 또는 저장하지 않습니다. <br>
							</font></td>
				</tr>
				
				
			
			</table>

			<form name="f" method="post" action="../../VIEW/login/membersearchIDproc.brs" onsubmit="return serchIDCheck()">
				<table>
					<tr>
						<th width="150"><font size="2px">이름</font></th>
						<td width="250"><input type="text" name="name" size="35"></td>
					</tr>
					<tr>
						<th width="150"><font size="2px">이메일</font></th>
						<td width="250"><input type="text" name="email" class="box"
							size="35"></td>
					</tr>
					<tr>
						<td colspan="2" align="right">
							<input type="submit" value="확인">
							<input type="button" onclick="location.href='../../VIEW/login/loginform.brs'" value="로그인"></td>
					</tr>
				</table>
			</form>
		</div>
	</div>

	<script>
		function serchIDCheck() {
			if (f.name.value === "") {
				alert("이름 입력란이 공백입니다.");
				f.name.focus();
				return false;
			}

			if (f.email.value === "") {
				alert("이메일 입력란이 공백입니다.")
				f.email.focus();
				return false;
			}
			return true;
		}
	</script>


</body>
</html>