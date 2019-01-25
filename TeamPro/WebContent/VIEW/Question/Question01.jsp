<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c"  uri ="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<title>설문</title>
<script src="../js/jquery-3.3.1.min.js"></script>
<link href="../css/bootstrap.min.css" rel="stylesheet">
<script>
$(function(){
	$('#sub').click(function(){
		$('#sero').val();
		$('#Qfrm1').submit()		
	})
	$('#del').click(function(){
		location.href="../Question/QuesDel.br"		
	})	
})
</script>
</head>
<body>
<div class="box" id="section1" style="background-size: 300; background-image:url(${pageContext.request.contextPath}/img/architecture-1850129_1920.jpg)">

<div class="jumbotron jumbotron-fluid">
  	<div class="container primary">
    	<h1>체질검사</h1>      
    	<p>문항에 성의껏 대답하시오.</p>
	</div>
</div>
<div class="container">
    <div class="progress">
    	<div class="progress-bar" style="width:20%"></div>
  	</div>
</div>
<div class="container">
	<form id="Qfrm1" method="post" action="../Question/Question01.br" >
		<input type="hidden" name="sero" value="1">	
    	<table class="table table-primary table-striped text-center">
        	<tr>
            	<td colspan="7">성격</td>
        	</tr>
        	<tr>
        		<td colspan="7">${USER}</td>
       		</tr>
        	<tr>
            	<td>번호</td>
            	<td>질문 내용</td>
            	<td>전혀 그렇지 않다 </td>
            	<td>그렇지 않다 </td>
            	<td>보통이다 </td>
            	<td>그런편이다</td>
            	<td>매우그렇다</td>
        	</tr>
        	<tr>
            	<th>1</th>
            	<td>무슨일이나 시원스럽게 처리한다.</td>
            	<td><input type="radio" name="btn1" value="1"></td>
            	<td><input type="radio" name="btn1" value="2"></td>
            	<td><input type="radio" name="btn1" value="3"checked="checked"></td>
            	<td><input type="radio" name="btn1" value="4"></td>
            	<td><input type="radio" name="btn1" value="5"></td>
        	</tr>
        	<tr>
            	<th>2</th>
            	<td>활발하고 대가 센 편이다</td>
            	<td><input type="radio" name="btn2" value="1"></td>
            	<td><input type="radio" name="btn2" value="2"></td>
            	<td><input type="radio" name="btn2" value="3"></td>
            	<td><input type="radio" name="btn2" value="4"checked="checked"></td>
            	<td><input type="radio" name="btn2" value="5"></td>
        	</tr>
        	<tr>
            	<th>3</th>
            	<td>매사에 이해를 따지지 않고 나서는 편이다.</td>
            	<td><input type="radio" name="btn3" value="1"></td>
            	<td><input type="radio" name="btn3" value="2"></td>
            	<td><input type="radio" name="btn3" value="3"></td>
            	<td><input type="radio" name="btn3" value="4"></td>
            	<td><input type="radio" name="btn3" value="5"checked="checked"></td>
        	</tr>
        	<tr>
            	<th>4</th>
            	<td>진득하게 한 곳에 오래 있을 수 있다.</td>
            	<td><input type="radio" name="btn4" value="1"></td>
            	<td><input type="radio" name="btn4" value="2"></td>
            	<td><input type="radio" name="btn4" value="3"></td>
            	<td><input type="radio" name="btn4" value="4"checked="checked"></td>
            	<td><input type="radio" name="btn4" value="5"></td>
        	</tr>
        	<tr>
            	<th>5</th>
            	<td>치밀하고 꼼꼼한 편이다.</td>
            	<td><input type="radio" name="btn5" value="1"></td>
            	<td><input type="radio" name="btn5" value="2"checked="checked"></td>
            	<td><input type="radio" name="btn5" value="3"></td>
            	<td><input type="radio" name="btn5" value="4"></td>
            	<td><input type="radio" name="btn5" value="5"></td>
        	</tr>
        	<tr>
	            <th>6</th>
            	<td>경우에 맞지 않으면 옳고 그른지 시비를 가르는 편이다</td>
            	<td><input type="radio" name="btn6" value="1"></td>
            	<td><input type="radio" name="btn6" value="2"></td>
            	<td><input type="radio" name="btn6" value="3"checked="checked"></td>
            	<td><input type="radio" name="btn6" value="4"></td>
            	<td><input type="radio" name="btn6" value="5"></td>
        	</tr>
        	<tr>
	            <th>7</th>
            	<td>안 해도 되는 사적인 이야기까지 나도 모르게 한다.</td>
            	<td><input type="radio" name="btn7" value="1"></td>
            	<td><input type="radio" name="btn7" value="2"></td>
            	<td><input type="radio" name="btn7" value="3"></td>
            	<td><input type="radio" name="btn7" value="4"checked="checked"></td>
            	<td><input type="radio" name="btn7" value="5"></td>
        	</tr>
        	<tr>
	            <th>8</th>
            	<td>대화중에 혼자 생각하느라 이야기의 흐름을 자주 놓친다.</td>
            	<td><input type="radio" name="btn8" value="1"></td>
            	<td><input type="radio" name="btn8" value="2"></td>
            	<td><input type="radio" name="btn8" value="3"></td>
            	<td><input type="radio" name="btn8" value="4"checked="checked"></td>
            	<td><input type="radio" name="btn8" value="5"></td>
        	</tr>
        	<tr>
	            <th>9</th>
            	<td>말은 안 해도 상처준 사람은 다시 보면 그때 일이 생생해진다.</td>
            	<td><input type="radio" name="btn9" value="1"></td>
            	<td><input type="radio" name="btn9" value="2"></td>
            	<td><input type="radio" name="btn9" value="3"></td>
            	<td><input type="radio" name="btn9" value="4"checked="checked"></td>
            	<td><input type="radio" name="btn9" value="5"></td>
        	</tr>
        	<tr>
	            <th>10</th>
            	<td>다른 사람의 시선을 많이 의식하는 편이다.</td>
            	<td><input type="radio" name="btn10" value="1"></td>
            	<td><input type="radio" name="btn10" value="2"></td>
            	<td><input type="radio" name="btn10" value="3"checked="checked"></td>
            	<td><input type="radio" name="btn10" value="4"></td>
            	<td><input type="radio" name="btn10" value="5"></td>
        	</tr>
        	<tr>
	            <td colspan="7" align="right">
               	<input type="button" value="다음 단계로" id="sub" class="btn btn-primary">	                
    	        </td>
        	</tr>
    	</table>    
 	</form>
 	<form>
 		<table class="table table-primary table-striped text-center">
 			<tr>
 				<td><input type="button" value="기록 초기화 하기" id="del" class="btn btn-primary"></td>
 			</tr>
 		</table>
 	</form>
 </div>
  </div>
<script src="../js/bootstrap.min.js"></script>
</body>
</html>