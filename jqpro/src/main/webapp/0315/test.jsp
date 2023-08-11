<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
  font-size : 2.0em;
}
</style>
</head>
<body>
<h1>JSP : Java Server Page</h1>
<%
  // request : 내장객체 - HttpRequest
  String stxt = request.getParameter("txt");

%>

<%= stxt %>
</body>
</html>