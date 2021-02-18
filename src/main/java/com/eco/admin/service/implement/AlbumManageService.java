package com.eco.admin.service.implement;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eco.admin.dao.IAlbumManageDao;
import com.eco.admin.service.IAlbumManageService;
import com.eco.dto.AlbumVO;
import com.eco.dto.search.SearchDTO;

@Service
public class AlbumManageService implements IAlbumManageService {

    @Autowired
	IAlbumManageDao albumManageDao;

	@Override
	public List<AlbumVO> list(SearchDTO search) {
		return albumManageDao.list(search);
	}
}