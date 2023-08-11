<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
h1 {
  color : red;
}
p {
  color : blue;
  font-size: 2.0em;
}
</style>
</head>
<body>
  <h1>JSP : Java Server Page</h1>
  <p>서버 내에서 실행되는 프로그램</p>
  <%
    String userId = request.getParameter("id");
  %>
  <%= userId  %>님 환영합니다. 
</body>
</html>