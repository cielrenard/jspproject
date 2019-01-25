<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>Insert title here</title>
<script src="../js/jquery-3.3.1.js"></script>
<script>
	$(document).ready(function(){
		//id="mBtn" value="수정하기"
		/* $("#mBtn").click(function(){
			$("#mFrm").submit();
		}); */
	});
</script>
<%--스타일--%>
	<style>
		html { 
		  background: url(../img/painting-3135875_1280.jpg) no-repeat center center fixed; 
		  -webkit-background-size: cover;
		  -moz-background-size: cover;
		  -o-background-size: cover;
		  background-size: cover;
		}	
		
		#tab1 {
		 position: absolute;
		 top: 90%;
		 right: 31%;
		 margin: 20px;
		 padding: 50px 100px;
		 width: 800px; 
		 height: 870px; 
		 background-color: #ffffff;
		 opacity: 0.9;
		 border-radius: 20%
		}	
		
		#ex {
        	width:300px;
            height:100px;
            resize:none;
        }
	</style>
</head>
<body class="w3-container w3-center w3-animate-bottom">
	<%--
	req.setAttribute("PRODUCT", vo);
	req.setAttribute("nowPage", nowPage);
	 --%> 
	<img id="modify" style="width: 900px; height: 500px"src="../img/modify.png">
	<form id="mFrm" align="center" method="POST" action="../Product/ModifyProc.br">
		<%--폼을 이용해서 submit시킬 때 폼 안에 없는 데이터는 서버에 전달되지 않는다
			같이 보내야할 필요가 있는 데이터가 있으면<input type="hidden">으로 숨겨서 보내야한다--%>
		<input type="hidden" name="nowPage" value="${nowPage}"/>
		<input type="hidden" name="oriNo"	value="${PRODUCT.no}"/>
		<table id="tab1" align="center">
			<tr>
				<th colspan="2" style="font-size: 30pt">Please enter information</th>
			</tr>		
			<tr>	
				<th>TYPE</th>
				<td>
					<input type="text" style="width: 150px; height: 30px" name="sen" id="sen" value="${PRODUCT.sen}"/>
				</td>
			</tr>	
			<tr>
				<th>TITLE</th>
				<td>
					<input type="text" style="width: 150px; height: 30px" name="pname" id="pname" value="${PRODUCT.pname}"/>
				</td>
			</tr>	
			<tr>
				<th>EXPLANATION</th>
				<td>
					<textarea name="ex" id="ex">${PRODUCT.ex}</textarea>
				</td>
			</tr>
			<tr>
				<th>VOLUME</th>
				<td>				
					<input type="text" style="width: 150px; height: 30px" name="ample" id="ample" value="${PRODUCT.ample}"/>
				</td>
			<tr>	
			<tr>
				<th>PRICE</th>
				<td>				
					<input type="text" style="width: 150px; height: 30px" name="price" id="price" value="${PRODUCT.price}"/>
				</td>			
			</tr>		
			<tr>
				<th>IMAGE</th>
				<td>
					<input type="file" name="cfile" id="cfile">
				</td>
			</tr>
			<!--보안-->
			<tr>
				<th>MANAGER</th>
				<td>
					<!--주의 ID 출력X, value속성을 사용하지X-->
					<input type="text" style="width: 150px; height: 30px" name="id" id="id"/>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<!-- <input type="button" style="width: 150px; height: 30px" id="mBtn" value="TO MODIFY"/> -->
					
					<input type="image" src="../img/mbtn.png" style="width: 200px; height: 100px" />
					
				</td>
			</tr>			
		</table>
	</form> 
</body>
</html>