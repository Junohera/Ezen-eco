package com.eco.admin.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.eco.dto.ArtistVO;

@Mapper
public interface IArtistManageDao {

	List<ArtistVO> list(HashMap<String, Object> map);

	int update(ArtistVO artist);

	int insert(ArtistVO artist);

	int delete(int atseq);
	
}
