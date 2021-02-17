package com.eco.dao;

import org.apache.ibatis.annotations.Mapper;

import com.eco.dto.MemberVO;

@Mapper
public interface IMemberDao {
	
	public MemberVO getMember(String id);
	public int insertMember(MemberVO mvo);
	public void resetPw(MemberVO membervo);
	public int updateMember(MemberVO mvo);
	public MemberVO confirmIdNamePhone(String id, String name, String phone);
	public MemberVO confirmNamePhone(String name, String phone);
}
