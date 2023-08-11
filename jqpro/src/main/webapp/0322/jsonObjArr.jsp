<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//요청시 전송데이터 받기

// 데이터로 처리수행-DB와 연결해서 CRUD

// 처리 결과로 응답 데이터 생성 - json Object 배열 생성
    
%>
[
  { 
    "id" : "a001",
    "name" : "홍길동",
    "tel" : "010-1234-5678",
    "mail" : "hong1234@gmail.com"
  },
  { 
      "id" : "b001",
      "name" : "강아지",
      "tel" : "010-4555-1111",
      "mail" : "dog1111@gmail.com"
  },
  { 
      "id" : "c001",
      "name" : "복숭아",
      "tel" : "010-4215-9041",
      "mail" : "peach9041@gmail.com"
  },
  { 
      "id" : "d001",
      "name" : "고양이",
      "tel" : "010-9875-6981",
      "mail" : "cat8181@gmail.com"
  }
    
 ]