package com.eco.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.eco.dto.Bundle;
import com.eco.dto.Music;

@Controller
public class MypageController {
	
	
	@RequestMapping(value = "mybundle", method = RequestMethod.GET)
	public String mybundle(Model model, HttpServletRequest request) {
		
		return "mypage/mybundle";
	}
	
	@RequestMapping(value = "likeartist", method = RequestMethod.GET)
	public String likeartist(Model model, HttpServletRequest request) {
		
		return "mypage/likeartist";
	}
	
	@RequestMapping(value = "likealbum", method = RequestMethod.GET)
	public String likealbum(Model model, HttpServletRequest request) {
		
		return "mypage/likealbum";
	}
	
	@RequestMapping(value = "storage", method = RequestMethod.GET)
	public String likemusic(Model model, HttpServletRequest request) {
		
		return "mypage/likemusic";
	}
}
