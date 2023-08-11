package kr.or.ddit.buyer.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.buyer.vo.BuyerVO;
import kr.or.ddit.mybatis.config.MybatisSqlSessionFactory;

public class BuyerDaoImpl implements IBuyerDao{
	private static IBuyerDao dao;
	// 자신의 객체를 생성해서 리턴
	public static IBuyerDao getDao() {
		if(dao == null) dao = new BuyerDaoImpl();
		return dao;
	}
	@Override
	public List<BuyerVO> selectIdName() {
		SqlSession session = null;
		List<BuyerVO> buyerList = null;
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			buyerList = session.selectList("buyer.selectIdName");
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			session.close();
		}
		return buyerList;
	}

	@Override
	public BuyerVO selectById(String id) {
		SqlSession session = null;
		BuyerVO buyerVO = null;
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			buyerVO = session.selectOne("buyer.selectById", id);
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			session.close();
		}
		return buyerVO;
	}

}
