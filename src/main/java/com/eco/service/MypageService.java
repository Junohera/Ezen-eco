package com.eco.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eco.dao.IMypageDao;
import com.eco.dto.MusicVO;

@Service
public class MypageService {
	@Autowired
	IMypageDao mpdao;
	
	public List<MusicVO> getLikeMusic(String id, int mseq){
		List<MusicVO> list = mpdao.getLikeMusic(id, mseq);
		return list;
	}
}
