package com.eco.admin.service.implement;

import java.util.HashMap;
import java.util.List;

import com.eco.dto.ArtistVO;
import com.eco.dto.search.SearchDTO;

public interface IArtistManageService {

	List<ArtistVO> list(HashMap<String, Object> map);

	int count(SearchDTO search);

	int update(ArtistVO artist);

	int insert(ArtistVO artist);

	int delete(int atseq);

}