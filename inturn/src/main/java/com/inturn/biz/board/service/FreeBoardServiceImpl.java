package com.inturn.biz.board.service;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.inturn.biz.board.dao.FileDAO;
import com.inturn.biz.board.dao.FreeBoardDAO;
import com.inturn.biz.board.vo.FileGroupVO;
import com.inturn.biz.board.vo.FreeBoardVO;

@Service("FreeBoardService")
public class FreeBoardServiceImpl implements FreeBoardService{
	@Resource(name="FreeBoardDAO")
	FreeBoardDAO fb_dao;
	@Resource(name="FileDAO")
	FileDAO file_dao;
	
	@Override
	@Transactional(propagation=Propagation.REQUIRED)
	public int insertFreeBoard(FreeBoardVO vo) {
		int row = 0;
		int fileGroupNum = file_dao.findFileGroup(vo.getId());
		row += fb_dao.insertFreeBoard(vo);
		row += file_dao.insert_FB_files(new FileGroupVO(fileGroupNum,fb_dao.findBoard(vo)));
		row += file_dao.insertBoard(vo.getId());
		return row;
	}

	@Override
	public int modifyFreeBoard(FreeBoardVO vo) {
		return fb_dao.modifyFreeBoard(vo);
	}

	@Override
	public int deleteFreeBoard(int fb_num) {
		return fb_dao.deleteFreeBoard(fb_num);
	}

	@Override
	public int findBoard(FreeBoardVO vo) {
		return fb_dao.findBoard(vo);
	}

	@Override
	public HashMap<String,Object> boardList(int page_num) {
		// 전체 게시판 개수를 가져옴
		int total_boards = fb_dao.countBoards();
		// 게시판을 10개씩 페이징 처리했을 때, 총 몇개의 목록이 나오는지 계산
		int count_page = (total_boards + 9) / 10;
		// 마지막 페이지의 개수를 계산
		int reminder = total_boards % 10;
		// 클릭한 해당 페이지의 처음 번호와, 마지막번호를 계산
		int limit = (count_page - page_num)*10 + reminder;	// 마지막번호
		int offset = (count_page - (page_num + 1))*10 + reminder;	// 첫 번호
		if(offset < 0) offset = 0;	// 마지막 페이지일 경우 음수 값이 되므로 첫 번호를 0으로 만들어줌
		limit -= offset;	// 마지막과 첫 번호의 차를 구해 가져올 개수를 구함
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("offset", offset);
		map.put("limit", limit);
		// 결과값을 list에 넣는다.
		List<FreeBoardVO> list = fb_dao.boardList(map);
		// 총 페이지수가 몇개인지도 보내줘야 하므로 Map구조로 put해서 result를 return
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("list", list);
		result.put("count_page",count_page);
		return result;
	}

	@Override
	public int countBoards() {
		return fb_dao.countBoards();
	}
}
