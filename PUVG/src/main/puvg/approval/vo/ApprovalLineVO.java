package main.puvg.approval.vo;

public class ApprovalLineVO {
	
	private String vlinecode;
	private String vline1;
	private String vline2;
	private String vline3;
	
	public ApprovalLineVO() {
	}
	
	public ApprovalLineVO(String vlinecode, String vline1, String vline2, String vline3) {
		this.vlinecode = vlinecode;
		this.vline1 = vline1;
		this.vline2 = vline2;
		this.vline3 = vline3;
	}
	
	public String getVlinecode() {
		return vlinecode;
	}
	public void setVlinecode(String vlinecode) {
		this.vlinecode = vlinecode;
	}
	public String getVline1() {
		return vline1;
	}
	public void setVline1(String vline1) {
		this.vline1 = vline1;
	}
	public String getVline2() {
		return vline2;
	}
	public void setVline2(String vline2) {
		this.vline2 = vline2;
	}
	public String getVline3() {
		return vline3;
	}
	public void setVline3(String vline3) {
		this.vline3 = vline3;
	}

}