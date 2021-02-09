package com.eco.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.eco.dto.MemberVO;
import com.eco.dto.MusicVO;
import com.eco.dto.Paging;

@Mapper
public interface IAdminDao {

	public String adminCheck(String adminId);
	public List<MusicVO> listMusic(Paging paging, String key);
	public int getMusicCount(String tablename, String fieldname, String key);
	public int getAllCount(String tablename, String fieldname, String key);
	public List<MemberVO> listMember(Paging paging, String key);
	public MemberVO getMember(String useq);
}
