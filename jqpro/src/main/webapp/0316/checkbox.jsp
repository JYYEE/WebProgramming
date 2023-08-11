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
  request.setCharacterEncoding("utf-8"); // 한글 안깨지기 위해서 꼭 필요!
  
  String hobby[] = request.getParameterValues("hobby");
  
  String str = "";
  for(int i=0;i<hobby.length; i++){
    str += hobby[i] + " "; 
  }
%>
<%=str %>

<%-- <%= hobby %>  배열의 주소값이 나옴. 직접 값이 나오게 하려면 반복문으로 값을 꺼내야함 --%>
</body>
</html>