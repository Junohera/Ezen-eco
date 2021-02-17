package com.eco.admin.service;

import java.util.HashMap;
import java.util.List;

import com.eco.dto.ArtistVO;
import com.eco.dto.search.SearchDTO;

public interface IArtistManageService {

	int count(SearchDTO search);
	
	List<ArtistVO> list(HashMap<String, Object> map);

	int update(ArtistVO artist);

	int insert(ArtistVO artist);

	int delete(int atseq);

}