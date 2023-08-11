<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    // controller에서 전달한 데이터 불러오기
    int res = (Integer)request.getAttribute("result");

    if(res>0){
    %>
        {
            "flag" : "가입 성공"
        }
    <%    
    } else { 
    %>
        {
            "flag" : "가입 실패"
        }
        <%
    }
    
        %>