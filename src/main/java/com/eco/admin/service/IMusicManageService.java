package com.eco.admin.service;

import java.util.List;

import com.eco.dto.MusicVO;
import com.eco.dto.Paging;

public interface IMusicManageService {

	List<MusicVO> list(Paging paging, String key);
	
}