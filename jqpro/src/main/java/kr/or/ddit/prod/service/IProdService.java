package kr.or.ddit.prod.service;

import java.util.List;

import kr.or.ddit.prod.vo.ProdVO;

public interface IProdService {
	public List<ProdVO> selectByLgu(String prodLgu);
	
	public ProdVO selectById(String prodId);
}
