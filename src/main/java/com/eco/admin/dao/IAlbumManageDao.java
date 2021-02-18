package com.eco.admin.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.eco.dto.AlbumVO;
import com.eco.dto.search.SearchDTO;

@Mapper
public interface IAlbumManageDao {

	List<AlbumVO> list(SearchDTO search);
	
}
