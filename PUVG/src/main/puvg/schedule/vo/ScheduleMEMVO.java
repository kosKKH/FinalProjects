package main.puvg.schedule.vo;

public class ScheduleMEMVO {
	
	private String vnum;
	private String vdept;
	private String vname;



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

	public String getVname() {
		return vname;
	}

	public void setVname(String vname) {
		this.vname = vname;
	}

	public ScheduleMEMVO() {
	}
	
	public ScheduleMEMVO(String vnum, String vdept, String vname) {
		this.vnum = vnum;
		this.vdept = vdept;
		this.vname = vname;
	}
}