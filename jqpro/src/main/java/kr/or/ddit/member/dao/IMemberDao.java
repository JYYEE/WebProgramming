package kr.or.ddit.member.dao;

import java.util.List;

import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.member.vo.ZipVO;

public interface IMemberDao {
	// member List
	public List<MemberVO> getAllMember();

	// 가입(저장)하기
	public int insertMember(MemberVO vo);

	// id중복검사
	public String idCheck(String Id);

	// 우편번호 찾기
	public List<ZipVO> selectByDong(String dong);
}
