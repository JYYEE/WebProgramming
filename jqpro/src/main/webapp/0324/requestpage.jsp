<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored = "false" %>    
    
<%--jsp에서는 ${}로 사용하는 태그가 존재하여 백틱 인식 안됨. $기호 앞에 역슬래시(\) 붙여서 사용  --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/mystyle.css">
<script src="../js/jquery-3.6.4.min.js" type="text/javascript"></script>
<script type="text/javascript">
$(function(){
	$('#lprod').on('click', function(){
		$.ajax({
			url : "http://localhost/jqpro/0324/lprodController.jsp",
			type : 'get',
			success : function(res){
				code ="<table border='1'>"
				code +="<tr><td>아이디</td><td>상품번호</td><td>상품이름</td></tr>"
				
				$.each(res,function(i,v){
					code +="<tr><td>"+res[i].lprod_id+"</td><td>"+res[i].lprod_gu+"</td><td>"+v.lprod_nm+"</td></tr>"
				})
				code +="</table>"
				$('#result1').html(code);
			},
			error : function(xhr){
				alert("상태 : " +xhr.status)
			},
			dataType : 'json'
		})
		
		
		
	})
})
</script>
<style type="text/css">
table {
  border : 2px dotted orange;
}
td {
  width : 150px;
  height : 30px;
  text-align : center;
}
</style>
</head>
<body>
<div class="box">
    <p></p>
    <br> <br>
    <input type="button" value="LPROD리스트"  id="lprod">
    <br> <br>
    <div class="result" id="result1"></div>
  </div>
</body>
</html>