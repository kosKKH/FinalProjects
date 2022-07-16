package main.puvg.board_like.vo;

public class BoardLikeVO {

	
	public String vblnum;
	public String vmnum;
	public String vbnum;
	public String vblike_cnt_1;
	public String vblike_cnt_2;
	private String deleteyn;
	private String insertdate;
	private String updatedate;
	
	public BoardLikeVO() {
	}

	public BoardLikeVO(String vblnum, String vmnum, String vbnum, String vblike_cnt_1, String vblike_cnt_2,
			String deleteyn, String insertdate, String updatedate) {
		this.vblnum = vblnum;
		this.vmnum = vmnum;
		this.vbnum = vbnum;
		this.vblike_cnt_1 = vblike_cnt_1;
		this.vblike_cnt_2 = vblike_cnt_2;
		this.deleteyn = deleteyn;
		this.insertdate = insertdate;
		this.updatedate = updatedate;
	}

	public String getVblnum() {
		return vblnum;
	}

	public String getVmnum() {
		return vmnum;
	}

	public String getVbnum() {
		return vbnum;
	}

	public String getVblike_cnt_1() {
		return vblike_cnt_1;
	}

	public String getVblike_cnt_2() {
		return vblike_cnt_2;
	}

	public String getDeleteyn() {
		return deleteyn;
	}

	public String getInsertdate() {
		return insertdate;
	}

	public String getUpdatedate() {
		return updatedate;
	}

	public void setVblnum(String vblnum) {
		this.vblnum = vblnum;
	}

	public void setVmnum(String vmnum) {
		this.vmnum = vmnum;
	}

	public void setVbnum(String vbnum) {
		this.vbnum = vbnum;
	}

	public void setVblike_cnt_1(String vblike_cnt_1) {
		this.vblike_cnt_1 = vblike_cnt_1;
	}

	public void setVblike_cnt_2(String vblike_cnt_2) {
		this.vblike_cnt_2 = vblike_cnt_2;
	}

	public void setDeleteyn(String deleteyn) {
		this.deleteyn = deleteyn;
	}

	public void setInsertdate(String insertdate) {
		this.insertdate = insertdate;
	}

	public void setUpdatedate(String updatedate) {
		this.updatedate = updatedate;
	}

	

}
