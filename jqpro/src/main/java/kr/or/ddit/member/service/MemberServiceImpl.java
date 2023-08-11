package kr.or.ddit.member.service;

import java.util.List;

import kr.or.ddit.member.dao.IMemberDao;
import kr.or.ddit.member.dao.MemberDaoImpl;
import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.member.vo.ZipVO;
/*
 * dao객체의 메소드를 호출, 실행 - dao객체가 필요
 * 자기 자신의 객체를 생성하여 리턴
 */
public class MemberServiceImpl implements IMemberService {
	private IMemberDao dao;
	private static IMemberService service;
	
	private MemberServiceImpl(){
		dao = MemberDaoImpl.getDao();
	}
	
	public static IMemberService getService() {
		if(service == null) service = new MemberServiceImpl();
		return service;
	}
	
	@Override
	public List<MemberVO> getAllMember() {
//		List<MemberVO> list = null;
//		list = dao.getAllMember();
		return dao.getAllMember();
	}

	@Override
	public int insertMember(MemberVO vo) {
		return dao.insertMember(vo);
	}

	@Override
	public String idCheck(String Id) {
		return dao.idCheck(Id);
	}

	@Override
	public List<ZipVO> selectByDong(String dong) {
		return dao.selectByDong(dong);
	}

}
