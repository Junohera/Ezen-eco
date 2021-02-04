package com.eco.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.context.Theme;

import com.eco.dao.MusicDao;
import com.eco.dto.Album;
import com.eco.dto.Bundle;
import com.eco.dto.Music;

@Service
public class MusicService {
	
	@Autowired
	MusicDao md;

	public List<Bundle> listBundle(int useq) {
		List<Bundle> result = new ArrayList<Bundle>();
		
		if (useq == 0) { // 시스템에서 생성한 리스트
			result = md.listBundleForMain();
		} else { // 유저의 리스트
			result = md.listBundleByUser(useq);
		}
		return result;
	}

	public List<Music> listByBundle(int bmseq) {
		return md.listByBundle(bmseq);
	}
	
	public List<Music> test() {
		return md.test();
	}

	public List<Music> musicListByTheme(int tseq) {
		return md.musicListByTheme(tseq);
	}

	public List<Theme> themeList() {
		return md.themeList();
	}

	public Music getMusic(int mseq) {
		return md.getMusic(mseq);
	}

	public Album getAlbum(int abseq) {
		return md.getAlbum(abseq);
	}

	public List<Music> musicListByAlbum(int abseq) {
		return md.musicListByAlbum(abseq);
	}
}
