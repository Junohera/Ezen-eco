package com.eco.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.eco.dto.Bundle;

@Mapper
public interface BundleDao {
	List<Bundle> listBundleForMain();

	List<Bundle> listBundleByUser(Integer useq);
}
