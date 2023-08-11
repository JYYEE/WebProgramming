<%@page import="com.google.gson.Gson"%>
<%@page import="kr.or.ddit.prod.vo.ProdVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//controller에서 저장한 데이터 꺼내기
    ProdVO vo = (ProdVO) request.getAttribute("prodvo");
    
    Gson gson = new Gson();
    String result = gson.toJson(vo);
    out.print(result);
    out.flush();

%>
<%--   {
    "id" : "<%=vo.getProd_id() %>",
    "lgu" : "<%=vo.getProd_lgu() %>",
    "name" : "<%=vo.getProd_name() %>",
    "price" : "<%=vo.getProd_price() %>",
    "cost" : "<%=vo.getProd_cost() %>",
    "sale" : "<%=vo.getProd_sale() %>",
    "buyer" : "<%=vo.getProd_buyer() %>",
    "outline" : "<%=vo.getProd_outline() %>",
    "detail" : "<%=vo.getProd_detail() %>"
   } --%>