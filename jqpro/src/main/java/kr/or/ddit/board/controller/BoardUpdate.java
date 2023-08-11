package kr.or.ddit.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.board.service.BoardServiceImpl;
import kr.or.ddit.board.service.IBoardService;
import kr.or.ddit.board.vo.BoardVO;

/**
 * Servlet implementation class BoardUpdate
 */
@WebServlet("/boardUpdate.do")
public class BoardUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		// 요청시 데이터 - subject, mail, password, content, num
		BoardVO vo = new BoardVO();
		
		vo.setContent(request.getParameter("content"));
		vo.setMail(request.getParameter("mail"));
		vo.setPassword(request.getParameter("password"));
		vo.setSubject(request.getParameter("subject"));
		vo.setNum(Integer.parseInt(request.getParameter("num")));
		
		vo.setWip(request.getRemoteAddr());
		
		// service 객체 얻기
		IBoardService service = BoardServiceImpl.getService();
		
		// service 메소드 호출 - 결과값 얻기
		int cnt = service.updateBoard(vo);
		
		// 결과값을 request에 저장
		request.setAttribute("result", cnt);
		
		// view페이지로 이동 
		request.getRequestDispatcher("/boardview/result.jsp").forward(request, response);
		
	}

}
