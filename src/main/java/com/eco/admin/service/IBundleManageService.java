package com.eco.admin.service;

import java.util.List;

import com.eco.dto.BundleVO;
import com.eco.dto.Paging;

public interface IBundleManageService {

	List<BundleVO> list(Paging paging, String key);

}