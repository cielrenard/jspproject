<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>���̵� ã��</title>
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
								�� �� �� ã ��</font>
						</h2>
					</td>
				<tr>
					<td><font size="2px"><br>���̵� ��ﳪ�� ��������? <br>
							�̸�, �̸����� �Է��Ͽ� ���̵� Ȯ���Ͻ� �� �ֽ��ϴ�. <br> ���������� �����Ǵ� ������ �ش�
							����������� ���� �����ϸ�, <br> ���� �̿��� �뵵�� �̿� �Ǵ� �������� �ʽ��ϴ�. <br>
							</font></td>
				</tr>
				
				
			
			</table>

			<form name="f" method="post" action="../../VIEW/login/membersearchIDproc.brs" onsubmit="return serchIDCheck()">
				<table>
					<tr>
						<th width="150"><font size="2px">�̸�</font></th>
						<td width="250"><input type="text" name="name" size="35"></td>
					</tr>
					<tr>
						<th width="150"><font size="2px">�̸���</font></th>
						<td width="250"><input type="text" name="email" class="box"
							size="35"></td>
					</tr>
					<tr>
						<td colspan="2" align="right">
							<input type="submit" value="Ȯ��">
							<input type="button" onclick="location.href='../../VIEW/login/loginform.brs'" value="�α���"></td>
					</tr>
				</table>
			</form>
		</div>
	</div>

	<script>
		function serchIDCheck() {
			if (f.name.value === "") {
				alert("�̸� �Է¶��� �����Դϴ�.");
				f.name.focus();
				return false;
			}

			if (f.email.value === "") {
				alert("�̸��� �Է¶��� �����Դϴ�.")
				f.email.focus();
				return false;
			}
			return true;
		}
	</script>


</body>
</html>