package com.eco.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.eco.dto.MusicVO;

@Mapper
public interface IMypageDao {
	
	public List<MusicVO> getLikeMusic(String id, int mseq);
}
