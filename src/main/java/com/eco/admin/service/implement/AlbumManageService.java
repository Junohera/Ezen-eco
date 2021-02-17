package com.eco.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eco.admin.dao.IAlbumManageDao;
import com.eco.admin.service.implement.IAlbumManageService;
import com.eco.dto.AlbumVO;
import com.eco.dto.Paging;

@Service
public class AlbumManageService implements IAlbumManageService {

    @Autowired
	IAlbumManageDao albumManageDao;

	@Override
	public List<AlbumVO> list(Paging paging, String key) {
		return albumManageDao.list(paging, key);
	}
}