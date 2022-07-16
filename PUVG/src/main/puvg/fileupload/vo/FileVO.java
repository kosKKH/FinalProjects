package main.puvg.fileupload.vo;

import org.springframework.web.multipart.MultipartFile;

public class FileVO {
	
	private String message;
	private String filename; // 저장파일명
	private MultipartFile multifile; //첨부파일
	
	public FileVO() {
	}

	public FileVO(String message, String filename) {
		this.message = message;
		this.filename = filename;
		this.multifile = multifile;
	}

	public MultipartFile getMultifile() {
		return multifile;
	}

	public void setMultifile(MultipartFile multifile) {
		this.multifile = multifile;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}
	
	

}
