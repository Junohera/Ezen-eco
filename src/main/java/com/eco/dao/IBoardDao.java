package com.eco.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.eco.dto.BoardVO;
import com.eco.dto.MemberVO;
import com.eco.dto.Paging;

@Mapper
public interface IBoardDao {

	public List<BoardVO> noticeList(Paging paging);
	public int getAllCount();
}
