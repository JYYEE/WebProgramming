package kr.or.ddit.lprod.service;

import java.util.List;

import kr.or.ddit.lprod.dao.ILprodDao;
import kr.or.ddit.lprod.dao.LprodDaoImpl;
import kr.or.ddit.lprod.vo.LprodVO;
/*
 * dao의 메소드를 호출하여 실행 - dao객체가 필요
 * 자신의 객체를 생성하여 리턴하는 메소드
 */
public class LprodServiceImpl implements ILprodService {
	private ILprodDao dao;
	private static ILprodService service;
	
	// 생성자 
	private LprodServiceImpl() {
		dao = LprodDaoImpl.getDao();
	}
	
	// 메소드
	public static ILprodService getService() {
		if(service == null) service = new LprodServiceImpl();
		return service;
	}
	
	@Override
	public List<LprodVO> selectAll() {
		return dao.selectAll();
	}

}
