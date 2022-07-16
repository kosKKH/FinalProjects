package main.puvg.fileupload.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import main.puvg.fileupload.controller.FileuploadController;
import main.puvg.fileupload.vo.FileVO;

@Repository
public class FileuploadDAOImpl implements FileuploadDAO {
	
	Logger logger = LogManager.getLogger(FileuploadController.class);
	
	@Autowired(required=false)
	private SqlSession sqlSession;
	
	@Override
	public List<FileVO> fileuploadSelectALL(FileVO fvo) {
		logger.info("FileuploadDAOImpl.fileuploadSelectALL >>>>");
		return sqlSession.selectList("fileuploadSelectALL");
	}
	
	@Override
	public int fileuploadInsert(FileVO fvo) {
		logger.info("FileuploadDAOImpl.fileuploadInsert >>>>");
		return sqlSession.insert("fileuploadInsert", fvo);
	}

}
