package com.eco.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eco.dao.IAdminDao;
import com.eco.dto.ArtistVO;
import com.eco.dto.ChartVO;
import com.eco.dto.GenreVO;
import com.eco.dto.MemberVO;
import com.eco.dto.MusicVO;
import com.eco.dto.Paging;
import com.eco.dto.ThemeVO;

@Service
public class AdminService {

	@Autowired
	IAdminDao adao;
	
	
	public void genreInsert(GenreVO genrevo) {
		adao.genreInsert(genrevo);
	}
	
	
	public List<GenreVO> listGenre(Paging paging, String key){
		List<GenreVO> list = adao.listGenre(paging, key);
		return list;
	}
	
	
	public void chartInsert(ChartVO chartvo) {
		adao.chartInsert(chartvo);
	}
	
	
	public List<ChartVO> listChart(Paging paging, String key){
		List<ChartVO> list = adao.listChart(paging, key);
		return list;
	}
	
	
	public void themeInsert(ThemeVO themevo) {
		adao.themeInsert(themevo);
	}
	
	
	public List<ThemeVO> listTheme(Paging paging, String key){
		List<ThemeVO> list = adao.listTheme(paging, key);
		return list;
	}
	
	
	public List<ArtistVO> listArtist(Paging paging, String key){
		List<ArtistVO> list = adao.listArtist(paging, key);
		return list;
	}
	
	
	public MemberVO getMember(String useq) {
		return adao.getMember(useq);
	}
	
	
	public List<MemberVO> listMember(Paging paging, String key){
		List<MemberVO> list = adao.listMember(paging, key);
		return list;
	}
	
	
	public int getAllCount(String tablename, String fieldname, String key) {
		int count = adao.getAllCount(tablename, fieldname, key);
		return count;
	}
	
	public int adminCheck(String adminId, String adminPw) {
		String pw = adao.adminCheck(adminId);
		int result=0;
		if(adminPw==null) result=-1;
		else if(adminPw.equals(pw)) result=1;
		else if(!adminPw.equals(pw)) result=0;
		return result;
	}
}
