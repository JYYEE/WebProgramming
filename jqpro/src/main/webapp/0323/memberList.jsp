<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.member.service.MemberServiceImpl"%>
<%@page import="kr.or.ddit.member.service.IMemberService"%>
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
//요청시 전송데이터 받기

// service객체가 필요
IMemberService service = MemberServiceImpl.getService();

List<MemberVO> list = service.getAllMember();
// 처리 결과를 request에 저장
request.setAttribute("listvalue", list);// key(변수명), value

// view 페이지로 이동시켜 응답 데이터를 생성 - json object 배열 객체를 생성
// 이동방법 - 
RequestDispatcher disp = request.getRequestDispatcher("../view/listData.jsp");
disp.forward(request, response);

%>
</body>
</html>