package com.eco.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eco.dao.IBoardDao;
import com.eco.dto.BoardVO;
import com.eco.dto.MemberVO;
import com.eco.dto.Paging;

@Service
public class BoardService {

	@Autowired
	IBoardDao bdao;
	
	public List<BoardVO> noticeList(Paging paging) {
		return bdao.noticeList(paging);
	}
	
	public int getAllCount() {
		int count = bdao.getAllCount();
		return count;
	}
}
