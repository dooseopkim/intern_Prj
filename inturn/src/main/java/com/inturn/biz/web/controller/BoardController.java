package com.inturn.biz.web.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.inturn.biz.board.service.FileService;
import com.inturn.biz.board.service.FreeBoardService;
import com.inturn.biz.board.vo.FilesVO;
import com.inturn.biz.users.vo.UserVO;
import com.inturn.biz.web.common.SHA256;

/**
 * 
 * @author 박현호
 * @version 1.0
 * @since 2018.05.14
 * @see 게시판 관련 메소드 Controller
 */
@Controller
public class BoardController {
	@Resource(name = "FreeBoardService")
	FreeBoardService fb_service;
	@Resource(name = "FileService")
	FileService file_service;

	/**
	 * @return 자유게시판 페이지 이동 설정
	 */
	@RequestMapping(value = "/freeBoard.do", method = RequestMethod.GET)
	public String freeBoardDo() {
		return "index.jsp?content=board/freeBoard";
	}

	/**
	 * @return 게시판 입력 페이지 이동 설정
	 */
	@RequestMapping(value = "/insertBoard.do", method = RequestMethod.GET)
	public String insertBoard() {
		return "index.jsp?content=board/insertBoard";
	}

	@RequestMapping(value = "/insertBoard.do", method = RequestMethod.POST)
	public String insertBoard(String editor) {
		System.out.println("저장할 내용" + editor);
		return "redirect:freeBoard.do";
	}

	// 서버에 파일저장
	public int saveFile(InputStream is, OutputStream os, HttpServletRequest request, String filePath, String fileName) {
		int fileSize = 0;
		try {
			File file = new File(filePath);
			if (!file.exists()) {
				file.mkdirs();
			}
			is = request.getInputStream();
			os = new FileOutputStream(filePath + fileName);
			int numRead;
			byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
			while ((numRead = is.read(b, 0, b.length)) != -1) {
				fileSize += numRead;
				os.write(b, 0, numRead);
			}
			os.flush();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (is != null)
					is.close();
				if (os != null)
					os.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return fileSize;
	}

	// Error났을 시, 이미지 url
	public void fileError(String realFilePath, String sFileInfo, String filename) {
		File deleteFile = new File(realFilePath);
		deleteFile.delete();
		// 정보 출력
		sFileInfo += "&bNewLine=true";
		// img 태그의 title 속성을 원본파일명으로 적용시켜주기 위함
		sFileInfo += "&sFileName=" + filename;
		sFileInfo += "&sFileURL=" + "/resources/editor/multiupload/" + "error.jpg";
	}

	@RequestMapping("/multiFileUploader.do")
	public void file_uploader(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		InputStream is = null;
		OutputStream os = null;
		try {
			// 파일정보
			String sFileInfo = "";
			// 파일명을 받는다 - 일반 원본파일명
			String fileName = request.getHeader("file-name");
			System.out.println(fileName);
			String temp[] = fileName.split("%23%23%23");
			fileName = temp[0];
			String hashValue = temp[1];
			System.out.println("javascript hash : " + hashValue);

			// 파일 기본경로
			String dftFilePath = request.getSession().getServletContext().getRealPath("/");
			// 파일 기본경로 _ 상세경로
			String filePath = dftFilePath + "resources" + File.separator + "editor" + File.separator + "multiupload"
					+ File.separator;
			String realFilePath = filePath + fileName;
			// 서버에 파일 저장
			int fileSize = saveFile(is, os, request, filePath, fileName);
			// 무결성 검증
			SHA256 hash = new SHA256();
			String checkHashValue = hash.sha256(realFilePath);
			System.out.println("java hash : " + checkHashValue);
			if (checkHashValue.equals(hashValue)) {
				UserVO login = (UserVO) session.getAttribute("login");
				String flag = login.getId();
				FilesVO insertFile = new FilesVO(filePath, fileName, fileSize, hashValue);
				int row = file_service.insertFiles(flag, insertFile);
				if (row == 0)
					fileError(realFilePath, sFileInfo, fileName);
				else {
					insertFile.setFileGroupNum(file_service.findFileGroup(flag));
					int saveFileNum = file_service.findFile(insertFile);
					if (saveFileNum == 0)
						fileError(realFilePath, sFileInfo, fileName);
					else {
						// 파일 확장자
						String filename_ext = fileName.substring(fileName.lastIndexOf(".") + 1);
						// 확장자를소문자로 변경
						filename_ext = filename_ext.toLowerCase();
						String saveFileName = Integer.toString(saveFileNum) + "." + filename_ext;
						File tempFile = new File(realFilePath);
						File saveFile = new File(filePath + saveFileName);
						if(tempFile.exists()) {
							tempFile.renameTo(saveFile);
							tempFile.delete();
							// 정보 출력
							sFileInfo += "&bNewLine=true";
							// img 태그의 title 속성을 원본파일명으로 적용시켜주기 위함
							sFileInfo += "&sFileName=" + fileName;
							sFileInfo += "&sFileURL=" + "/resources/editor/multiupload/" + saveFileName;
						} else
							fileError(realFilePath, sFileInfo, fileName);
					}
				}
			} else
				fileError(realFilePath, sFileInfo, fileName);
			System.out.println("file 경로 : " + realFilePath);
			PrintWriter print = response.getWriter();
			print.print(sFileInfo);
			print.flush();
			print.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
