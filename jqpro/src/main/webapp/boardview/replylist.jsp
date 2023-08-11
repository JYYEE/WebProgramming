<%@page import="com.google.gson.Gson"%>
<%@page import="kr.or.ddit.board.vo.ReplyVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    List<ReplyVO> list = (List<ReplyVO>)request.getAttribute("relist");

    Gson gson = new Gson();
    
    String result = gson.toJson(list);
    
    out.print(result);
    
    out.flush();






%>
