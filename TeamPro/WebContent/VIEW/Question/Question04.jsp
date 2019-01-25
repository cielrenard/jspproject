<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix = "c"  uri ="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<title>����</title>
<script src="../js/jquery-3.3.1.min.js"></script>
<link href="../css/bootstrap.min.css" rel="stylesheet">

<script>
$(function(){
	$('#sub').click(function(){
		$('#Qfrm1').submit()		
	})
})
</script>
</head>
<body>
<div class="box" id="section1" style="background-size: 300; background-image:url(${pageContext.request.contextPath}/img/architecture-1850129_1920.jpg)">
<div class="jumbotron jumbotron-fluid">
  <div class="container">
    <h1>ü���˻�</h1>      
    <p>���׿� ���ǲ� ����Ͻÿ�.</p>
     </div>
</div>  
<div class="container">
    <div class="progress">
    <div class="progress-bar" style="width:80%"></div>
  </div>
</div>
<div class="container">
<form id="Qfrm1" method="post" action="../Question/Question04.br" >
	<input type="hidden" name="sero" value="4">	
	
	<input type="hidden" name="sum1" value="${SUM1}">
	<input type="hidden" name="sum2" value="${SUM2}">
	<input type="hidden" name="sum3" value="${SUM3}">	
	<input type="hidden" name="sum4" value="${SUM4}">	
    <table class="table table-primary table-striped text-center">
        <tr>
            <td colspan="7">ü��</td>
        </tr>
        <tr>
        	<td colspan="7">${USER}</td>
        </tr>
        <tr>
            <td>��ȣ</td>
            <td>���� ����</td>
            <td>���� �׷��� �ʴ� </td>
            <td>�׷��� �ʴ� </td>
            <td>�����̴� </td>
            <td>�׷����̴�</td>
            <td>�ſ�׷���</td>
        </tr>
        <tr>
            <th>1</th>
            <td>�չ��� �� ���̴�.</td>
            <td><input type="radio" name="btn1" value="1"></td>
            <td><input type="radio" name="btn1" value="2"></td>
            <td><input type="radio" name="btn1" value="3"checked="checked"></td>
            <td><input type="radio" name="btn1" value="4"></td>
            <td><input type="radio" name="btn1" value="5"></td>
        </tr>
        <tr>
            <th>2</th>
            <td>���� ���� ����</td>
            <td><input type="radio" name="btn2" value="1"></td>
            <td><input type="radio" name="btn2" value="2"></td>
            <td><input type="radio" name="btn2" value="3"></td>
            <td><input type="radio" name="btn2" value="4"checked="checked"></td>
            <td><input type="radio" name="btn2" value="5"></td>
        </tr>
        <tr>
            <th>3</th>
            <td>���� ��ó�� ���� �� ���� �ʴ´�</td>
            <td><input type="radio" name="btn3" value="1"></td>
            <td><input type="radio" name="btn3" value="2"></td>
            <td><input type="radio" name="btn3" value="3"></td>
            <td><input type="radio" name="btn3" value="4"></td>
            <td><input type="radio" name="btn3" value="5"checked="checked"></td>
        </tr>
        <tr>
            <th>4</th>
            <td>�ǰ� ���� ������ �ʴ´�</td>
            <td><input type="radio" name="btn4" value="1"></td>
            <td><input type="radio" name="btn4" value="2"></td>
            <td><input type="radio" name="btn4" value="3"></td>
            <td><input type="radio" name="btn4" value="4"checked="checked"></td>
            <td><input type="radio" name="btn4" value="5"></td>
        </tr>
        <tr>
            <th>5</th>
            <td>�Ȼ��� ������ ���δٴ� ���� ���� �����</td>
            <td><input type="radio" name="btn5" value="1"></td>
            <td><input type="radio" name="btn5" value="2"checked="checked"></td>
            <td><input type="radio" name="btn5" value="3"></td>
            <td><input type="radio" name="btn5" value="4"></td>
            <td><input type="radio" name="btn5" value="5"></td>
        </tr>
        <tr>
            <th>6</th>
            <td>�ڴٰ� ������ �������� ����</td>
            <td><input type="radio" name="btn6" value="1"></td>
            <td><input type="radio" name="btn6" value="2"></td>
            <td><input type="radio" name="btn6" value="3"checked="checked"></td>
            <td><input type="radio" name="btn6" value="4"></td>
            <td><input type="radio" name="btn6" value="5"></td>
        </tr>
        <tr>
            <th>7</th>
            <td>�ͽ��� ���� �ʴ´�</td>
            <td><input type="radio" name="btn7" value="1"></td>
            <td><input type="radio" name="btn7" value="2"></td>
            <td><input type="radio" name="btn7" value="3"></td>
            <td><input type="radio" name="btn7" value="4"checked="checked"></td>
            <td><input type="radio" name="btn7" value="5"></td>
        </tr>
        <tr>
            <th>8</th>
            <td>������ ���� ��������.</td>
            <td><input type="radio" name="btn8" value="1"></td>
            <td><input type="radio" name="btn8" value="2"></td>
            <td><input type="radio" name="btn8" value="3"></td>
            <td><input type="radio" name="btn8" value="4"checked="checked"></td>
            <td><input type="radio" name="btn8" value="5"></td>
        </tr>
        <tr>
            <th>9</th>
            <td>����� �޽����� ������ ���� �޴´�</td>
            <td><input type="radio" name="btn9" value="1"></td>
            <td><input type="radio" name="btn9" value="2"></td>
            <td><input type="radio" name="btn9" value="3"></td>
            <td><input type="radio" name="btn9" value="4"checked="checked"></td>
            <td><input type="radio" name="btn9" value="5"></td>
        </tr>
        <tr>
            <th>10</th>
            <td>�չ��� �����ϳ� �ܿ￡ �� ư��.</td>
            <td><input type="radio" name="btn10" value="1"></td>
            <td><input type="radio" name="btn10" value="2"></td>
            <td><input type="radio" name="btn10" value="3"checked="checked"></td>
            <td><input type="radio" name="btn10" value="4"></td>
            <td><input type="radio" name="btn10" value="5"></td>
        </tr>
        <tr>
            <td colspan="7" align="right">
                <input type="button" value="���� �ܰ��" id="sub" class="btn btn-primary">                
            </td>
        </tr>
    </table>    
 </form>
 </div>
 </div>

<script src="../js/bootstrap.min.js"></script>
</body>
</html>