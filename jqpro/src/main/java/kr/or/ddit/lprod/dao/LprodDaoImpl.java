package kr.or.ddit.lprod.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.lprod.vo.LprodVO;
import kr.or.ddit.mybatis.config.MybatisSqlSessionFactory;


/*
 * SqlSession 필요
 * 자기 자신의 객체를 생성하여 리턴하는 메소드
 */

public class LprodDaoImpl implements ILprodDao {
	private static ILprodDao dao;
	// 생성자
	
	// 메소드
	public static ILprodDao getDao() {
		if(dao == null) dao = new LprodDaoImpl();
		return dao;
	}
	
	@Override
	public List<LprodVO> selectAll() {
		SqlSession session = MybatisSqlSessionFactory.getSqlSession();
		List<LprodVO> list = null;
		try {
		list = session.selectList("lprod.selectAll");
			
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			session.close();
		}
		return list;
	}

}
