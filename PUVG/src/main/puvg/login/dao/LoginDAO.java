package main.puvg.login.dao;

import java.util.List;

import main.puvg.member.vo.MemberVO;

public interface LoginDAO {
	public List<MemberVO> LoginCheck(MemberVO mvo);
}
