package com.eco.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eco.dao.MusicDao;
import com.eco.dto.Bundle;
import com.eco.dto.Music;

@Service
public class MusicService {
	
	@Autowired
	MusicDao md;

	public List<Bundle> listBundle(Integer useq) {
		List<Bundle> result = new ArrayList<Bundle>();
		
		if (useq == null) { // 메인에서 사용할 번들 목록
			result = md.listBundleForMain();
		} else {
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
}
