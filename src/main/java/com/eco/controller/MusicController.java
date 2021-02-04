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
import com.eco.dto.MemberVO;
import com.eco.dto.Music;
import com.eco.service.MusicService;

@Controller
public class MusicController {
	
	
	@Autowired
	MusicService ms;

	@RequestMapping(value = "/chart", method = RequestMethod.GET)
	public String chart(Model model, HttpServletRequest request
			, @RequestParam(value = "tseq", required = false, defaultValue = "1") int tseq
	) {
		String returnPath = "redirect:/" + request.getHeader("Referer");
		System.out.println("System.out.println(returnPath);");
		System.out.println(returnPath);
		model.addAttribute("tseq", tseq);

		/** 테마 리스트 */
		List<Theme> themeList = ms.themeList();
		model.addAttribute("themeList", themeList);

		// 뮤직차트
		// 1. 선택된 테마의 시퀀스 추출  -> @RequestParam(value = "tseq", required = false, defaultValue = "1") int tseq
		// 2. 테마시퀀스로 music_view 조회
		List<Music> chartList = ms.musicListByTheme(tseq);
		model.addAttribute("chartList", chartList);

		return "music/chart";
	}
	
	@RequestMapping(value = "/artistView", method = RequestMethod.GET)
	public String artistView(Model model, HttpServletRequest request) {
		return "music/artistView";
	}

	@RequestMapping(value = "/albumView", method = RequestMethod.GET)
	public String albumView(Model model, HttpServletRequest request
			, @RequestParam("abseq") int abseq) {
		String returnPath = "redirect:/" + request.getHeader("Referer");
		System.out.println("System.out.println(returnPath);");
		System.out.println(returnPath);
		
		Album album = ms.getAlbum(abseq);
		model.addAttribute("album", album);
		
		List<Music> musicListByAlbum = ms.musicListByAlbum(abseq);
		model.addAttribute("musicList", musicListByAlbum);
		
		return "music/albumView";
	}
	
	@RequestMapping(value = "/musicView", method = RequestMethod.GET)
	public String musicView(Model model, HttpServletRequest request) {
		return "music/musicView";
	}
	
	@RequestMapping(value = "/like", method = RequestMethod.POST)
	public String like(Model model, HttpServletRequest request
			, @RequestParam(value = "atseq", required = false, defaultValue = "0") int atseq
			, @RequestParam(value = "abseq", required = false, defaultValue = "0") int abseq
			, @RequestParam(value = "mseq", required = false, defaultValue = "0") int mseq
		) {
		// 세션에서 유저값
		MemberVO loginUser = (MemberVO) request.getSession().getAttribute("loginUser");
		String returnPath = "redirect:/" + request.getHeader("Referer");
		
		if (loginUser == null) {
			returnPath = "/loginForm";
		} else {
			// 넘어온 값에 따라 like에 insert 다만, mseq일경우 ban에서 제거하고 insert
			if (atseq != 0) {
				ms.likeArtist(loginUser.getUseq(), mseq);
			} else if (abseq != 0) {
				ms.likeAlbum(loginUser.getUseq(), mseq);
			} else if (mseq != 0) {
				ms.likeMusic(loginUser.getUseq(), mseq);
			}
			// 되돌아갈 주소는 넘겨받아서 처리
			returnPath = request.getParameter("returnPath");
		}
		
		return returnPath;
	}
	
	@RequestMapping(value = "/unlike", method = RequestMethod.POST)
	public String unlike(Model model, HttpServletRequest request
			, @RequestParam(value = "atseq", required = false, defaultValue = "0") int atseq
			, @RequestParam(value = "abseq", required = false, defaultValue = "0") int abseq
			, @RequestParam(value = "mseq", required = false, defaultValue = "0") int mseq
			) {
		// 세션에서 유저값
		MemberVO loginUser = (MemberVO) request.getSession().getAttribute("loginUser");
		String returnPath = "redirect:/" + request.getHeader("Referer");
		
		if (loginUser == null) {
			returnPath = "/loginForm";
		} else {
			// 넘어온 값에 따라 like에 insert 다만, mseq일경우 ban에서 제거하고 insert
			if (atseq != 0) {
				ms.unlikeArtist(loginUser.getUseq(), mseq);
			} else if (abseq != 0) {
				ms.unlikeAlbum(loginUser.getUseq(), mseq);
			} else if (mseq != 0) {
				ms.unlikeMusic(loginUser.getUseq(), mseq);
			}
			// 되돌아갈 주소는 넘겨받아서 처리
			returnPath = request.getParameter("returnPath");
		}
		
		return returnPath;
	}
	
	@RequestMapping(value = "/ban", method = RequestMethod.POST)
	public String ban(Model model, HttpServletRequest request
			, @RequestParam(value = "mseq", required = false, defaultValue = "0") int mseq
			) {
		// 세션에서 유저값
		MemberVO loginUser = (MemberVO) request.getSession().getAttribute("loginUser");
		String returnPath = "redirect:/" + request.getHeader("Referer");
		
		if (loginUser == null) {
			returnPath = "/loginForm";
		} else {
			ms.banMusic(loginUser.getUseq(), mseq);
			
			// 되돌아갈 주소는 넘겨받아서 처리
			returnPath = request.getParameter("returnPath");
		}
		
		return returnPath;
	}
}
