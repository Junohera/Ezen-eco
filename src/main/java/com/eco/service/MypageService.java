package com.eco.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eco.dao.IMypageDao;
import com.eco.dto.Music;

@Service
public class MypageService {
	@Autowired
	IMypageDao mpdao;
	
	public List<Music> getLikeMusic(String id, int mseq){
		List<Music> list = mpdao.getLikeMusic(id, mseq);
		return list;
	}
}
