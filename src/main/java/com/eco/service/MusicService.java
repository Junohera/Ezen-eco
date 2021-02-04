package com.eco.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eco.dao.MusicDao;
import com.eco.dto.Album;
import com.eco.dto.Chart;
import com.eco.dto.Genre;
import com.eco.dto.Music;

@Service
public class MusicService {
	
	@Autowired
	MusicDao md;

	public List<Music> listByBundle(int bmseq) {
		return md.listByBundle(bmseq);
	}
	
	public List<Music> musicListByTheme(int tseq) {
		return md.musicListByTheme(tseq);
	}
	
	public List<Music> musicListByChart(int cseq) {
		return md.musicListByChart(cseq);
	}

	public List<Music> musicListByGenre(int gseq) {
		return md.musicListByGenre(gseq);
	}

	public List<Music> musicListByAlbum(int abseq) {
		return md.musicListByAlbum(abseq);
	}

	public List<Chart> chartList() {
		return md.chartList();
	}
	
	public List<Genre> genreList() {
		return md.genreList();
	}

	public Music getMusic(int mseq) {
		return md.getMusic(mseq);
	}

	public Album getAlbum(int abseq) {
		return md.getAlbum(abseq);
	}

	public void likeArtist(int useq, int mseq) {
		md.likeArtist(useq, mseq);
	}

	public void likeAlbum(int useq, int mseq) {
		md.likeAlbum(useq, mseq);
	}

	public void likeMusic(int useq, int mseq) {
		unbanMusic(useq, mseq); // music은 곡 무시하기가 있으므로 제거 후 좋아요등록
		md.likeMusic(useq, mseq);
	}
	
	public void unlikeArtist(int useq, int mseq) {
		md.unlikeArtist(useq, mseq);
	}

	public void unlikeAlbum(int useq, int mseq) {
		md.unlikeAlbum(useq, mseq);
	}

	public void unlikeMusic(int useq, int mseq) {
		md.unlikeMusic(useq, mseq);
	}
	
	public void banMusic(int useq, int mseq) {
		md.banMusic(useq, mseq);
	}
	
	public void unbanMusic(int useq, int mseq) {
		md.unbanMusic(useq, mseq);
	}

	
}
