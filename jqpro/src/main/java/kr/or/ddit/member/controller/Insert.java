package kr.or.ddit.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.member.vo.MemberVO;


@WebServlet("/insert.do")
public class Insert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		// 요청시 전송데이터 받기
		String id= request.getParameter("mem_id");
		String pass= request.getParameter("mem_pass");
		String name= request.getParameter("mem_name");
		String mail= request.getParameter("mem_mail");
		String bir= request.getParameter("mem_bir");
		String zip= request.getParameter("mem_zip");
		String add1= request.getParameter("mem_add1");
		String add2= request.getParameter("mem_add2");
		String hp= request.getParameter("mem_hp");
		// vo클래스에 저장
		MemberVO vo = new MemberVO();
		vo.setMem_id(id);
		vo.setMem_pass(pass);
		vo.setMem_name(name);
		vo.setMem_mail(mail);
		vo.setMem_bir(bir);
		vo.setMem_zip(zip);
		vo.setMem_add1(add1);
		vo.setMem_add2(add2);
		vo.setMem_hp(hp);
		// service객체 얻어오기
		IMemberService service = MemberServiceImpl.getService();
		// service메소드 호출하기 - 결과값 받기
		int result = service.insertMember(vo);
		// 결과값을 request에 저장하기
		request.setAttribute("result", result);
		// view 페이지로 이동
		request.getRequestDispatcher("/view/insert.jsp").forward(request, response);
		
	}

}
