<%@page import="com.google.gson.Gson"%>
<%@page import="kr.or.ddit.buyer.vo.BuyerVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// controller에서 저장한 데이터 꺼내기
List<BuyerVO> buyerList =(List<BuyerVO>) request.getAttribute("buyerList");

    Gson gson = new Gson();
    String result = gson.toJson(buyerList);
    out.print(result);
    out.flush();
   
%>
<%-- [
<% 
  for(int i=0; i<buyerList.size(); i++){
    BuyerVO vo = buyerList.get(i);   
    if(i>0){
      out.print(", ");
      }
   %>
   {
      "id" : "<%= vo.getBuyer_id() %>",
      "name" : "<%= vo.getBuyer_name() %>"
   } 
    
   <% 
  }
%>
] --%>