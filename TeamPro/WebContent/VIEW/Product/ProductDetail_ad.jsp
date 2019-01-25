ProductList.jsp<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>Insert title here</title>
<%--
	jQuery를 이용하기 위해서는 jQuery라이브러리가 필요하다
 --%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <%--광고판--%>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script>
	$(document).ready(function(){	//문서
		//'목록보기' 버튼 클릭 했을 때
		$('#1Btn').click(function(){
			//목록보기로 강제로 이동
			//자바스크립트 location.href="요청내용";
			location.href="../Product/ProductList.br?nowPage=${nowPage}";
			
			//jQuery $(선택자).attr('속성명',"요청내용")
			//$(location).attr('href',"../Product/ProductList.br?nowPage=${nowPage}");
		});
			//id="mBtn" value="수정하기"
			//적절한 이벤트를 이용해서 적절한 요청처리하기(컨트롤러->뷰)
			$('#mBtn').click(function(){
				$(location).attr('href',"../Product/ModifyForm.br?oriNo=${VIEW.no}&nowPage=${nowPage}")
			});
			//id="dBtn" value="삭제하기"
			//적절한 이벤트를 이용해서 적절한 요청처리하기(컨트롤러->뷰)
			$('#dBtn').click(function(){
				//1.비밀번호를 입력받는다
				var id = prompt('아이디를 입력하세요');
				
				//2.hidden에 필요한 데이터를 심어놓는다
				
					//자바스크립트
						//특정id요소의 값을 가져오기
						//document.getElementById("id명").value;
						//특정id요소의 값을 설정하기
						//document.getElementById("id명").value=값;
					
					//jQuery
						//$(선택자).val();		//특정id요소의 값을 가져오기
						//$(선택자).val(데이터);	//특정id요소의 값을 설정하기
				$("#imsiOriNo").val("${VIEW.no}");
				$("#imsiId").val(id);
				
				//3.요청
				$("#imsiFrm").submit();
				
			});
	});
</script>
<%--스타일--%>
	<style>
		html { 
		  background: url(/BROS/VIEW/Product/pattern-3569886_1920.jpg) no-repeat center center fixed; 
		  -webkit-background-size: cover;
		  -moz-background-size: cover;
		  -o-background-size: cover;
		  background-size: cover;
		}	
		
		body {
			margin: 0px;
			background-color: rgba(255,255,255,0)
		}
		
		#tab1 {
			 position: static;
			 padding: 500px 500px;
			 width: 1800px; 
			 height: 1000px; 
			 background-color: #ffffff;
		}				
		
		#ex {
        	width:300px;
            height:100px;
            resize:none;
        }
       
	</style>	
</head>
<body class="w3-container w3-center w3-animate-bottom">
	<img style="padding: 20px; width: 1000px; height: auto;" src="/BROS/VIEW/Product/detail4.png"/>
			
	<%--1.상세 내용 보기--%>
	<table id="tab1" align="center">	
		<tr>
			<td rowspan="8" style="padding: 20px; background-color:  #1f3d7a">
			<img style="width: 1150px; height: auto; display: block; margin-left: auto; margin-right: auto" src="../img/${VIEW.cfile}"/>
			</td>	
		</tr>	
		<tr>	
			<th style="font-size: x-large; font-family: Times New Roman">PRODUCT NO</th>
			<td style="width: 300px; font-size: x-large; font-family: Times New Roman" align="center">${VIEW.no}</td>
		</tr>
		<tr>
			<th style="font-size: x-large; font-family: Times New Roman">TITLE</th>
			<td style="font-transform: capitalize; font-size: x-large; font-family: Times New Roman" align="center" colspan="3">${VIEW.pname}</td>
		</tr>	
		<tr>	
			<th style="font-size: x-large; font-family: Times New Roman">TYPE</th>
			<td style="font-transform: lowercase; font-size: x-large; font-family: Times New Roman" align="center">${VIEW.sen}</td>
		</tr>
		<tr>	
			<th style="font-size: x-large; font-family: Times New Roman">VOLUME</th>
			<td style="font-size: x-large; font-family: Times New Roman" align="center">${VIEW.ample}</td>
		</tr>
		<tr>	
			<th style="font-size: x-large; font-family: Times New Roman">PRICE</th>
			<td style="font-size: x-large; font-family: Times New Roman" align="center">${VIEW.price}</td>			
		</tr>
<%-- 		<tr>
			<th>글쓴이</th>
			<td align="center">${VIEW.id}</td>
		</tr> --%>
		<tr>
			<th style="font-size: x-large; font-family: Times New Roman">EXPLANATION</th>
			<td style="font-transform: capitalize; font-size: large; font-family: Times New Roman" align="left" colspan="3">${VIEW.ex}</td>
		</tr>		
	</table>
	<!-- <form id="imsiFrm" method="POST" action="../Product/ProductDelete.br">
		<input type="hidden" name="oriNo" id="imsiOriNo"/>
		<input type="hidden" name="id"	  id="imsiId"/>
	</form> -->
	
</body>
</html>