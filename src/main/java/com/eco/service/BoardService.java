package com.eco.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.eco.dao.IBoardDao;
import com.eco.dto.BoardVO;
import com.eco.dto.MemberVO;
import com.eco.dto.MusicVO;
import com.eco.dto.Paging;

@Service
public class BoardService {

	@Autowired
	IBoardDao bdao;

	public List<BoardVO> boardList(String table,String orderName,int startNum, int endNum) {
		return bdao.boardList(table, orderName, startNum, endNum);
	}
	public List<BoardVO> boardListSearch(String table,String orderName, String keyward, int startNum, int endNum ) {
		System.out.println(table + ", " + orderName + ", " + keyward + ", " + startNum + ", " + endNum + ", 끗 ");
		return bdao.boardListSearch(table, orderName, keyward, startNum, endNum);
	}
	
	public void qnaInsert(BoardVO boardVo) {
		bdao.qnaInsert(boardVo);
	}
	public List<BoardVO> myboardList(String table,String orderName,int startNum, int endNum, int useq) {
		return bdao.myboardList(table, orderName, startNum, endNum, useq);
	}
	public BoardVO myQnaUpdateForm (String qseq) {
		return bdao.myQnaUpdateForm(qseq);
	}
	
	public void myQnaUpdate(BoardVO bvoList) {
		bdao.myQnaUpdate(bvoList);
	}

	public void myQnaDelete(String useq) {
		bdao.myQnaDelete(useq);
	}
	
	public BoardVO updateForm(String table, String field, String key) {
		return bdao.updateForm(table, field, key);
	}
	
	public void boardDelete(String table, String field, String key) {
		bdao.boardDelete(table, field, key);
	}
	public List<MusicVO> searchSite(String table, String selected, String keyward) {
		return bdao.searchSite(table, selected, keyward);
	}
	
}
