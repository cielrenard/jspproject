<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>��й�ȣ ã��</title>
<style>
DIV.brd-list {
	clear: both;
	width: 450;
	table-layout: fixed;
	margin-top: 200px;
	border-bottom: 2px solid #333;
	align: center;
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
</style>

<script>
		function searchPWCheck() {
			if (searchPWForm.name.value === "") {
				alert("�̸� �Է¶��� �����Դϴ�.");
				searchPWForm.name.focus();
				return false;
			}

			if (searchPWForm.id.value === "") {
				alert("���̵� �Է¶��� �����Դϴ�.")
				searchPWForm.id.focus();
				return false;
			}
			
			if (searchPWForm.email.value === "") {
				alert("�̸��� �Է¶��� �����Դϴ�.")
				searchPWForm.email.focus();
				return false;
			}
			return true;
		}
</script>
</head>
<body>
	<div align="center">
		<div class="brd-list">
			<table>
				<tr>
					<td><h2>
							<img src="../../img/login/btn_pass_search.png"> ��й�ȣ ã��
						</h2></td>
				<tr>
					<td><font size="2px"><BR>��й�ȣ�� ��ﳪ�� ��������? <br>
							�̸�, ���̵�, �̸����� �Է��Ͽ� ��й�ȣ�� Ȯ���Ͻ� �� �ֽ��ϴ�. <br> ���������� �����Ǵ� ������ �ش�
							����������� ���� �����ϸ�, <br> ���� �̿��� �뵵�� �̿�Ǵ� �������� �ʽ��ϴ�. <br>
							</font></td>
				</tr>
				
			</table>

			<form name="searchPWForm" action="../../VIEW/login/membersearchPWproc.brs" method="post" onsubmit="return searchPWCheck()">
				<table bgcolor="white">

					<tr>
						<th width="150"><font size="2px">�̸�</font></th>
						<td width="250"><input type="text" name="name" size="35"
							class="input"></td>
					</tr>
					<tr>
						<th width="150"><font size="2px">���̵�</font></th>
						<td width="250"><input type="text" name="id" size="35"
							class="input"></td>
					</tr>
					<tr>
						<th width="150"><font size="2px">�̸���</font></th>
						<td width="250"><input type="text" name="email" size="35"
							class="input"></td>
					</tr>
					<tr>
						<td colspan="2" align="right">
							<input type="submit" value="Ȯ��">
							<input type="button" onclick="location.href='../../VIEW/login/loginform.brs'" value="�α���">
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	
	
		
	
</body>
</html>