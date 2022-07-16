package main.puvg.approval.dao;

import java.util.List;

import main.puvg.approval.vo.Appr1DocVO;
import main.puvg.approval.vo.Appr2DocVO;
import main.puvg.approval.vo.Appr3DocVO;
import main.puvg.approval.vo.Appr4DocVO;
import main.puvg.approval.vo.ApprovalLineVO;
import main.puvg.approval.vo.ApprovalListVO;
import main.puvg.approval.vo.ApprovalTempVO;

public interface ApprovalDAO {
	
	// 결재게시판
	public List<ApprovalListVO> ApprovalListSelectAll(ApprovalListVO amvo);
	public List<ApprovalListVO> ApprovalListSelect(ApprovalListVO amvo);
	
	// 휴가신청서
	public int Appr1DocInsert(Appr1DocVO amvo);
	public List<Appr1DocVO> Appr1DocSelect(Appr1DocVO amvo);
	
	// 자재구매요청서
	public int Appr2DocInsert(Appr2DocVO amvo);
	public List<Appr2DocVO> Appr2DocSelect(Appr2DocVO amvo);
	
	// 지출결의서
	public int Appr3DocInsert(Appr3DocVO amvo);
	public List<Appr3DocVO> Appr3DocSelect(Appr3DocVO amvo);
	
	// 프로젝트기획서
	public int Appr4DocInsert(Appr4DocVO amvo);
	public List<Appr4DocVO> Appr4DocSelect(Appr4DocVO amvo);
	
	// 결재선
	public int ApprovalLineInsert(ApprovalLineVO amvo);
	public int ApprovalLineSelect(ApprovalLineVO amvo);
	
	// 임시파일
	public int ApprovalTempInsert(ApprovalTempVO amvo);
	public List<ApprovalTempVO> ApprovalTempSelectAll(ApprovalTempVO amvo);
	public List<ApprovalTempVO> ApprovalTempSelect(ApprovalTempVO amvo);
	public int ApprovalTempUpdate(Appr1DocVO amvo);
	
	// 결재파일보기
	public List<Appr1DocVO> ApprovalListAcceptAll(Appr1DocVO amvo);
	public List<Appr1DocVO> ApprovalAcceptSelect(Appr1DocVO amvo);
	public int ApprovalAcceptUpdate(Appr1DocVO amvo);

}
