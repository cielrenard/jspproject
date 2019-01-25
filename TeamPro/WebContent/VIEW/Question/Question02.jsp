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
    <div class="progress-bar" style="width:40%"></div>
  </div>
</div>
<div class="container">
<form id="Qfrm1" method="post" action="../Question/Question02.br" >
	<input type="hidden" name="sero" value="2">	
	<input type="hidden" name="sum1" value="${SUM1}">
	<input type="hidden" name="sum2" value="${SUM2}">			
    <table class="table table-primary table-striped text-center">
        <tr>
            <td colspan="7">식습관</td>
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
            <td>대체로 같은 양을 일정하게 먹는 편이다. </td>
            <td><input type="radio" name="btn1" value="1"></td>
            <td><input type="radio" name="btn1" value="2"></td>
            <td><input type="radio" name="btn1" value="3"checked="checked"></td>
            <td><input type="radio" name="btn1" value="4"></td>
            <td><input type="radio" name="btn1" value="5"></td>
        </tr>
        <tr>
            <th>2</th>
            <td>먹고 있을 때에 기분 나쁜 일이 있으면 잘 체한다. </td>
            <td><input type="radio" name="btn2" value="1"></td>
            <td><input type="radio" name="btn2" value="2"></td>
            <td><input type="radio" name="btn2" value="3"></td>
            <td><input type="radio" name="btn2" value="4"checked="checked"></td>
            <td><input type="radio" name="btn2" value="5"></td>
        </tr>
        <tr>
            <th>3</th>
            <td>몸에 이상이 있다 싶으면 좋아하는 것이 있어도 조절을 잘 하는 편이다.</td>
            <td><input type="radio" name="btn3" value="1"checked="checked"></td>
            <td><input type="radio" name="btn3" value="2"></td>
            <td><input type="radio" name="btn3" value="3"></td>
            <td><input type="radio" name="btn3" value="4"></td>
            <td><input type="radio" name="btn3" value="5"></td>
        </tr>
        <tr>
            <th>4</th>
            <td>변비가 있어도, 식사는 정상적으로 잘 한다.</td>
            <td><input type="radio" name="btn4" value="1"></td>
            <td><input type="radio" name="btn4" value="2"></td>
            <td><input type="radio" name="btn4" value="3"checked="checked"></td>
            <td><input type="radio" name="btn4" value="4"></td>
            <td><input type="radio" name="btn4" value="5"></td>
        </tr>
        <tr>
            <th>5</th>
            <td>소문난 식당이나 맛집은 먼 거리라도 어떤지 한 번 가보려고 한다.</td>
            <td><input type="radio" name="btn5" value="1"></td>
            <td><input type="radio" name="btn5" value="2"></td>
            <td><input type="radio" name="btn5" value="3"></td>
            <td><input type="radio" name="btn5" value="4"checked="checked"></td>
            <td><input type="radio" name="btn5" value="5"></td>
        </tr>
        <tr>
            <th>6</th>
            <td>속이 쓰릴 때에 음식을 먹으면 속 아픈 것이 덜하다.</td>
            <td><input type="radio" name="btn6" value="1"></td>
            <td><input type="radio" name="btn6" value="2"></td>
            <td><input type="radio" name="btn6" value="3"></td>
            <td><input type="radio" name="btn6" value="4"></td>
            <td><input type="radio" name="btn6" value="5"checked="checked"></td>
        </tr>
        <tr>
            <th>7</th>
            <td>스트레스 받거나 우울해지면 이상하게 식욕이 더 당긴다.</td>
            <td><input type="radio" name="btn7" value="1"></td>
            <td><input type="radio" name="btn7" value="2"></td>
            <td><input type="radio" name="btn7" value="3"></td>
            <td><input type="radio" name="btn7" value="4"></td>
            <td><input type="radio" name="btn7" value="5"checked="checked"></td>
        </tr>
        <tr>
            <th>8</th>
            <td>식사 중에 기분이 불쾌해지면 갑자기 체하곤 한다.</td>
            <td><input type="radio" name="btn8" value="1" checked="checked"></td>
            <td><input type="radio" name="btn8" value="2"></td>
            <td><input type="radio" name="btn8" value="3"></td>
            <td><input type="radio" name="btn8" value="4"></td>
            <td><input type="radio" name="btn8" value="5"></td>
        </tr>
        <tr>
            <th>9</th>
            <td>식사를 불규칙하게 몰아서 먹어도 소화는 잘된다.</td>
            <td><input type="radio" name="btn9" value="1"></td>
            <td><input type="radio" name="btn9" value="2"></td>
            <td><input type="radio" name="btn9" value="3"></td>
            <td><input type="radio" name="btn9" value="4"checked="checked"></td>
            <td><input type="radio" name="btn9" value="5"></td>
        </tr>
        <tr>
            <th>10</th>
            <td>아무리 좋아하는 반찬이라도 몇 끼를 계속해서 먹는 것은 싫다.</td>
            <td><input type="radio" name="btn10" value="1"></td>
            <td><input type="radio" name="btn10" value="2"></td>
            <td><input type="radio" name="btn10" value="3"></td>
            <td><input type="radio" name="btn10" value="4"></td>
            <td><input type="radio" name="btn10" value="5" checked="checked"></td>
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