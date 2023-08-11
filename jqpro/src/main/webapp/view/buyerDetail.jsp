<%@page import="com.google.gson.Gson"%>
<%@page import="kr.or.ddit.buyer.vo.BuyerVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// controller에서 저장된 데이터 꺼내기
    BuyerVO vo = (BuyerVO) request.getAttribute("buyervo");
    Gson gson = new Gson();
    String result = gson.toJson(vo);
    out.print(result);
    out.flush(); 
%>
<%-- {
  "id" : "<%=vo.getBuyer_id() %>",
  "lgu" : "<%=vo.getBuyer_lgu() %>",
  "name" : "<%=vo.getBuyer_name() %>",
  "mail" : "<%=vo.getBuyer_mail() %>",
  "bank" : "<%=vo.getBuyer_bank() %>",
  "bankname" : "<%=vo.getBuyer_bankname() %>",
  "bankno" : "<%=vo.getBuyer_bankno() %>",
  "zip" : "<%=vo.getBuyer_zip() %>",
  "add1" : "<%=vo.getBuyer_add1() %>",
  "add2" : "<%=vo.getBuyer_add2() %>"
}
 --%>