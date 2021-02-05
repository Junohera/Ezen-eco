package com.eco.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.eco.dto.Music;

@Mapper
public interface IMypageDao {
	
	public List<Music> getLikeMusic(String id, int mseq);
}
