package main.puvg.chart.vo;

public class MemberChartVO {
	
	//부서
	private String affairs;			//총무부
	private String personnel;		//인사부
	private String sales;			//영업부
	private String management;		//경영지원부
	private String technical;		//기술지원부
	private String develop;			//기술개발부
	private String planning;		//연구기획부
	private String production;		//생산관리부
	private String quality;			//품질관리부
	private String international;	//해외사업부

	//직급
	private String president;		//사장
	private String director;		//이사
	private String department;		//부장
	private String manager;			//과장
	private String engineer;		//대리
	private String assistant;		//주임
	private String clerk;			//사원
	
	//근무상태
	private String working;			//근무
	private String dispatch;		//파견
	private String rest;			//휴직
	private String leave;			//퇴사

	public MemberChartVO() {
	}

	
	public MemberChartVO(String affairs, String personnel, String sales, String management, String technical,
			String develop, String planning, String production, String quality, String international, String president,
			String director, String department, String manager, String engineer, String assistant, String clerk,
			String working, String dispatch, String rest, String leave) {
		this.affairs = affairs;
		this.personnel = personnel;
		this.sales = sales;
		this.management = management;
		this.technical = technical;
		this.develop = develop;
		this.planning = planning;
		this.production = production;
		this.quality = quality;
		this.international = international;
		this.president = president;
		this.director = director;
		this.department = department;
		this.manager = manager;
		this.engineer = engineer;
		this.assistant = assistant;
		this.clerk = clerk;
		this.working = working;
		this.dispatch = dispatch;
		this.rest = rest;
		this.leave = leave;
	}


	public String getAffairs() {
		return affairs;
	}

	public void setAffairs(String affairs) {
		this.affairs = affairs;
	}

	public String getPersonnel() {
		return personnel;
	}

	public void setPersonnel(String personnel) {
		this.personnel = personnel;
	}

	public String getSales() {
		return sales;
	}

	public void setSales(String sales) {
		this.sales = sales;
	}

	public String getManagement() {
		return management;
	}

	public void setManagement(String management) {
		this.management = management;
	}

	public String getTechnical() {
		return technical;
	}

	public void setTechnical(String technical) {
		this.technical = technical;
	}

	public String getDevelop() {
		return develop;
	}

	public void setDevelop(String develop) {
		this.develop = develop;
	}

	public String getPlanning() {
		return planning;
	}

	public void setPlanning(String planning) {
		this.planning = planning;
	}

	public String getProduction() {
		return production;
	}

	public void setProduction(String production) {
		this.production = production;
	}

	public String getQuality() {
		return quality;
	}

	public void setQuality(String quality) {
		this.quality = quality;
	}

	public String getInternational() {
		return international;
	}

	public void setInternational(String international) {
		this.international = international;
	}

	public String getPresident() {
		return president;
	}

	public void setPresident(String president) {
		this.president = president;
	}

	public String getDirector() {
		return director;
	}

	public void setDirector(String director) {
		this.director = director;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public String getManager() {
		return manager;
	}

	public void setManager(String manager) {
		this.manager = manager;
	}

	public String getEngineer() {
		return engineer;
	}

	public void setEngineer(String engineer) {
		this.engineer = engineer;
	}

	public String getAssistant() {
		return assistant;
	}

	public void setAssistant(String assistant) {
		this.assistant = assistant;
	}

	public String getClerk() {
		return clerk;
	}

	public void setClerk(String clerk) {
		this.clerk = clerk;
	}


	public String getWorking() {
		return working;
	}


	public void setWorking(String working) {
		this.working = working;
	}


	public String getDispatch() {
		return dispatch;
	}


	public void setDispatch(String dispatch) {
		this.dispatch = dispatch;
	}


	public String getRest() {
		return rest;
	}


	public void setRest(String rest) {
		this.rest = rest;
	}


	public String getLeave() {
		return leave;
	}


	public void setLeave(String leave) {
		this.leave = leave;
	}
	
	
	
}