package com.eco.admin.service;

import java.util.HashMap;
import java.util.List;

import com.eco.dto.AlbumVO;
import com.eco.dto.ArtistVO;
import com.eco.dto.search.SearchDTO;

public interface IAlbumManageService {
	List<AlbumVO> list4find(SearchDTO paging);
	List<AlbumVO> list(HashMap<String, Object> map);
	List<ArtistVO> getArtist();
	int insert(AlbumVO album);
}