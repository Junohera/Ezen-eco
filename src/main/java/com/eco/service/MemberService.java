package com.eco.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eco.dao.IMemberDao;
import com.eco.dto.MemberVO;

@Service
public class MemberService {
	
	@Autowired
	IMemberDao mdao;
	
	public MemberVO getMember(String id) {
		return mdao.getMember(id);
	}

	public int insertMember(MemberVO mvo) {
		return mdao.insertMember(mvo);
	}
	public void resetPw(MemberVO mvo) {
		mdao.resetPw(mvo);
	}
	public MemberVO confirmIdNamePhone(MemberVO membervo) {
		return mdao.confirmIdNamePhone(membervo);
	}
	public MemberVO confirmNamePhone(MemberVO membervo) {
		return mdao.confirmNamePhone(membervo); 
	}
}
