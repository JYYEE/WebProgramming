<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table {
	border: 1px solid blue;
	margin: 50px auto;
	border-collapse: collapse;
}

td {
	width: 250px;
	height: 50px;
	text-align: center;
}

td:nth-child(1) { /* (td의 첫번재 자식) : 사이 띄우면 td의 자식 중 첫번째 자식으로 인식 */
	background-color: #faadd3;
}

div {
	border: 1px solid blue;
	margin: 50px auto;
	width: 500px;
	padding : 10px;
	height : 500px;
}

p {
	border: 1px solid green;
}
p:nth-child(1){/*p태그 중 첫번째 자식으로 선언된 자식*/
background-color: #faadd3;
}

p:nth-child(2){
height : 85%;
}
</style>
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");

	String name = request.getParameter("name");
	String id = request.getParameter("id");
	String tel = request.getParameter("tel");
	String area = request.getParameter("area");
	
	String rep = area.replaceAll("\r", "").replaceAll("\n", "<br>");
	%>

	<table border="1">
		<tr>
			<td>이름</td>
			<!-- 첫번째 줄의 첫번재 자식 -->
			<td><%=name%></td>
		</tr>
		<tr>
			<td>아이디</td>
			<!-- 두번째 줄의 첫번재 자식 -->
			<td><%=id%></td>
		</tr>
		<tr>
			<td>전화번호</td>
			<!-- 세번째 줄의 첫번재 자식 -->
			<td><%=tel%></td>
		</tr>
	</table>

	<div>
		<p>
			<span>자기소개</span>
		</p>
		<p>
			<%=rep%>
		</p>
	</div>
</body>
</html>