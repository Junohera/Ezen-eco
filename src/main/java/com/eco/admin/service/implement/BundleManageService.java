package com.eco.admin.service.implement;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eco.admin.dao.IBundleManageDao;
import com.eco.admin.service.IBundleManageService;
import com.eco.dto.BundleVO;
import com.eco.dto.Paging;

@Service
public class BundleManageService implements IBundleManageService{
	
	@Autowired
	IBundleManageDao bundleManageDao;

	@Override
	public List<BundleVO> list(Paging paging, String key) {
		return null;
	}
	
}