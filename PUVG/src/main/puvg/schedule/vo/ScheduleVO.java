package main.puvg.schedule.vo;

public class ScheduleVO {
	
	private String vnum;
	private String vdept;
	private String vname;
	private String vscalendarnum;
	private String vsnum;
	private String vsname;
	private String vsstart;
	private String vsend;
	private String vsalarm;
	private String vsalarmtime;
	private String vsmemo;
	private String insertdate;
	private String updatedate;
	private String deleteyn;
	private String vspublic;
	private String vspublicmem;
	private String vsstatus;
	
	public ScheduleVO() {
	}

	public ScheduleVO(String vnum, String vname, String vdept, String vscalendarnum, String vsnum, String vsname, String vsstart,
			String vsend, String vsalarm, String vsalarmtime, String vsmemo, String insertdate, String updatedate,
			String deleteyn, String vspublic, String vspublicmem, String vsstatus) {
		this.vnum = vnum;
		this.vdept = vdept;
		this.vscalendarnum = vscalendarnum;
		this.vsnum = vsnum;
		this.vsname = vsname;
		this.vsstart = vsstart;
		this.vsend = vsend;
		this.vsalarm = vsalarm;
		this.vsalarmtime = vsalarmtime;
		this.vsmemo = vsmemo;
		this.insertdate = insertdate;
		this.updatedate = updatedate;
		this.deleteyn = deleteyn;
		this.vspublic = vspublic;
		this.vspublicmem = vspublicmem;
		this.vsstatus = vsstatus;
	}

	public String getVname() {
		return vname;
	}

	public void setVname(String vname) {
		this.vname = vname;
	}

	public String getVnum() {
		return vnum;
	}

	public void setVnum(String vnum) {
		this.vnum = vnum;
	}

	public String getVdept() {
		return vdept;
	}

	public void setVdept(String vdept) {
		this.vdept = vdept;
	}

	public String getVscalendarnum() {
		return vscalendarnum;
	}

	public void setVscalendarnum(String vscalendarnum) {
		this.vscalendarnum = vscalendarnum;
	}

	public String getVsnum() {
		return vsnum;
	}

	public void setVsnum(String vsnum) {
		this.vsnum = vsnum;
	}

	public String getVsname() {
		return vsname;
	}

	public void setVsname(String vsname) {
		this.vsname = vsname;
	}

	public String getVsstart() {
		return vsstart;
	}

	public void setVsstart(String vsstart) {
		this.vsstart = vsstart;
	}

	public String getVsend() {
		return vsend;
	}

	public void setVsend(String vsend) {
		this.vsend = vsend;
	}

	public String getVsalarm() {
		return vsalarm;
	}

	public void setVsalarm(String vsalarm) {
		this.vsalarm = vsalarm;
	}

	public String getVsalarmtime() {
		return vsalarmtime;
	}

	public void setVsalarmtime(String vsalarmtime) {
		this.vsalarmtime = vsalarmtime;
	}

	public String getVsmemo() {
		return vsmemo;
	}

	public void setVsmemo(String vsmemo) {
		this.vsmemo = vsmemo;
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

	public String getDeleteyn() {
		return deleteyn;
	}

	public void setDeleteyn(String deleteyn) {
		this.deleteyn = deleteyn;
	}

	public String getVspublic() {
		return vspublic;
	}

	public void setVspublic(String vspublic) {
		this.vspublic = vspublic;
	}

	public String getVspublicmem() {
		return vspublicmem;
	}

	public void setVspublicmem(String vspublicmem) {
		this.vspublicmem = vspublicmem;
	}

	public String getVsstatus() {
		return vsstatus;
	}

	public void setVsstatus(String vsstatus) {
		this.vsstatus = vsstatus;
	}
}
