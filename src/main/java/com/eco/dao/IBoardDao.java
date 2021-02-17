package com.eco.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.eco.dto.BoardVO;
import com.eco.dto.MemberVO;
import com.eco.dto.Paging;

@Mapper
public interface IBoardDao {

	public List<BoardVO> boardList(String table,String orderName,int startNum, int endNum);
	public int getAllCount(String table);
	public void qnaInsert(BoardVO boardVo);
	public int mygetAllCount(String table, int useq);
	public List<BoardVO> myboardList(String table,String orderName,int startNum, int endNum, int useq);
	public void myQnaUpdate(int qseq, String title, String content);
	public void myQnaDelete(String useq);
	public List<BoardVO> myQnaUpdateForm (String qseq);
}
