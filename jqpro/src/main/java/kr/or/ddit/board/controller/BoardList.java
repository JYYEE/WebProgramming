package kr.or.ddit.board.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.board.service.BoardServiceImpl;
import kr.or.ddit.board.service.IBoardService;
import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.board.vo.PageVO;

@WebServlet("/boardList.do")
public class BoardList extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		// 요청시 전송 데이터 가져오기
		int page = Integer.parseInt(request.getParameter("page")); // 최초 실행시 값=1
		String stype = request.getParameter("stype"); // 최초 실행시 존재x
		String sword = request.getParameter("sword"); // 최초 실행시 존재x
		
		// service객체 얻기
		IBoardService service = BoardServiceImpl.getService();
		// service 메소드 호출하기 - 페이지 처리에 필요한 값들을 계산
		PageVO pvo = service.pageInfo(page, stype, sword);
		
		// service메소드 - list를 select한 결과값 받기
		Map<String, Object> map = new HashMap<>();
		map.put("start", pvo.getStart());
		map.put("end", pvo.getEnd());
		map.put("stype", stype);
		map.put("sword", sword);
		
		List<BoardVO> list = service.selectByPage(map);
		
		// 결과값을 request에 저장
		request.setAttribute("listvalue", list);
		request.setAttribute("startPage", pvo.getStartPage());
		request.setAttribute("endPage", pvo.getEndPage());
		request.setAttribute("totalPage", pvo.getTotalPage());
		
		// view페이지로 이동
		request.getRequestDispatcher("/boardview/boardList.jsp").forward(request, response);
	}

}
