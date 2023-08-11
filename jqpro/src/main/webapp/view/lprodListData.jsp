<%@page import="com.google.gson.Gson"%>
<%@page import="kr.or.ddit.lprod.vo.LprodVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// controller에서 저장한 데이터 꺼내기
    List<LprodVO> lprodlist = (List<LprodVO>) request.getAttribute("key");

    Gson gson = new Gson();
    String result = gson.toJson(lprodlist);
    out.print(result);
    out.flush();

  %>
<%--  [ 
  <%
  
    for(int i=0;i<lprodlist.size();i++){
      LprodVO vo = lprodlist.get(i);
      if(i>0) out.print(",");
    
%>
  {
    "id" : "<%=vo.getLprod_id() %>",
    "gu"  : "<%=vo.getLprod_gu() %>",
    "nm" : "<%=vo.getLprod_nm() %>"
  }
  <%
    }
  
  %>
 ]  --%>