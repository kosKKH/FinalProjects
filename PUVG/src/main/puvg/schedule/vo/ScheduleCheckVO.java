package main.puvg.schedule.vo;

public class ScheduleCheckVO {
	
	private String checkstatus;
	private String checkdate;
	
	public ScheduleCheckVO() {
	}

	public ScheduleCheckVO(String checkstatus, String checkdate) {
		this.checkstatus = checkstatus;
		this.checkdate = checkdate;
	}

	public String getCheckstatus() {
		return checkstatus;
	}

	public void setCheckstatus(String checkstatus) {
		this.checkstatus = checkstatus;
	}

	public String getCheckdate() {
		return checkdate;
	}

	public void setCheckdate(String checkdate) {
		this.checkdate = checkdate;
	}
	
	
}
