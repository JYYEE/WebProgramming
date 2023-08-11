package kr.or.ddit.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;


@WebServlet("/idCheck.do")
public class IdCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 요청시 전송 데이터 받기 - id
		String id = request.getParameter("id");
		// service 객체 얻기
		IMemberService service = MemberServiceImpl.getService();
		// service 메소드 호출 - 결과값 받기
		String result = service.idCheck(id);
		// a001입력시 a001리턴. b001입력시 b001리턴
		// korea입력시 null 리턴
		// 결과값을 request에 저장
		request.setAttribute("result", result);
		// view 페이지로 이동
		request.getRequestDispatcher("/view/idcheck.jsp").forward(request, response);
	}

}
