<%@page import="kr.or.ddit.buyer.vo.BuyerVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.buyer.service.BuyerServiceImpl"%>
<%@page import="kr.or.ddit.buyer.service.IBuyerService"%>
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
// 요청시 데이터 받기 -- 현재 없으므로 생략

// service객체 얻기
IBuyerService service = BuyerServiceImpl.getService();
// service메소드 호출 -- 결과값 받기
List<BuyerVO> list = service.selectIdName();
// 결과값을 저장 -- request에 저장
request.setAttribute("buyerList", list);
// view 페이지로 이동 (데이터를 request에서 꺼냄) - 응답 데이터를 생성 - json
RequestDispatcher disp = request.getRequestDispatcher("/view/BuyerName.jsp");
disp.forward(request, response);

%>
</body>
</html>