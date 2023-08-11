package kr.or.ddit.prod.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.prod.service.IProdService;
import kr.or.ddit.prod.service.ProdServiceImpl;
import kr.or.ddit.prod.vo.ProdVO;

/**
 * Servlet implementation class ProdNames
 */
@WebServlet("/ProdNames.do")
public class ProdNames extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProdNames() {
        super();
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 요청시 전송 데이터 받기 - lprod_gu
		String lgu = request.getParameter("guvalue");
		// service 객체 얻어오기
		IProdService service = ProdServiceImpl.getService();
		// service 메소드 호출 - 결과값 받기
		List<ProdVO> list = service.selectByLgu(lgu);
		///////////////////////////////////////자바 처리
		///////////////////////////////////////자바 출력
		// 결과값을 저장 후
		request.setAttribute("prodList", list);
		//view페이지로 이동
		request.getRequestDispatcher("/view/prodListTr.jsp").forward(request, response);
		
	}

}
