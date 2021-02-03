package com.eco.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.eco.dto.Bundle;
import com.eco.dto.Music;

@Mapper
public interface MusicDao {

	List<Bundle> listBundleForMain();

	List<Bundle> listBundleByUser(Integer useq);

	List<Music> listByBundle(int bmseq);
	
	List<Music> test();

}
