package com.eco.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eco.dao.IMypageDao;
import com.eco.dto.Album;
import com.eco.dto.Artist;
import com.eco.dto.Music;

@Service
public class MypageService {
	@Autowired
	IMypageDao mpdao;
	
	public List<Album> getAlbum(int useq){
		return mpdao.getAlbum(useq);
	}
	
	public List<Artist> getArtist(int useq){
		return mpdao.getArtist(useq);
	}
	
	
	public List<Music> getMusic(int useq){
		return mpdao.getMusic(useq);
	}
}
