package com.eco.admin.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.eco.dto.AlbumVO;
import com.eco.dto.ArtistVO;
import com.eco.dto.search.SearchDTO;

@Mapper
public interface IAlbumManageDao {
	List<AlbumVO> list(HashMap<String, Object> map);
	List<ArtistVO> getArtist();
	int insert(AlbumVO album);
	List<AlbumVO> list4find(SearchDTO search);
}
