package main.puvg.approval.vo;

public class Appr4DocVO {
	
	private String vdocnum;
	private String vdept;
	private String vnum;
	private String vname;
	private String vsubj;
	private String vlinecode;
	private String vprojectname;
	private String vprojectsubj;
	private String vline;
	private String vfile;
	private String deleteyn;
	private String insertdate;
	private String updatedate;
	
	public Appr4DocVO() {
	}
	
	public Appr4DocVO(String vdocnum, String vdept, String vnum, String vname, String vsubj, String vlinecode,
			String vprojectname, String vprojectsubj, String vline, String vfile, String deleteyn, String insertdate,
			String updatedate) {
		super();
		this.vdocnum = vdocnum;
		this.vdept = vdept;
		this.vnum = vnum;
		this.vname = vname;
		this.vsubj = vsubj;
		this.vlinecode = vlinecode;
		this.vprojectname = vprojectname;
		this.vprojectsubj = vprojectsubj;
		this.vline = vline;
		this.vfile = vfile;
		this.deleteyn = deleteyn;
		this.insertdate = insertdate;
		this.updatedate = updatedate;
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
	public String getVlinecode() {
		return vlinecode;
	}
	public void setVlinecode(String vlinecode) {
		this.vlinecode = vlinecode;
	}
	public String getVprojectname() {
		return vprojectname;
	}
	public void setVprojectname(String vprojectname) {
		this.vprojectname = vprojectname;
	}
	public String getVprojectsubj() {
		return vprojectsubj;
	}
	public void setVprojectsubj(String vprojectsubj) {
		this.vprojectsubj = vprojectsubj;
	}
	public String getVline() {
		return vline;
	}
	public void setVline(String vline) {
		this.vline = vline;
	}
	public String getVfile() {
		return vfile;
	}
	public void setVfile(String vfile) {
		this.vfile = vfile;
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