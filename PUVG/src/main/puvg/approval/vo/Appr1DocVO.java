package main.puvg.approval.vo;

public class Appr1DocVO {
	
	private String vdocnum;
	private String vdept;
	private String vnum;
	private String vname;
	private String vsubj;
	private String vlinecode;
	private String vtype;
	private String vstart;
	private String vend;
	private String vdate;
	private String vleft;
	private String vline;
	private String vfile;
	private String vcheck;
	private String deleteyn;
	private String insertdate;
	private String updatedate;
	
	public Appr1DocVO() {
	}
	
	public Appr1DocVO(String vdocnum, String vdept, String vnum, String vname, String vsubj, String vlinecode,
			String vtype, String vstart, String vend, String vdate, String vleft, String vline, String vfile,
			String deleteyn, String insertdate, String updatedate, String vcheck) {
		this.vdocnum = vdocnum;
		this.vdept = vdept;
		this.vnum = vnum;
		this.vname = vname;
		this.vsubj = vsubj;
		this.vlinecode = vlinecode;
		this.vtype = vtype;
		this.vstart = vstart;
		this.vend = vend;
		this.vdate = vdate;
		this.vleft = vleft;
		this.vline = vline;
		this.vfile = vfile;
		this.vcheck = vcheck;
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
	public String getVtype() {
		return vtype;
	}
	public void setVtype(String vtype) {
		this.vtype = vtype;
	}
	public String getVstart() {
		return vstart;
	}
	public void setVstart(String vstart) {
		this.vstart = vstart;
	}
	public String getVend() {
		return vend;
	}
	public void setVend(String vend) {
		this.vend = vend;
	}
	public String getVdate() {
		return vdate;
	}
	public void setVdate(String vdate) {
		this.vdate = vdate;
	}
	public String getVleft() {
		return vleft;
	}
	public void setVleft(String vleft) {
		this.vleft = vleft;
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

	public String getVcheck() {
		return vcheck;
	}

	public void setVcheck(String vcheck) {
		this.vcheck = vcheck;
	}
	
	
}