package com.eco.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eco.dao.IAdminDao;
import com.eco.dto.MemberVO;
import com.eco.dto.MusicVO;
import com.eco.dto.Paging;

@Service
public class AdminService {

	@Autowired
	IAdminDao adao;
	
	
	public MemberVO getMember(String useq) {
		return adao.getMember(useq);
	}
	
	
	public List<MemberVO> listMember(Paging paging, String key){
		List<MemberVO> list = adao.listMember(paging, key);
		return list;
	}
	
	
	public List<MusicVO> listMusic(Paging paging, String key){
		List<MusicVO> list = adao.listMusic(paging, key);
		return list;
	}
	
	
	public int getAllCount(String tablename, String fieldname, String key) {
		int count = adao.getAllCount(tablename, fieldname, key);
		return count;
	}
	
	
	public int getMusicCount(String tablename, String fieldname, String key) {
		int count = adao.getMusicCount(tablename, fieldname, key);
		return count;
	}
	
	
	public int adminCheck(String adminId, String adminPw) {
		String pw = adao.adminCheck(adminId);
		int result=0;
		if(adminPw==null) result=-1;
		else if(adminPw.equals(pw)) result=1;
		else if(!adminPw.equals(pw)) result=0;
		return result;
	}
}
