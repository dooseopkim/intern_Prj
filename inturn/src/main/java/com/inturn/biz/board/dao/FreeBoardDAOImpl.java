package com.inturn.biz.board.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.inturn.biz.board.vo.FreeBoardVO;

@Repository("FreeBoardDAO")
public class FreeBoardDAOImpl implements FreeBoardDAO{
	@Autowired
	SqlSessionTemplate mybatis;

	@Override
	public int insertFreeBoard(FreeBoardVO vo) {
		return mybatis.insert("FreeBoardMapper.insertFreeBoard", vo);
	}

	@Override
	public int modifyFreeBoard(FreeBoardVO vo) {
		return mybatis.update("FreeBoardMapper.modifyFreeBoard", vo);
	}

	@Override
	public int deleteFreeBoard(int fb_num) {
		return mybatis.delete("FreeBoardMapper.deleteFreeBoard", fb_num);
	}

	@Override
	public int findBoard(FreeBoardVO vo) {
		return mybatis.selectOne("FreeBoardMapper.findBoard", vo);
	}

	@Override
	public List<FreeBoardVO> boardList(HashMap<String, Integer> map) {
		return mybatis.selectList("FreeBoardMapper.boardList", map);
	}

	@Override
	public int countBoards() {
		return mybatis.selectOne("FreeBoardMapper.countBoards");
	}
}
