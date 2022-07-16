package main.puvg.fileupload.dao;

import java.util.List;

import main.puvg.fileupload.vo.FileVO;

public interface FileuploadDAO {
	
	public List<FileVO> fileuploadSelectALL(FileVO fvo);
	public int fileuploadInsert(FileVO fvo);

}
