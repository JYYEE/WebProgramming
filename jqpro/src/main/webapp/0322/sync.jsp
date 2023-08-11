<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table {
	border: 1px solid blue;
}

td {
	width: 300px;
	height: 40px;
	text-align: center;
}
</style>
</head>
<body>
  <%
  //요청시 전송데이터 받기

  //데이터로 처리수행-DB와 연결해서 CRUD

  //처리 결과로 응답 데이터 생성
  String sid = "a001";
  %>
  <table border="1">
    <tr>
      <td>아이디</td>
      <td>이름</td>
      <td>전화번호</td>
      <td>이메일</td>
    </tr>
    <tr>
      <td>a001</td>
      <td>홍길동</td>
      <td>010-1234-5678</td>
      <td>hong1234@gmail.com</td>
    </tr>
    <tr>
      <td>b001</td>
      <td>강아지</td>
      <td>010-4555-1111</td>
      <td>dog1111@gmail.com</td>
    </tr>
    <tr>
      <td>c001</td>
      <td>복숭아</td>
      <td>010-4215-9041</td>
      <td>peach9041@gmail.com</td>
    </tr>
    <tr>
      <td>d001</td>
      <td>고양이</td>
      <td>010-9875-6981</td>
      <td>cat8181@gmail.com</td>
    </tr>
  </table>
</body>
</html>