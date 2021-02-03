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
public class MusicController {
	
	
	@Autowired
	MusicService ms;
	
	@RequestMapping(value = "musicCharts", method = RequestMethod.GET)
	public String main(Model model, HttpServletRequest request) {
		
		List<Bundle> bundleList = ms.listBundle(null); // 메인에서 부를 번들은 유저없이 가므로 0을 보냄(참고로 시퀀스는 1부터)
		System.out.println(bundleList);
		for (Bundle b : bundleList) {
			List<Music> musicList = ms.listByBundle(b.getBmseq());
			System.out.println(musicList);
			b.setMusicList(musicList);
		}
		model.addAttribute("bundleList", bundleList);
		
		return "index";
	}
}
