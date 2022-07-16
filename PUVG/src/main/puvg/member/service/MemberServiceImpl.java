package main.puvg.member.service;

import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import main.puvg.member.dao.MemberDAO;
import main.puvg.member.vo.MemberVO;

@Service
@Transactional
public class MemberServiceImpl implements MemberService {
	Logger logger = LogManager.getLogger(MemberServiceImpl.class);
	
	@Autowired(required=false)
	private MemberDAO memberDAO;
	
	public List<MemberVO> MemberSelect(MemberVO mvo){
		logger.info("MemberServiceImpl.MemberSelect() 진입");
		return memberDAO.MemberSelect(mvo);
	}
	
	public int MemberInsert(MemberVO mvo) {
		logger.info("MemberServiceImpl.MemberInsert() 진입");
		return memberDAO.MemberInsert(mvo);
	}
	
	public List<MemberVO> MemberSelectAll(MemberVO mvo) {
		logger.info("MemberServiceImpl.MemberSelectAll() 진입");
		return memberDAO.MemberSelectAll(mvo);
	}

	public int MemberUpdatepw(MemberVO mvo) {
		logger.info("MemberServiceImpl.MemberUpdatepw() 진입");
		return memberDAO.MemberUpdatepw(mvo);
	}
	
	public List<MemberVO> MemberSelectAdmin(MemberVO mvo) {
		logger.info("MemberServiceImpl.MemberSelectAdmin() 진입");
		return memberDAO.MemberSelectAdmin(mvo);
	}
	
	public int MemberUpdate(MemberVO mvo) {
		logger.info("MemberServiceImpl.MemberUpdate() 진입");
		return memberDAO.MemberUpdate(mvo);
	}
	
	public int MemberUpdateImg(MemberVO mvo) {
		logger.info("MemberServiceImpl.MemberUpdateImg() 진입");
		return memberDAO.MemberUpdateImg(mvo);
	}
	
	public List<MemberVO> MemberSelectWork(MemberVO mvo) {
		logger.info("MemberServiceImpl.MemberSelectWork() 진입");
		return memberDAO.MemberSelectWork(mvo);
	}
	
	public List<MemberVO> MemberSearch(MemberVO mvo) {
		logger.info("MemberServiceImpl.MemberSearch() 진입");
		return memberDAO.MemberSearch(mvo);
	}
	
	public List<MemberVO> MemberSearchData(MemberVO mvo) {
		logger.info("MemberServiceImpl.MemberSearchData() 진입");
		return memberDAO.MemberSearchData(mvo);
	}
}
