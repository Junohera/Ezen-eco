package com.eco.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.eco.dto.BundleVO;

@Mapper
public interface BundleDao {
	
	List<BundleVO> listBundleForMain();

	List<BundleVO> listBundleByUser(int useq);
}
