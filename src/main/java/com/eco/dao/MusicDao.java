package com.eco.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.ui.context.Theme;

import com.eco.dto.Album;
import com.eco.dto.Artist;
import com.eco.dto.Chart;
import com.eco.dto.Genre;
import com.eco.dto.Music;

@Mapper
public interface MusicDao {

	List<Theme> themeList();
	
	List<Chart> chartList();

	List<Genre> genreList();
	
	List<Music> musicListByAlbum(int abseq);

	List<Music> musicListByChart(int cseq);

	List<Music> musicListByGenre(int gseq);

	List<Music> musicListByTheme(int tseq);

	List<Music> musicListByBundle(int bmseq);

	Music getMusic(int mseq);

	Album getAlbum(int abseq);
	
	Artist getArtist(int atseq);

	void likeMusic(int useq, int mseq);

	void likeAlbum(int useq, int mseq);

	void likeArtist(int useq, int mseq);

	void unlikeArtist(int useq, int mseq);

	void unlikeAlbum(int useq, int mseq);

	void unlikeMusic(int useq, int mseq);

	void banMusic(int useq, int mseq);
	
	void unbanMusic(int useq, int mseq);
}
