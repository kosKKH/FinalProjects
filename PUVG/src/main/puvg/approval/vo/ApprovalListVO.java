package main.puvg.approval.vo;

public class ApprovalListVO {
	
	private String vsubnum;
	private String vdocnum;
	private String vsubject;
	private String vnum;
	private String vname;
	private String vlinecode;
	private String deleteyn;
	private String insertdate;
	private String updatedate;
	
	public ApprovalListVO() {
	}
	
	public ApprovalListVO(String vsubnum, String vdocnum, String vsubject, String vnum, String vname, String vlinecode,
			String deleteyn, String insertdate, String updatedate) {
		this.vsubnum = vsubnum;
		this.vdocnum = vdocnum;
		this.vsubject = vsubject;
		this.vnum = vnum;
		this.vname = vname;
		this.vlinecode = vlinecode;
		this.deleteyn = deleteyn;
		this.insertdate = insertdate;
		this.updatedate = updatedate;
	}
	
	public String getVsubnum() {
		return vsubnum;
	}
	public void setVsubnum(String vsubnum) {
		this.vsubnum = vsubnum;
	}
	public String getVdocnum() {
		return vdocnum;
	}
	public void setVdocnum(String vdocnum) {
		this.vdocnum = vdocnum;
	}
	public String getVsubject() {
		return vsubject;
	}
	public void setVsubject(String vsubject) {
		this.vsubject = vsubject;
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
	public String getVlinecode() {
		return vlinecode;
	}
	public void setVlinecode(String vlinecode) {
		this.vlinecode = vlinecode;
	}
	public String getDeleteyn() {
		return deleteyn;
	}
	public void setDeleteyn(String deleteyn) {
		this.deleteyn = deleteyn;
	}
	public String getInsertdate() {
		return insertdate;
	}
	public void setInsertdate(String insertdate) {
		this.insertdate = insertdate;
	}
	public String getUpdatedate() {
		return updatedate;
	}
	public void setUpdatedate(String updatedate) {
		this.updatedate = updatedate;
	} 

}