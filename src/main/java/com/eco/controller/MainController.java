package com.eco.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.eco.dto.BundleVO;
import com.eco.dto.MusicVO;
import com.eco.service.BundleService;
import com.eco.service.MusicService;

@Controller
public class MainController {
	
	@Autowired
	BundleService bundleService;
	
	@Autowired
	MusicService musicService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String main(Model model, HttpServletRequest request) {
		
		List<BundleVO> bundleList = bundleService.listBundle(0); // 메인에서 부를 번들은 유저없이 가므로 0을 보냄(참고로 시퀀스는 1부터)
		for (BundleVO b : bundleList) {
			List<MusicVO> musicList = musicService.musicListByBundle(b.getBmseq());
			b.setMusicList(musicList);
		}
		model.addAttribute("bundleList", bundleList);
		
		return "index";
	}

}
