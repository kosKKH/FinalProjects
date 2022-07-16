package main.puvg.fileupload.service;

import java.util.List;

import main.puvg.fileupload.vo.FileVO;

public interface FileuploadService {
	
	public List<FileVO> fileuploadSelectALL(FileVO fvo);
	public int fileuploadInsert(FileVO fvo);

}
