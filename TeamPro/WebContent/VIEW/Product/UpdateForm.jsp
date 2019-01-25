<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Karma">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>Insert title here</title>
</head>
<script>
	//글등록버튼 클릭시
	function UpdateProc(){
		//무결성검사 : 필수항목이 입력이 안된 경우 처리...
		
		//자바스크립트로 무결성 검사하는 방법
		//1. document.getElementById()를 이용해서 특정요소에 접근 
		//2. value속성을 이용해서 입력한 값을 알아내고
		//3. 값의 존재여부를 판단
		var sen = document.getElementById("sen");
		var senData = sen.value;
		if(senData==""){
			alert("Please enter Product's Type.");
			sen.focus();
			return;
		}
		
		var pname = document.getElementById("pname");
		var pnameData = pname.value;
		if(pnameData==""){
			alert("Please enter Product's Name.");
			pname.focus();
			return;
		}
		
		var ex = document.getElementById("ex");
		var exData = ex.value;
		if(exData==""){
			alert("Please enter Product's Detailed description.");
			ex.focus();
			return;
		}
		
		var ample = document.getElementById("ample");
		var ampleData = ample.value;
		if(ampleData==""){
			alert("Please enter Product's Volume.");
			ample.focus();
			return;
		}
		
		var price = document.getElementById("price");
		var priceData = price.value;
		if(priceData==""){
			alert("Please enter Product's Price.");
			price.focus();
			return;
		}

		var id = document.getElementById("id");
		var idData = id.value;
		if(idData==""){
			alert("Please enter Product's Id.");
			id.focus();
			return;
		}
		//폼을 submit
		document.getElementById("wFrm").submit();
	}
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
		 right: 30%;
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
<body class="w3-container w3-center w3-animate-bottom">
	<%-- 이미지 폼만들어 보여주자
	<form action="uploadAction.jsp" method="post" enctype="multipart/form-data">
		<table width="600" border="1" align="center">
		 	<tr>
				<th>파일</th>
				<td>
				<input type="file" name="file">
				<input type="submit" value="업로드">
				</td>
			</tr>
		</table>
	</form>
	 --%>
	<%-- 글쓰기 폼만들어 보여주자 --%>	
	<img id="update" style="width: 900px; height: 500px"src="../img/update2.png">
	<form id="wFrm" align="center"  method="POST" action="../Product/UpdateProc.br">
		<table id="tab1" align="center">
- 			<tr>
				<th colspan="2" style="font-size: 30pt">Please enter information</th>
			</tr> 
			<tr>
				<th>TYPE</th>
				<td>
					<input type="text" style="width: 150px; height: 30px" name="sen" id="sen"/>
				</td>
			</tr>		
			<tr>
				<th>TITLE</th>
				<td>
					<input type="text" style="width: 150px; height: 30px" name="pname" id="pname"/>
				</td>
			</tr>
			<tr>
				<th>EXPLANATION</th>
				<td>
					<textarea name="ex" id="ex"></textarea>
				</td>
			</tr>
			<tr>
				<th>VOLUME</th>
				<td>
					<input type="text" style="width: 150px; height: 30px" name="ample" id="ample"/>
				</td>
			</tr>
			<tr>
				<th>PRICE</th>
				<td>
					<input type="text" style="width: 150px; height: 30px" name="price" id="price"/>
				</td>
			</tr>
			<tr>
				<th>IMAGE</th>
				<td>
				<input type="file" name="cfile" id="cfile">	
				</td>
			</tr>		
			<%--보안--%>				
			<tr>
				<th>MANAGER</th>
				<td>
					<input type="text" style="width: 150px; height: 30px" name="id" id="id"/>
				</td>
			</tr>
			<tr>
				<th colspan="2">
				<!-- 	 <button style="background-image: url('/BROS/VIEW/Product/grass-3633969_1280.jpg'); width: 150px; height: 30px"></button> -->
					 <button style="width: 150px; height: 40px" id="wBtn" onclick="UpdateProc();">upload</button>
				</th>	
			</tr>									
		</table>
	</form>
</body>
</html>