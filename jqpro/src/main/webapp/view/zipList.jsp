<%@page import="kr.or.ddit.member.vo.ZipVO"%>
<%@page import="java.util.List"%>
<%@page import="com.google.gson.Gson"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
    // controller에서 저장된 값 꺼내기
    List<ZipVO> list =(List<ZipVO>) request.getAttribute("donglist");
    Gson gson = new Gson();
    String result = gson.toJson(list);
    out.print(result);
    out.flush();
%>