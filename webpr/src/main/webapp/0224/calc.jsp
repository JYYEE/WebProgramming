<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
p{
border : 1px solid blue;
margin : 10px;
padding: 10px;
}
span{
font-size : 2.0em;
}

</style>
</head>
<body>
<%
String pr = request.getParameter("price");
String qt = request.getParameter("qty");

int result =Integer.parseInt(pr) * Integer.parseInt(qt);
%>


<div>
<p> <span>수량</span><span><%=qt %></span></p>
<p> <span>가격</span><span><%=pr %></span></p>
<p> <span>결과</span><span><%=result %></span></p>


</div>
</body>
</html>