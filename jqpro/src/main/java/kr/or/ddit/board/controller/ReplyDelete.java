package kr.or.ddit.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.board.service.BoardServiceImpl;
import kr.or.ddit.board.service.IBoardService;

/**
 * Servlet implementation class ReplyDelete
 */
@WebServlet("/replyDelete.do")
public class ReplyDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 요청시 전송데이터 받기 - renum 
		int renum = Integer.parseInt(request.getParameter("renum"));
		
		// service객체 얻어오기
		IBoardService service = BoardServiceImpl.getService();
		
		// service메소드 호출 - 결과값 받기
		int res = service.deleteReply(renum);
		
		// request에 결과값 저장
		request.setAttribute("result", res);
		
		// view페이지로 이동
		request.getRequestDispatcher("/boardview/result.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
