package com.eco.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.eco.dto.ArtistVO;
import com.eco.dto.ChartVO;
import com.eco.dto.GenreVO;
import com.eco.dto.MemberVO;
import com.eco.dto.MusicVO;
import com.eco.dto.Paging;
import com.eco.dto.ThemeVO;

@Mapper
public interface IAdminDao {

	public String adminCheck(String adminId);
	public List<MusicVO> listMusic(Paging paging, String key);
	public int getAllCount(String tablename, String fieldname, String key);
	public List<MemberVO> listMember(Paging paging, String key);
	public MemberVO getMember(String useq);
	public List<ArtistVO> listArtist(Paging paging, String key);
	public List<ThemeVO> listTheme(Paging paging, String key);
	public void themeInsert(ThemeVO themevo);
	public void chartInsert(ChartVO chartvo);
	public List<ChartVO> listChart(Paging paging, String key);
	public void genreInsert(GenreVO genrevo);
	public List<GenreVO> listGenre(Paging paging, String key);
}
