<%@page import="kr.or.ddit.prod.vo.ProdVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.prod.service.ProdServiceImpl"%>
<%@page import="kr.or.ddit.prod.service.IProdService"%>
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
// 요청시 데이터 받기 - lprodGu 받기
String prodGu = request.getParameter("lprodgu");
// service객체 얻기
IProdService service = ProdServiceImpl.getService();
// service메소드 호출 - 결과값 받기
List<ProdVO> list = service.selectByLgu(prodGu);
// 결과값을 request에 저장
request.setAttribute("list", list);
// view페이지로 이동
RequestDispatcher disp = request.getRequestDispatcher("/view/prodList.jsp");
disp.forward(request, response);
%>
</body>
</html>