package main.puvg.board_booseo.vo;

import org.springframework.web.multipart.MultipartFile;

public class BoardVO {

	
    private String vbnum;
	private String vname;
	private String vbsubject;
	private String vbcontent;
	private String vdate;
	private String deleteyn;
	private String insertdate;
	private String updatedate;
	
	//���� ���ε带 ���� �Ӽ�
	private MultipartFile file; 
	private String vfile;
	
	//	����¡
	private String pageSize;
	private String groupSize;
	private String curPage;
	private String totalCount;

public BoardVO() {
	
}

public BoardVO(String vbnum, String vname, String vbsubject, String vbcontent, String vdate, String deleteyn,
		String insertdate, String updatedate, MultipartFile file, String vfile, String pageSize, String groupSize,
		String curPage, String totalCount) {
	super();
	this.vbnum = vbnum;
	this.vname = vname;
	this.vbsubject = vbsubject;
	this.vbcontent = vbcontent;
	this.vdate = vdate;
	this.deleteyn = deleteyn;
	this.insertdate = insertdate;
	this.updatedate = updatedate;
	this.file = file;
	this.vfile = vfile;
	this.pageSize = pageSize;
	this.groupSize = groupSize;
	this.curPage = curPage;
	this.totalCount = totalCount;
}

public String getVbnum() {
	return vbnum;
}

public String getVname() {
	return vname;
}

public String getVbsubject() {
	return vbsubject;
}

public String getVbcontent() {
	return vbcontent;
}

public String getVdate() {
	return vdate;
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

public MultipartFile getFile() {
	return file;
}

public String getVfile() {
	return vfile;
}

public String getPageSize() {
	return pageSize;
}

public String getGroupSize() {
	return groupSize;
}

public String getCurPage() {
	return curPage;
}

public String getTotalCount() {
	return totalCount;
}

public void setVbnum(String vbnum) {
	this.vbnum = vbnum;
}

public void setVname(String vname) {
	this.vname = vname;
}

public void setVbsubject(String vbsubject) {
	this.vbsubject = vbsubject;
}

public void setVbcontent(String vbcontent) {
	this.vbcontent = vbcontent;
}

public void setVdate(String vdate) {
	this.vdate = vdate;
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

public void setFile(MultipartFile file) {
	this.file = file;
}

public void setVfile(String vfile) {
	this.vfile = vfile;
}

public void setPageSize(String pageSize) {
	this.pageSize = pageSize;
}

public void setGroupSize(String groupSize) {
	this.groupSize = groupSize;
}

public void setCurPage(String curPage) {
	this.curPage = curPage;
}

public void setTotalCount(String totalCount) {
	this.totalCount = totalCount;
}




}