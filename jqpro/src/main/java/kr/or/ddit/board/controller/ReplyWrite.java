package kr.or.ddit.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.board.service.BoardServiceImpl;
import kr.or.ddit.board.service.IBoardService;
import kr.or.ddit.board.vo.ReplyVO;

/**
 * Servlet implementation class ReplyWrite
 */
@WebServlet("/replyWrite.do")
public class ReplyWrite extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		// 요청시 전송데이터 받기 - name, bonum, cont
		String repName = request.getParameter("name");
		int repBonum = Integer.parseInt( request.getParameter("bonum"));
		String repCont = request.getParameter("cont");
		
		ReplyVO vo = new ReplyVO();
		vo.setBonum(repBonum);
		vo.setCont(repCont);
		vo.setName(repName);
		
		// service 객체 얻기
		IBoardService service = BoardServiceImpl.getService();
		
		// service 메소드 호출 - 결과값을 받기
		int res = service.insertReply(vo);
		
		// 결과값을 request에 저장
		request.setAttribute("result", res);
		
		// view 페이지로 이동
		request.getRequestDispatcher("/boardview/result.jsp").forward(request, response);
	}

}
