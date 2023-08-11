<%@page import="com.google.gson.JsonElement"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="kr.or.ddit.board.vo.BoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    // controller에서 저장한 데이터 가져오기
    List<BoardVO> list = (List<BoardVO>) request.getAttribute("listvalue");
    int startPage = (int)request.getAttribute("startPage");    
    int endPage = (int)request.getAttribute("endPage");    
    int totalPage = (int)request.getAttribute("totalPage");    


    JsonObject obj = new JsonObject();
    obj.addProperty("startPage", startPage); 
    obj.addProperty("endPage", endPage); 
    obj.addProperty("totalPage", totalPage); 
    
    Gson gson = new Gson();
    
    JsonElement result = gson.toJsonTree(list); // toJsonTree : json element로 만들어줌
    obj.add("datas", result); // value로 json element 추가 
    
    out.print(obj);
    out.flush();
%>