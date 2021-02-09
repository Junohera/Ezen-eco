package com.eco.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

<<<<<<< HEAD
import com.eco.dao.BundleDao;
import com.eco.dto.Bundle;
=======
import com.eco.dao.IBundleDao;
import com.eco.dto.Bundle;
import com.eco.dto.BundleDetailVO;
>>>>>>> c3d37b7c155523a8418335d93061db89524ee26a

@Service
public class BundleService {
	
	@Autowired
<<<<<<< HEAD
	BundleDao bd;
=======
	IBundleDao bd;
>>>>>>> c3d37b7c155523a8418335d93061db89524ee26a

	
	public List<Bundle> listBundle(int useq) {
		List<Bundle> result = new ArrayList<Bundle>();
		
		if (useq == 0) { // 시스템에서 생성한 리스트
			result = bd.listBundleForMain();
		} else { // 유저의 리스트
			result = bd.listBundleByUser(useq);
		}
		return result;
	}
<<<<<<< HEAD
=======


	public int addBundleMaster(Bundle bundle) {
		return bd.addBundleMaster(bundle);
	}

	public int addBundleDetail(BundleDetailVO bundleDetail) {
		return bd.addBundleDetail(bundleDetail);
	}

>>>>>>> c3d37b7c155523a8418335d93061db89524ee26a
}
