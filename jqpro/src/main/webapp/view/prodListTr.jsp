<%@page import="com.google.gson.JsonElement"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="kr.or.ddit.prod.vo.ProdVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
// controller에서 저장된 결과값 꺼내기
List<ProdVO> prodList = (List<ProdVO>) request.getAttribute("prodList");
    
    JsonObject obj = new JsonObject();
    
    if(prodList != null && prodList.size()>0){
        obj.addProperty("flag", "ok");
        
        Gson gson = new Gson();
        JsonElement jele = gson.toJsonTree(prodList); // 배열안 json은 toJsonTree로 json객체로 반환
        obj.add("datas", jele); // json객체를 추가할 때는 add를 이용.
        
    } else {
        obj.addProperty("flag", "no");
    }
    out.print(obj);
    out.flush();
%>
    
<%--     {    "flag" : "ok",
         "datas" : 
      [
        <%
        for (int i = 0; i < prodList.size(); i++) {
      	  ProdVO vo = prodList.get(i);
      	  if(i>0) out.print(",");
          %>
          { "id" : "<%=vo.getProd_id()%>", 
            "name" : "<%=vo.getProd_name()%>" }
          <% 
        }
        %>
      ]
   }
    <% 
} else {
    	%>
    {
        "flag" : "no"
    }
  <%
}
%> --%>