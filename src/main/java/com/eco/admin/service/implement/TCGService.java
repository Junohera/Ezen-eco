package com.eco.admin.service.implement;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eco.admin.dao.ITCGDao;
import com.eco.dao.ICountDao;
import com.eco.dto.ChartVO;
import com.eco.dto.GenreVO;
import com.eco.dto.Paging;
import com.eco.dto.ThemeVO;

@Service
public class TCGService {

	@Autowired
	ITCGDao tcgdao;
	
	@Autowired
	ICountDao c;
	
	
	public void genreDelete(String gseq) {
		tcgdao.genreDelete(gseq);
	}
	
	
	public void chartDelete(String cseq) {
		tcgdao.chartDelete(cseq);
	}
	
	
	
	public void themeDelete(String tseq) {
		tcgdao.themeDelete(tseq);
	}
	
	
	
	public void chartUpdate(ChartVO genrevo) {
		tcgdao.chartUpdate(genrevo);
	}
	
	
	public ChartVO getChart(String cseq) {
		return tcgdao.getChart(cseq);
	}
	
	
	
	public void genreUpdate(GenreVO genrevo) {
		tcgdao.genreUpdate(genrevo);
	}
	
	
	public GenreVO getGenre(String gseq) {
		return tcgdao.getGenre(gseq);
	}
	
	
	
	public void themeUpdate(ThemeVO themevo) {
		tcgdao.themeUpdate(themevo);
	}
	
	
	
	public ThemeVO getTheme(String tseq) {
		return tcgdao.getTheme(tseq);
	}
	
	
	
	public void genreInsert(GenreVO genrevo) {
		tcgdao.genreInsert(genrevo);
	}
	
	
	public List<GenreVO> listGenre(Paging paging, String key){
		List<GenreVO> list = tcgdao.listGenre(paging, key);
		return list;
	}
	
	
	public void chartInsert(ChartVO chartvo) {
		tcgdao.chartInsert(chartvo);
	}
	
	
	public List<ChartVO> listChart(Paging paging, String key){
		List<ChartVO> list = tcgdao.listChart(paging, key);
		return list;
	}
	
	
	public void themeInsert(ThemeVO themevo) {
		tcgdao.themeInsert(themevo);
	}
	
	
	public List<ThemeVO> listTheme(Paging paging, String key){
		List<ThemeVO> list = tcgdao.listTheme(paging, key);
		return list;
	}
}
