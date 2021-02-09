package com.eco.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.eco.dto.MemberVO;
import com.eco.dto.MusicVO;
import com.eco.dto.MusicLike;
import com.eco.service.MypageService;

@Controller
public class MypageController {
	
	@Autowired
	MypageService mps;
	
	@RequestMapping(value = "mybundle", method = RequestMethod.GET)
	public String mybundle(Model model, HttpServletRequest request) {
		
		return "mypage/mybundle";
	}
	
	@RequestMapping(value = "likeArtist", method = RequestMethod.GET)
	public String likeartist(Model model, HttpServletRequest request) {
		
		return "mypage/likeartist";
	}
	
	@RequestMapping(value = "likealbum", method = RequestMethod.GET)
	public String likealbum(Model model, HttpServletRequest request) {
		
		return "mypage/likealbum";
	}
	
	@RequestMapping(value = "storage", method = RequestMethod.GET)
	public String likemusic(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO) session.getAttribute("loginUser");
		if( mvo==null )return "mypage/loginplz";
		else{
			MusicVO ms = new MusicVO();
			List<MusicVO> list = mps.getLikeMusic(mvo.getId(), ms.getMseq() );
			
			model.addAttribute("likemusiclist", list);
			return "mypage/likemusic";
		}
	}
}
