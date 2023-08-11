package kr.or.ddit.prod.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.mybatis.config.MybatisSqlSessionFactory;
import kr.or.ddit.prod.vo.ProdVO;

public class ProdDaoImpl implements IProdDao {
	private static IProdDao dao;
	
	public static IProdDao getDao() {
		if(dao == null) dao = new ProdDaoImpl();
		return dao;
	}
	
	@Override
	public List<ProdVO> selectByLgu(String prodLgu) {
		SqlSession session = MybatisSqlSessionFactory.getSqlSession();
		List<ProdVO> list = null;
		try {
			list = session.selectList("prod.selectByLgu", prodLgu);
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			session.close();
		}
		
		return list;
	}

	@Override
	public ProdVO selectById(String prodId) {
		SqlSession session = MybatisSqlSessionFactory.getSqlSession();
		ProdVO vo = null;
		try {
			vo = session.selectOne("prod.selectById", prodId);
		} catch (Exception e) {
		} finally {
			session.close();
		}
		return vo;
	}

}
