package kr.or.ddit.mybatis.config;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

/**
 * myBatis의 환경설정 파일(mybatis-config.xml)을 읽어와서 SqlSessionFactory를 생성, 실행하고
 * SqlSession객체를 반환하는 메서드를 갖는 클래스 
 * 
 * @author PC-03
 *
 */
public class MybatisSqlSessionFactory {
	private static SqlSessionFactory sqlSessionFactory = null;
	
	static { // 초기화 블록
		Reader rd = null;

		try {
			rd = Resources.getResourceAsReader("kr/or/ddit/mybatis/config/mybatis-config.xml");
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(rd);

		} catch (Exception e) {
			System.out.println("myBatis 초기화 실패!!");
			e.printStackTrace();
		} finally {
			if (rd != null) try {rd.close();} catch (IOException e2) {}
		}
	}
	/**
	 * SqlSessionFactory 객체를 이용하여 SQL문을 처리할 SqlSession객체를 반환하는 메서드
	 * 
	 * @return SqlSession객체
	 */

	public static SqlSessionFactory getSessionFactory() {
		return sqlSessionFactory;
	}
	
	public static SqlSession getSqlSession() {
		SqlSession session = sqlSessionFactory.openSession(true); // () 안에 true 쓰면 자동 commit.
		return session;
	}
}
