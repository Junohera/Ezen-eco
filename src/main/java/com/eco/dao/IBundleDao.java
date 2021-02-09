package com.eco.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.eco.dto.Bundle;
import com.eco.dto.BundleDetailVO;

@Mapper
public interface IBundleDao {
	
	List<Bundle> listBundleForMain();

	List<Bundle> listBundleByUser(int useq);

	int addBundleMaster(Bundle bundle);

	int addBundleDetail(BundleDetailVO bundleDetail);
}
