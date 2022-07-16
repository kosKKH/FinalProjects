package main.puvg.approval.service;

import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import main.puvg.approval.dao.ApprovalDAO;
import main.puvg.approval.vo.Appr1DocVO;
import main.puvg.approval.vo.Appr2DocVO;
import main.puvg.approval.vo.Appr3DocVO;
import main.puvg.approval.vo.Appr4DocVO;
import main.puvg.approval.vo.ApprovalLineVO;
import main.puvg.approval.vo.ApprovalListVO;
import main.puvg.approval.vo.ApprovalTempVO;

@Service
@Transactional
public class ApprovalServiceImpl implements ApprovalService {
	
	Logger logger = LogManager.getLogger(ApprovalServiceImpl.class);
	
	@Autowired(required=false)
	ApprovalDAO approvalDAO;

	@Override
	public List<ApprovalListVO> ApprovalListSelectAll(ApprovalListVO amvo) {
		
		logger.info("ApprovalServiceImpl ApprovalListSelectAll() 함수 진입");
		return approvalDAO.ApprovalListSelectAll(amvo);

	}

	@Override
	public List<ApprovalListVO> ApprovalListSelect(ApprovalListVO amvo) {
		
		logger.info("ApprovalServiceImpl ApprovalListSelect() 함수 진입");
		return approvalDAO.ApprovalListSelect(amvo);
		
	}

	@Override
	public int Appr1DocInsert(Appr1DocVO amvo) {
		
		logger.info("ApprovalServiceImpl Appr1DocInsert() 함수 진입");
		return approvalDAO.Appr1DocInsert(amvo);
		
	}

	@Override
	public List<Appr1DocVO> Appr1DocSelect(Appr1DocVO amvo) {
		
		logger.info("ApprovalServiceImpl Appr1DocSelect() 함수 진입");
		return approvalDAO.Appr1DocSelect(amvo);
		
	}

	@Override
	public int Appr2DocInsert(Appr2DocVO amvo) {
		
		logger.info("ApprovalServiceImpl Appr2DocInsert() 함수 진입");
		return approvalDAO.Appr2DocInsert(amvo);
		
	}

	@Override
	public List<Appr2DocVO> Appr2DocSelect(Appr2DocVO amvo) {
		
		logger.info("ApprovalServiceImpl Appr2DocSelect() 함수 진입");
		return approvalDAO.Appr2DocSelect(amvo);
		
	}

	@Override
	public int Appr3DocInsert(Appr3DocVO amvo) {
		
		logger.info("ApprovalServiceImpl Appr3DocInsert() 함수 진입");
		return approvalDAO.Appr3DocInsert(amvo);
		
	}

	@Override
	public List<Appr3DocVO> Appr3DocSelect(Appr3DocVO amvo) {
		
		logger.info("ApprovalServiceImpl Appr3DocSelect() 함수 진입");
		return approvalDAO.Appr3DocSelect(amvo);
		
	}

	@Override
	public int Appr4DocInsert(Appr4DocVO amvo) {
		
		logger.info("ApprovalServiceImpl Appr4DocInsert() 함수 진입");
		return approvalDAO.Appr4DocInsert(amvo);
		
	}

	@Override
	public List<Appr4DocVO> Appr4DocSelect(Appr4DocVO amvo) {
		
		logger.info("ApprovalServiceImpl Appr4DocSelect() 함수 진입");
		return approvalDAO.Appr4DocSelect(amvo);
		
	}

	@Override
	public int ApprovalLineInsert(ApprovalLineVO amvo) {
		
		logger.info("ApprovalServiceImpl ApprovalLineInsert() 함수 진입");
		return approvalDAO.ApprovalLineInsert(amvo);
		
	}

	@Override
	public int ApprovalLineSelect(ApprovalLineVO amvo) {
		
		logger.info("ApprovalServiceImpl ApprovalLineSelect() 함수 진입");
		return approvalDAO.ApprovalLineSelect(amvo);
		
	}
	
	public int ApprovalTempInsert(ApprovalTempVO amvo) {
		
		logger.info("ApprovalServiceImpl ApprovalTempInsert() 함수 진입");
		return approvalDAO.ApprovalTempInsert(amvo);
	
	}

	@Override
	public List<ApprovalTempVO> ApprovalTempSelectAll(ApprovalTempVO amvo) {
		
		logger.info("ApprovalServiceImpl ApprovalTempSelectAll() 함수 진입");
		return approvalDAO.ApprovalTempSelectAll(amvo);
		
	}

	@Override
	public List<ApprovalTempVO> ApprovalTempSelect(ApprovalTempVO amvo) {
		
		logger.info("ApprovalServiceImpl ApprovalTempSelect() 함수 진입");
		return approvalDAO.ApprovalTempSelect(amvo);
		
	}

	@Override
	public int ApprovalTempUpdate(Appr1DocVO amvo) {
		
		logger.info("ApprovalServiceImpl ApprovalTempSelect() 함수 진입");
		return approvalDAO.ApprovalTempUpdate(amvo);
	}
	
	@Override
	public List<Appr1DocVO> ApprovalListAcceptAll(Appr1DocVO amvo) {
		
		logger.info("ApprovalServiceImpl ApprovalListAcceptAll() 함수 진입");
		return approvalDAO.ApprovalListAcceptAll(amvo);
		
	}
	
	@Override
	public List<Appr1DocVO> ApprovalAcceptSelect(Appr1DocVO amvo) {
		
		logger.info("ApprovalServiceImpl ApprovalAcceptSelect() 함수 진입");
		return approvalDAO.ApprovalAcceptSelect(amvo);
		
	}

	@Override
	public int ApprovalAcceptUpdate(Appr1DocVO amvo) {
		
		logger.info("ApprovalServiceImpl ApprovalAcceptUpdate() 함수 진입");
		return approvalDAO.ApprovalAcceptUpdate(amvo);
	}

}
