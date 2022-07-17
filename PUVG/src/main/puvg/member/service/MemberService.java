package main.puvg.member.service;

import java.util.List;

import main.puvg.member.vo.MemberVO;

public interface MemberService {
	public List<MemberVO> MemberSelect(MemberVO mvo);
	public int MemberInsert(MemberVO mvo);
	public List<MemberVO> MemberSelectAll(MemberVO mvo);
	public int MemberUpdatepw(MemberVO mvo);
	public List<MemberVO> MemberSelectAdmin(MemberVO mvo);
	public int MemberUpdate(MemberVO mvo);
	public int MemberUpdateImg(MemberVO mvo);
	public List<MemberVO> MemberSelectWork(MemberVO mvo);
	public List<MemberVO> MemberSearch(MemberVO mvo);
	public List<MemberVO> MemberSearchData(MemberVO mvo);
	public List<MemberVO> NewMember(MemberVO mvo);
	public List<MemberVO> BirthMember(MemberVO mvo);
	public List<MemberVO> Mydept(MemberVO mvo);
	public List<MemberVO> MyInformation(MemberVO mvo);
}
