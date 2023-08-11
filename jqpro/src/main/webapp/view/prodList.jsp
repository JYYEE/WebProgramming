<%@page import="kr.or.ddit.prod.vo.ProdVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
// controller에서 저장한 데이터 꺼내기
List<ProdVO> prodlist = (List<ProdVO>) request.getAttribute("list");

%>
[
<% 
  for(int i=0;i<prodlist.size(); i++){
   ProdVO vo= prodlist.get(i);
   if(i>0) out.print(",");
%>
  {
    "id" : "<%=vo.getProd_id() %>", 
    "name" : "<%=vo.getProd_name() %>" 
  }
  <%
  }
  %>  
]
