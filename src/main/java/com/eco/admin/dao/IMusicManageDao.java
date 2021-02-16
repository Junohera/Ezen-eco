package com.eco.admin.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.eco.dto.MusicVO;
import com.eco.dto.Paging;

@Mapper
public interface IMusicManageDao {

	List<MusicVO> list(Paging paging, String key);
	
}
