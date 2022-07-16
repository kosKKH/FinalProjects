package main.puvg.approval.dao;

import java.util.List;

import org.apache.log4j.LogManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.apache.log4j.Logger;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import main.puvg.approval.vo.Appr1DocVO;
import main.puvg.approval.vo.Appr2DocVO;
import main.puvg.approval.vo.Appr3DocVO;
import main.puvg.approval.vo.Appr4DocVO;
import main.puvg.approval.vo.ApprovalLineVO;
import main.puvg.approval.vo.ApprovalListVO;
import main.puvg.approval.vo.ApprovalTempVO;

@Repository
public class ApprovalDAOImpl implements ApprovalDAO {
	
	Logger logger = LogManager.getLogger(ApprovalDAOImpl.class);
	
	@Autowired(required=false)
	private SqlSession sqlSession;

	@Override
	public List<ApprovalListVO> ApprovalListSelectAll(ApprovalListVO amvo) {
		logger.info("ApprovalDAOImpl ApprovalListSelectAll() 함수 진입");
		
		return sqlSession.selectList("ApprovalListSelectAll", amvo);
	}

	@Override
	public List<ApprovalListVO> ApprovalListSelect(ApprovalListVO amvo) {
		logger.info("ApprovalDAOImpl ApprovalListSelect() 함수 진입");
		
		return sqlSession.selectOne("ApprovalListSelectAll", amvo);
	}

	@Override
	public int Appr1DocInsert(Appr1DocVO amvo) {
		logger.info("ApprovalDAOImpl Appr1DocInsert() 함수 진입");
		
		return sqlSession.insert("Appr1DocInsert", amvo);
	}

	@Override
	public List<Appr1DocVO> Appr1DocSelect(Appr1DocVO amvo) {
		logger.info("ApprovalDAOImpl Appr1DocSelect() 함수 진입");
		
		return sqlSession.selectOne("Appr1DocSelect", amvo);
	}

	@Override
	public int Appr2DocInsert(Appr2DocVO amvo) {
		logger.info("ApprovalDAOImpl Appr1DocInsert() 함수 진입");
		
		return sqlSession.insert("Appr2DocInsert", amvo);
	}

	@Override
	public List<Appr2DocVO> Appr2DocSelect(Appr2DocVO amvo) {
		logger.info("ApprovalDAOImpl Appr1DocSelect() 함수 진입");
		
		return sqlSession.selectOne("Appr2DocSelect", amvo);
	}

	@Override
	public int Appr3DocInsert(Appr3DocVO amvo) {
		logger.info("ApprovalDAOImpl Appr3DocInsert() 함수 진입");
		
		return sqlSession.insert("Appr3DocInsert", amvo);
	}

	@Override
	public List<Appr3DocVO> Appr3DocSelect(Appr3DocVO amvo) {
		logger.info("ApprovalDAOImpl Appr3DocSelect() 함수 진입");
		
		return sqlSession.selectOne("Appr3DocSelect", amvo);
	}

	@Override
	public int Appr4DocInsert(Appr4DocVO amvo) {
		logger.info("ApprovalDAOImpl Appr4DocInsert() 함수 진입");
		
		return sqlSession.insert("Appr4DocInsert", amvo);
	}

	@Override
	public List<Appr4DocVO> Appr4DocSelect(Appr4DocVO amvo) {
		logger.info("ApprovalDAOImpl Appr4DocSelect() 함수 진입");
		
		return sqlSession.selectOne("Appr4DocSelect", amvo);
	}

	@Override
	public int ApprovalLineInsert(ApprovalLineVO amvo) {
		logger.info("ApprovalDAOImpl ApprovalLineInsert() 함수 진입");
		
		return sqlSession.insert("ApprovalLineInsert", amvo);
	}

	@Override
	public int ApprovalLineSelect(ApprovalLineVO amvo) {
		logger.info("ApprovalDAOImpl ApprovalLineSelect() 함수 진입");
		
		return sqlSession.selectOne("ApprovalLineSelect", amvo);
	}
	
	@Override
	public int ApprovalTempInsert(ApprovalTempVO amvo) {
		logger.info("ApprovalDAOImpl ApprovalTempInsert() 함수 진입");
		
		return sqlSession.insert("ApprovalTempInsert", amvo);
	}

	@Override
	public List<ApprovalTempVO> ApprovalTempSelectAll(ApprovalTempVO amvo) {
		logger.info("ApprovalDAOImpl ApprovalTempSelectAll() 함수 진입");
		
		return sqlSession.selectList("ApprovalTempSelectAll", amvo);
	}

	@Override
	public List<ApprovalTempVO> ApprovalTempSelect(ApprovalTempVO amvo) {
		logger.info("ApprovalDAOImpl ApprovalTempSelect() 함수 진입");
		
		return sqlSession.selectOne("ApprovalTempSelect", amvo);
	}

	@Override
	public int ApprovalTempUpdate(Appr1DocVO amvo) {
		logger.info("ApprovalDAOImpl ApprovalTempUpdate() 함수 진입");
		
		return (Integer)sqlSession.insert("ApprovalTempUpdate", amvo);
	}

	@Override
	public List<Appr1DocVO> ApprovalListAcceptAll(Appr1DocVO amvo) {
		logger.info("ApprovalDAOImpl ApprovalListAcceptAll() 함수 진입");
		
		return sqlSession.selectOne("ApprovalListAcceptAll", amvo);
	}

	@Override
	public List<Appr1DocVO> ApprovalAcceptSelect(Appr1DocVO amvo) {
		logger.info("ApprovalDAOImpl ApprovalAcceptSelect() 함수 진입");
		
		return sqlSession.selectOne("ApprovalAcceptSelect", amvo);
	}

	@Override
	public int ApprovalAcceptUpdate(Appr1DocVO amvo) {
		logger.info("ApprovalDAOImpl ApprovalAcceptUpdate() 함수 진입");
		
		return (Integer)sqlSession.insert("ApprovalAcceptUpdate", amvo);
	}

}
