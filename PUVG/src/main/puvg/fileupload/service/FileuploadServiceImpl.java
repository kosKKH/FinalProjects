package main.puvg.fileupload.service;

import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import main.puvg.fileupload.controller.FileuploadController;
import main.puvg.fileupload.dao.FileuploadDAO;
import main.puvg.fileupload.vo.FileVO;

@Service
@Transactional
public class FileuploadServiceImpl implements FileuploadService {
	
	Logger logger = LogManager.getLogger(FileuploadController.class);
	
	@Autowired(required=false)
	private FileuploadDAO fileuploadDAO;

	@Override
	public List<FileVO> fileuploadSelectALL(FileVO fvo) {
		logger.info("FileuploadServiceImpl.fileuploadSelectALL >>>>");
		return fileuploadDAO.fileuploadSelectALL(fvo);
	}

	@Override
	public int fileuploadInsert(FileVO fvo) {
		logger.info("FileuploadServiceImpl.fileuploadInsert >>>>");
		return fileuploadDAO.fileuploadInsert(fvo);
	}

}
