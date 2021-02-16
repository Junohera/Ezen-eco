package com.eco.admin.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.eco.dto.ArtistVO;
import com.eco.dto.search.SearchDTO;

@Mapper
public interface IArtistManageDao {

	List<ArtistVO> list(HashMap<String, Object> map);

	int count(SearchDTO search);

	int update(ArtistVO artist);

	int insert(ArtistVO artist);

	int delete(int atseq);
	
}
