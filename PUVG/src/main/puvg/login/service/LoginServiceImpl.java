package main.puvg.login.service;

import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import main.puvg.login.dao.LoginDAO;
import main.puvg.member.vo.MemberVO;

@Service
@Transactional
public class LoginServiceImpl implements LoginService {
	Logger logger = LogManager.getLogger(LoginServiceImpl.class);
	
	@Autowired(required=false)
	private LoginDAO loginDAO;
	
	public List<MemberVO> LoginCheck(MemberVO mvo){
		logger.info("LoginServiceImpl.LoginCheck() 진입");
		return loginDAO.LoginCheck(mvo);
	}
}
