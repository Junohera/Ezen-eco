package com.eco.admin.service;

import java.util.List;

import com.eco.dto.AlbumVO;
import com.eco.dto.search.SearchDTO;

public interface IAlbumManageService {
	
	List<AlbumVO> list(SearchDTO search);
	
}