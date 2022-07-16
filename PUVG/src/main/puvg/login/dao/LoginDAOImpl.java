package main.puvg.login.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import main.puvg.member.vo.MemberVO;

@Repository
public class LoginDAOImpl implements LoginDAO {
	Logger logger = LogManager.getLogger(LoginDAOImpl.class);
	
	@Autowired(required=false)
	private SqlSession sqlSession;
	
	public List<MemberVO> LoginCheck(MemberVO mvo){
		return sqlSession.selectList("LoginCheck", mvo);		
	}
}
