package com.eco.service;

import java.util.List;
<<<<<<< HEAD
=======
import java.util.stream.Collectors;
>>>>>>> c3d37b7c155523a8418335d93061db89524ee26a

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

<<<<<<< HEAD
import com.eco.dao.MusicDao;
=======
import com.eco.dao.IMusicDao;
>>>>>>> c3d37b7c155523a8418335d93061db89524ee26a
import com.eco.dto.Album;
import com.eco.dto.Chart;
import com.eco.dto.Genre;
import com.eco.dto.Music;

@Service
public class MusicService {
	
	@Autowired
<<<<<<< HEAD
	MusicDao md;
=======
	IMusicDao md;
>>>>>>> c3d37b7c155523a8418335d93061db89524ee26a

	public List<Chart> chartList() {
		return md.chartList();
	}
	
	public List<Genre> genreList() {
		return md.genreList();
	}

	public List<Music> musicListByAlbum(int abseq) {
		return md.musicListByAlbum(abseq);
	}

	public List<Music> musicListByChart(int cseq) {
		return md.musicListByChart(cseq);
	}

	public List<Music> musicListByGenre(int gseq) {
		return md.musicListByGenre(gseq);
	}
	
	public List<Music> musicListByTheme(int tseq) {
		return md.musicListByTheme(tseq);
	}

	public List<Music> musicListByBundle(int bmseq) {
		return md.musicListByBundle(bmseq);
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
		this.unbanMusic(useq, mseq); // music은 곡 무시하기가 있으므로 제거 후 좋아요등록
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
		this.unlikeMusic(useq, mseq); // 곡을 무시할경우, 좋아요 취소
		md.banMusic(useq, mseq);
	}
	
	public void unbanMusic(int useq, int mseq) {
		md.unbanMusic(useq, mseq);
	}
<<<<<<< HEAD
=======

	public List<Music> ignoreBanList(List<Music> musicList, int useq) {
		// 유저의 ban 목록
		List<Integer> banMseqList = md.banListByUseq(useq);
		
		// 원래목록에서 차단되지않은 목록만 저장하고 반환
		musicList = musicList.stream().filter(music -> {
			return !banMseqList.contains(music.getMseq());
		}).collect(Collectors.toList());

		return musicList;
	}

	public List<Integer> likeMusicListByUseq(int useq) {
		return md.likeMusicListByUseq(useq);
	}

	public List<Integer> likeAlbumListByUseq(int useq) {
		return md.likeAlbumListByUseq(useq);
	}
>>>>>>> c3d37b7c155523a8418335d93061db89524ee26a
	
}
