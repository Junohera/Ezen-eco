package com.eco.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.context.Theme;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.eco.dto.Album;
import com.eco.dto.Music;
import com.eco.service.MusicService;

@Controller
public class MusicController {
	
	
	@Autowired
	MusicService ms;

	@RequestMapping(value = "/musicCharts", method = RequestMethod.GET)
	public String musicCharts(Model model, HttpServletRequest request
			, @RequestParam(value = "tseq", required = false, defaultValue = "1") int tseq
	) {
		model.addAttribute("tseq", tseq);

		/** 테마 리스트 */
		List<Theme> themeList = ms.themeList();
		model.addAttribute("themeList", themeList);

		// 뮤직차트
		// 1. 선택된 테마의 시퀀스 추출  -> @RequestParam(value = "tseq", required = false, defaultValue = "1") int tseq
		// 2. 테마시퀀스로 music_view 조회
		List<Music> chartList = ms.musicListByTheme(tseq);
		model.addAttribute("chartList", chartList);

		return "music/musicCharts";
	}

	@RequestMapping(value = "/albumView", method = RequestMethod.GET)
	public String musicView(Model model, HttpServletRequest request
			, @RequestParam("abseq") int abseq) {
		System.out.println("abseq #########################################");
		System.out.println(abseq);
		
		Album album = ms.getAlbum(abseq);
		System.out.println("album #########################################");
		System.out.println(album);
		model.addAttribute("album", album);
		
		List<Music> musicListByAlbum = ms.musicListByAlbum(abseq);
		System.out.println("musicListByAlbum #########################################");
		System.out.println(musicListByAlbum);
		model.addAttribute("musicList", musicListByAlbum);
		
		return "music/albumView";
	}
}
