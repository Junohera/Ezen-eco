package com.eco.admin.service;

import java.util.HashMap;
import java.util.List;

import com.eco.dto.ArtistVO;

public interface IArtistManageService {

	List<ArtistVO> list(HashMap<String, Object> map);

	int update(ArtistVO artist);

	int insert(ArtistVO artist);

	int delete(int atseq);

}