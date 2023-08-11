<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

request.setCharacterEncoding("utf-8");

String uid = request.getParameter("id");
String uname = request.getParameter("name");
String ufood = request.getParameter("foods");
String[] ufoods = request.getParameterValues("foods2");

String str = "";
for(String st : ufoods){
	str +=st + "<br>";
}

%>

<div>
<span>아이디</span>
<span><%=uid  %></span><br>
<span>이름</span>
<span><%= uname %></span><br>
<span>음식</span>
<span><%=ufood %></span><br>
<span>음식들</span><br>
<span><%= str %></span>

</div>

</body>

</html>