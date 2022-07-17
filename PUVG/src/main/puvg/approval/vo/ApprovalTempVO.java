package main.puvg.approval.vo;

public class ApprovalTempVO {
	
	private String vsubnum;
	private String vdocnum;
	private String vdept;
	private String vnum;
	private String vname;
	private String vsubj;
	private String deleteyn;
	private String insertdate;
	private String updatedate;
	
	public ApprovalTempVO() {
	}
	
	public ApprovalTempVO(String vsubnum, String vdocnum, String vdept, String vnum, String vname, String vsubj,
			String deleteyn, String insertdate, String updatedate) {
		this.vsubnum = vsubnum;
		this.vdocnum = vdocnum;
		this.vdept = vdept;
		this.vnum = vnum;
		this.vname = vname;
		this.vsubj = vsubj;
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
	public String getVdept() {
		return vdept;
	}
	public void setVdept(String vdept) {
		this.vdept = vdept;
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
	public String getVsubj() {
		return vsubj;
	}
	public void setVsubj(String vsubj) {
		this.vsubj = vsubj;
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