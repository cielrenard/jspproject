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
<title>설문</title>
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
    	<h1>체질검사</h1>      
    	<p>문항에 성의껏 대답하시오.</p>
    </div>
</div>
  <div class="container">
    <div class="progress">
   		<div class="progress-bar" style="width:60%"></div>
  </div>
</div>
<div class="container">
<form id="Qfrm1" method="post" action="../Question/Question03.br" >
	<input type="hidden" name="sero" value="3">	
	<input type="hidden" name="sum1" value="${SUM1}">
	<input type="hidden" name="sum2" value="${SUM2}">
	<input type="hidden" name="sum3" value="${SUM3}">			
    <table class="table table-primary table-striped text-center">
        <tr>
            <td colspan="7">운동성</td>
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
            <td> 바둑이나 낚시처럼 오래 앉아있는 정적인 취미생활은 적성에  아니다</td>
            <td><input type="radio" name="btn1" value="1"></td>
            <td><input type="radio" name="btn1" value="2"></td>
            <td><input type="radio" name="btn1" value="3"checked="checked"></td>
            <td><input type="radio" name="btn1" value="4"></td>
            <td><input type="radio" name="btn1" value="5"></td>
        </tr>
        <tr>
            <th>2</th>
            <td>아무 것도 안하고 멍하니 있는 것은 견디기 힘들다.</td>
            <td><input type="radio" name="btn2" value="1"></td>
            <td><input type="radio" name="btn2" value="2"></td>
            <td><input type="radio" name="btn2" value="3"></td>
            <td><input type="radio" name="btn2" value="4"checked="checked"></td>
            <td><input type="radio" name="btn2" value="5"></td>
        </tr>
        <tr>
            <th>3</th>
            <td>더워도 차가운 물이나 바람을 머리에 직접 맞는 것은 싫어한다.</td>
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
            <td>어깨에 무거운 느낌이 싫어서 겨울에도 가벼운 외투를 즐겨 입는다.</td>
            <td><input type="radio" name="btn5" value="1"></td>
            <td><input type="radio" name="btn5" value="2"checked="checked"></td>
            <td><input type="radio" name="btn5" value="3"></td>
            <td><input type="radio" name="btn5" value="4"></td>
            <td><input type="radio" name="btn5" value="5"></td>
        </tr>
        <tr>
            <th>6</th>
            <td>아무리 소문난 집도 멀리 찾아가거나 오래 줄서서까지 먹는 건 싫다.</td>
            <td><input type="radio" name="btn6" value="5"></td>
            <td><input type="radio" name="btn6" value="4"></td>
            <td><input type="radio" name="btn6" value="3"checked="checked"></td>
            <td><input type="radio" name="btn6" value="2"></td>
            <td><input type="radio" name="btn6" value="1"></td>
        </tr>
        <tr>
            <th>7</th>
            <td>아무런 목적이나 행선지 없이 무작정 외출하진 않는다.</td>
            <td><input type="radio" name="btn7" value="1"></td>
            <td><input type="radio" name="btn7" value="2"></td>
            <td><input type="radio" name="btn7" value="3"></td>
            <td><input type="radio" name="btn7" value="4"checked="checked"></td>
            <td><input type="radio" name="btn7" value="5"></td>
        </tr>
        <tr>
            <th>8</th>
            <td>어떤 일이든 직접 하는 것이 쉽다.</td>
            <td><input type="radio" name="btn8" value="1"></td>
            <td><input type="radio" name="btn8" value="2"></td>
            <td><input type="radio" name="btn8" value="3"></td>
            <td><input type="radio" name="btn8" value="4"checked="checked"></td>
            <td><input type="radio" name="btn8" value="5"></td>
        </tr>
        <tr>
            <th>9</th>
            <td>계단보다 엘리베이터나 에스컬레이터를 이용하는 편이다.</td>
            <td><input type="radio" name="btn9" value="5"></td>
            <td><input type="radio" name="btn9" value="4"></td>
            <td><input type="radio" name="btn9" value="3"></td>
            <td><input type="radio" name="btn9" value="2"checked="checked"></td>
            <td><input type="radio" name="btn9" value="1"></td>
        </tr>
        <tr>
            <th>10</th>
            <td>걷거나 뛰는 것보다 집에서 쉬는게 좋다.</td>
            <td><input type="radio" name="btn10" value="5"></td>
            <td><input type="radio" name="btn10" value="4"></td>
            <td><input type="radio" name="btn10" value="3"checked="checked"></td>
            <td><input type="radio" name="btn10" value="2"></td>
            <td><input type="radio" name="btn10" value="1"></td>
        </tr>
        <tr>
            <td colspan="7" align="right">
                <input type="button" value="다음 단계로" id="sub" class="btn btn-primary">                
            </td>
        </tr>
    	</table>    
 	</form>
</div>
</div>
<script src="../js/bootstrap.min.js"></script>
</body>
</html>