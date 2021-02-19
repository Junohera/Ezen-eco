package com.eco.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.eco.dto.BoardVO;
import com.eco.dto.MemberVO;
import com.eco.dto.Paging;

@Mapper
public interface IBoardDao {

	public List<BoardVO> boardList(String table,String orderName,int startNum, int endNum);
	public void qnaInsert(BoardVO boardVo);
	public List<BoardVO> myboardList(String table,String orderName,int startNum, int endNum, int useq);
	public void myQnaUpdate(BoardVO bvoList);
	public void myQnaDelete(String useq);
	public BoardVO myQnaUpdateForm (String qseq);
}
