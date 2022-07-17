package main.puvg.rpboard.vo;

public class RpBoardVO {
	private String vrpnum;
	private String vbnum;
	private String vname;
	private String vrpcontent;
	private String deleteyn;
	private String insertdate;
	
	public RpBoardVO() {
	
	}

	public RpBoardVO(String vrpnum, String vbnum, String vname, String vrpcontent, String deleteyn,
			String insertdate) {
		this.vrpnum = vrpnum;
		this.vbnum = vbnum;
		this.vname = vname;
		this.vrpcontent = vrpcontent;
		this.deleteyn = deleteyn;
		this.insertdate = insertdate;
	}

	public String getVrpnum() {
		return vrpnum;
	}

	public String getVbnum() {
		return vbnum;
	}

	public String getVname() {
		return vname;
	}

	public String getVrpcontent() {
		return vrpcontent;
	}

	public String getDeleteyn() {
		return deleteyn;
	}

	public String getInsertdate() {
		return insertdate;
	}

	public void setVrpnum(String vrpnum) {
		this.vrpnum = vrpnum;
	}

	public void setVbnum(String vbnum) {
		this.vbnum = vbnum;
	}

	public void setVname(String vname) {
		this.vname = vname;
	}

	public void setVrpcontent(String vrpcontent) {
		this.vrpcontent = vrpcontent;
	}

	public void setDeleteyn(String deleteyn) {
		this.deleteyn = deleteyn;
	}

	public void setInsertdate(String insertdate) {
		this.insertdate = insertdate;
	}
	
}
