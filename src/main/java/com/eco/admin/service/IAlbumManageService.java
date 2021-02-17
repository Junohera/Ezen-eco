package com.eco.admin.service;

import java.util.List;

import com.eco.dto.AlbumVO;
import com.eco.dto.Paging;

public interface IAlbumManageService {
	List<AlbumVO> list(Paging paging, String key);
}