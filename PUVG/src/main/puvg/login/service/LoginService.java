package main.puvg.login.service;

import java.util.List;

import main.puvg.member.vo.MemberVO;

public interface LoginService {
	public List<MemberVO> LoginCheck(MemberVO mvo);
}
