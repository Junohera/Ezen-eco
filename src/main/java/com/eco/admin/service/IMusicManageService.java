package com.eco.admin.service;

import java.util.List;

import com.eco.dto.MusicVO;
import com.eco.dto.search.SearchDTO;

public interface IMusicManageService {

	List<MusicVO> list(SearchDTO search);
	
}