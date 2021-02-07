package com.eco.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eco.dao.IBundleDao;
import com.eco.dto.Bundle;

@Service
public class BundleService {
	
	@Autowired
	IBundleDao bd;

	
	public List<Bundle> listBundle(int useq) {
		List<Bundle> result = new ArrayList<Bundle>();
		
		if (useq == 0) { // 시스템에서 생성한 리스트
			result = bd.listBundleForMain();
		} else { // 유저의 리스트
			result = bd.listBundleByUser(useq);
		}
		return result;
	}
}
