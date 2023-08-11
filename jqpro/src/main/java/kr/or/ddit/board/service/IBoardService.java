package kr.or.ddit.board.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.board.vo.PageVO;
import kr.or.ddit.board.vo.ReplyVO;

public interface IBoardService {
	// 글쓰기 - 실행된 행의 개수 대신에 시퀀스값을 리턴하도록 변경
	public int insertBoard(BoardVO vo);

	// 글삭제
	public int deleteBoard(int num);

	// 글수정
	public int updateBoard(BoardVO vo);

	// 조회수 증가
	public int updateHit(int num);

	// 리스트 - 검색
	public List<BoardVO> selectByPage(Map<String, Object> map);

	// 댓글 쓰기
	public int insertReply(ReplyVO vo);

	// 댓글 삭제
	public int deleteReply(int renum);

	// 댓글 수정
	public int updateReply(ReplyVO vo);
	
	// 댓글 리스트
	public List<ReplyVO> selectReply(int bonum);
	
	
	// 페이지별 정보구하기 - 페이지 처리 
	// (dao에는 없는 내용. 단순 계산 로직. db 필요없는 내용) 테이블은 없지만 계산을 위해 vo 만듦 
	// 조인할 때 테이블a에서 컬럼1,2 테이블b에서 컬럼 3,4 가져와서 테이블로 만들지 않고 vo로 담아놓고 계산할 때 사용.
	public PageVO pageInfo(int page, String Stype, String sword);

	// 전체 글 갯수 구하기
	public int totalCount(Map<String, Object> map);
	
	
}
