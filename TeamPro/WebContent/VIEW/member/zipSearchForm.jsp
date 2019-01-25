<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>      
<!DOCTYPE html>
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title></head>
<script src="../../jquery/jquery-3.3.1.min.js"></script>
<script>
$(function(){
	$("#sido").change(function(){
		var sido=$("#sido option:selected").val()	
		if (sido=="SJ") { //세종시인경우
			$('#gugun').append('<option value="0">==선택하세요==</option>');			
			
			return;
		}
		$.ajax({
			url:"gugunSearch.jsp",
			data:"sido="+sido+"&temp="+new Date(),
			dataType:"json",
			type:"get",
			success:setGugun,
			error:function(error){
				alert(error)
			}			
		})
	})
	$('#gugun').change(function(){
		var params=$("#frm").serialize();
		$.ajax({
			url:"doroSearch.jsp",
			data:params,
			dataType:"xml",
			type:"post",
			success:setDoro,
			error:function(error){
				alert(error)
			}				
		})
	})	
	$('#zipsearch').click(function(){
		var params=$('#frm').serialize();
		$.ajax({
			url:"zipSearch.jsp",
			data:params,
			dataType:"xml",
			type:"post",
			success:setZip,
			error:function(error){
				alert(error)
			}			
		})
	})
	function setGugun(data){
		$('#gugun option').remove();
		$('#gugun').append('<option value="0">==선택하세요==</option>');
		var items=data.gugun
		$.each(items,function(){
			code=this.code;
			name=this.name;			
			option="<option value='"+code+"'>"+name+"</option>";
			$('#gugun').append(option)			
		})				
		
	}	
	function setDoro(data){
		$('#doro option').remove();
		$('#doro').append('<option value="0">==선택하세요==</option>');
		var doros=$(data).find('doro');
		$.each(doros,function(){
			code=$(this).find('code').text();
			name=$(this).find('name').text();			
			option="<option value='"+code+"'>"+name+"</option>";
			$('#doro').append(option);		
		})
	}
	function setZip(data){
		table="<table width='80%' border='1'>";
		addrs=$(data).find('addr');
		$.each(addrs,function(){
			zipcode=$(this).find('zipcode').text();
			juso=$(this).find('juso').text();			
			table=table+"<tr>"
			table += '<td><a href=\'JavaScript:autoIn("'+zipcode+'","'+juso+'")\'>' + zipcode + "</a></td>";	
			table=table+"<td>"+juso+"</td></tr>"			
		})
		table=table+"</table>"
		$("#result").html(table);
	}
})
function autoIn(zipcode,juso){
	$('#add1',opener.document).val(zipcode)
	$('#add2',opener.document).val(juso)
	self.close()
}
</script>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
String url="jdbc:oracle:thin:@localhost:1521:XE";
Connection con=DriverManager.getConnection(url,"bros","0711");
Statement st=con.createStatement();
String sql="select * from sido order by no";
ResultSet rs=st.executeQuery(sql);
ArrayList list=new ArrayList();
while (rs.next()){
	HashMap map=new HashMap();
	map.put("code",rs.getString("code"));
	map.put("name",rs.getString("name"));
	list.add(map);
}
rs.close();
st.close();
con.close();%>
<body>
<form name="frm" id="frm">
	<table border="1">
	<tr>
		<td><select id="sido" name="sido" style="width:150px">
				<option value="0">==선택하세요==</option>
<%
				for(int i=0;i<list.size();i++){
					HashMap temp=(HashMap)list.get(i);
					String code=(String)temp.get("code");
					String name=(String)temp.get("name");	%>				
			
				<option value="<%=code %>"><%=name %></option>
<% 			}%>					
				</select>
		</td>
		<td><select id="gugun" name="gugun" style="width:150px">
				<option value="0">==선택하세요==</option>		
				</select>
		</td>				
		<td><select id="doro" name="doro" style="width:150px">
				<option value="0">==선택하세요==</option>		
				</select>
		</td>
		<td><input type="button" id="zipsearch" value="검색"></td>
	</tr>	
	</table>
</form>
<div id="result"></div>
</body>
</html>







