package com.eco.admin.service.implement;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eco.admin.dao.IMusicManageDao;
import com.eco.admin.service.IMusicManageService;
import com.eco.dto.MusicVO;
import com.eco.dto.search.SearchDTO;

@Service
public class MusicManageService implements IMusicManageService {
	
	@Autowired
	IMusicManageDao musicManageDao;

	@Override
	public List<MusicVO> list(SearchDTO search) {
		return musicManageDao.list(search);
	}
}