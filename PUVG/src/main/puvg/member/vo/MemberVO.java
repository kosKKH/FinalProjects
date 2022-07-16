package main.puvg.member.vo;

import org.springframework.web.multipart.MultipartFile;

public class MemberVO {
	private String vnum;
	private String vname;
	private String vemail;
	private String vemail2;
	private String vpw;
	private String vaddr;
	private String vaddr2;
	private String vph;
	private String vdept;
	private String vrank;
	private String vbirth;
	private String vhiredate;
	private String vdeleteyn;
	private String vimg;
	private int vauthority;
	private MultipartFile vfile;
	
	private String nowpage;
	private String totalcount;
	
	private String searchdept;
	private String searchrank;
	
	public MemberVO() {
	}

	public MemberVO(String vnum, String vname, String vemail, String vemail2, String vpw, String vaddr, String vaddr2,
			String vph, String vdept, String vrank, String vbirth, String vhiredate, String vdeleteyn, String vimg,
			int vauthority, MultipartFile vfile, String nowpage, String totalcount, String searchdept,
			String searchrank) {
		super();
		this.vnum = vnum;
		this.vname = vname;
		this.vemail = vemail;
		this.vemail2 = vemail2;
		this.vpw = vpw;
		this.vaddr = vaddr;
		this.vaddr2 = vaddr2;
		this.vph = vph;
		this.vdept = vdept;
		this.vrank = vrank;
		this.vbirth = vbirth;
		this.vhiredate = vhiredate;
		this.vdeleteyn = vdeleteyn;
		this.vimg = vimg;
		this.vauthority = vauthority;
		this.vfile = vfile;
		this.nowpage = nowpage;
		this.totalcount = totalcount;
		this.searchdept = searchdept;
		this.searchrank = searchrank;
	}

	public String getVnum() {
		return vnum;
	}

	public void setVnum(String vnum) {
		this.vnum = vnum;
	}

	public String getVname() {
		return vname;
	}

	public void setVname(String vname) {
		this.vname = vname;
	}

	public String getVemail() {
		return vemail;
	}

	public void setVemail(String vemail) {
		this.vemail = vemail;
	}

	public String getVemail2() {
		return vemail2;
	}

	public void setVemail2(String vemail2) {
		this.vemail2 = vemail2;
	}

	public String getVpw() {
		return vpw;
	}

	public void setVpw(String vpw) {
		this.vpw = vpw;
	}

	public String getVaddr() {
		return vaddr;
	}

	public void setVaddr(String vaddr) {
		this.vaddr = vaddr;
	}

	public String getVaddr2() {
		return vaddr2;
	}

	public void setVaddr2(String vaddr2) {
		this.vaddr2 = vaddr2;
	}

	public String getVph() {
		return vph;
	}

	public void setVph(String vph) {
		this.vph = vph;
	}

	public String getVdept() {
		return vdept;
	}

	public void setVdept(String vdept) {
		this.vdept = vdept;
	}

	public String getVrank() {
		return vrank;
	}

	public void setVrank(String vrank) {
		this.vrank = vrank;
	}

	public String getVbirth() {
		return vbirth;
	}

	public void setVbirth(String vbirth) {
		this.vbirth = vbirth;
	}

	public String getVhiredate() {
		return vhiredate;
	}

	public void setVhiredate(String vhiredate) {
		this.vhiredate = vhiredate;
	}

	public String getVdeleteyn() {
		return vdeleteyn;
	}

	public void setVdeleteyn(String vdeleteyn) {
		this.vdeleteyn = vdeleteyn;
	}

	public String getVimg() {
		return vimg;
	}

	public void setVimg(String vimg) {
		this.vimg = vimg;
	}

	public int getVauthority() {
		return vauthority;
	}

	public void setVauthority(int vauthority) {
		this.vauthority = vauthority;
	}

	public MultipartFile getVfile() {
		return vfile;
	}

	public void setVfile(MultipartFile vfile) {
		this.vfile = vfile;
	}

	public String getNowpage() {
		return nowpage;
	}

	public void setNowpage(String nowpage) {
		this.nowpage = nowpage;
	}

	public String getTotalcount() {
		return totalcount;
	}

	public void setTotalcount(String totalcount) {
		this.totalcount = totalcount;
	}

	public String getSearchdept() {
		return searchdept;
	}

	public void setSearchdept(String searchdept) {
		this.searchdept = searchdept;
	}

	public String getSearchrank() {
		return searchrank;
	}

	public void setSearchrank(String searchrank) {
		this.searchrank = searchrank;
	}

	
}
