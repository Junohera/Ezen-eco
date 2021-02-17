package com.eco.admin.service.implement;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eco.admin.dao.IArtistManageDao;
import com.eco.admin.service.IArtistManageService;
import com.eco.dto.ArtistVO;
import com.eco.dto.search.SearchDTO;

@Service
public class ArtistManageService implements IArtistManageService {

	@Autowired
	IArtistManageDao artistManageDao;
	
	@Override
	public int count(SearchDTO search) {
		return artistManageDao.count(search);
	}

	@Override
	public List<ArtistVO> list(HashMap<String, Object> map) {return artistManageDao.list(map);}

	@Override
	public int update(ArtistVO artist) {
		int res = artistManageDao.update(artist);
		return res;
	}

	@Override
	public int insert(ArtistVO artist) {
		return artistManageDao.insert(artist);
	}

	@Override
	public int delete(int atseq) {
		return artistManageDao.delete(atseq);		
	}
	
}