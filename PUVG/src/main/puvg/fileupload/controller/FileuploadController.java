package main.puvg.fileupload.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import main.puvg.fileupload.service.FileuploadService;
import main.puvg.fileupload.vo.FileVO;
import main.puvg.util.FileUploadUtil;

@Controller
public class FileuploadController {
	
	Logger logger = LogManager.getLogger(FileuploadController.class);
	
	@Autowired(required=false)
	private FileuploadService fileuploadService;
	
	// �Է������� �Ѿ��
	@GetMapping(value="testMove")
	public String flieUploadTest() {
		logger.info("FileuploadController.flieUploadTest >>>>");
		System.out.println("FileuploadController.flieUploadTest >>>>");
		return "fileupload/fileUploadForm";
	}
	
	// ��ü��ȸ�ϱ�
	@GetMapping(value="fileuploadSelectAll")
	public String flieUploadSelectAll(FileVO fvo, Model model) {
		logger.info("FileuploadController.flieUploadSelectAll >>>>");
		
		List<FileVO> selectAll = fileuploadService.fileuploadSelectALL(fvo);
		int nCNt = selectAll.size();
		logger.info("nCNt : " + nCNt);
		
		if(nCNt>0) {
			model.addAttribute("selectAll", selectAll);
			return "fileupload/fileSelectAll";
		}
		return "fileupload/error";
	}
	
	// �Է��ϱ�
	@PostMapping(value="fileuploadInsert")
	public String fileuploadInsert(FileVO fvo, HttpServletRequest request) throws IllegalStateException, IOException {
		logger.info("FileuploadController.fileuploadInsert >>>>");
		
		String message = fvo.getMessage();
		logger.info("message : " + message);
		String filename = FileUploadUtil.fileUpload(fvo.getMultifile(), request);
		logger.info("filename : " + filename);
		fvo.setFilename(filename);
		
		int nCnt = fileuploadService.fileuploadInsert(fvo);
		if(nCnt==1) {
			return "fileupload/fileuploadInsert";
		}
		return "fileupload/error";
	}

}
