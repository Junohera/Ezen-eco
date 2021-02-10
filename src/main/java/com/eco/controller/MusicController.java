package com.eco.controller;

import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.eco.dto.AlbumVO;
import com.eco.dto.ArtistVO;
import com.eco.dto.BundleVO;
import com.eco.dto.ChartVO;
import com.eco.dto.GenreVO;
import com.eco.dto.MemberVO;
import com.eco.dto.MusicVO;
import com.eco.dto.SearchDTO;
import com.eco.service.BundleService;
import com.eco.service.MusicService;

@Controller
public class MusicController {
	
	
	@Autowired
	MusicService ms;
	
	@Autowired
	BundleService bundleService;

	@RequestMapping(value = "/browse", method = RequestMethod.GET)
	public String browse(Model model, HttpServletRequest request
			, @RequestParam(value = "selectedType", required = false, defaultValue = "chart") String selectedType
			, @RequestParam(value = "selectedSeq", required = false, defaultValue = "1") int selectedSeq
) {
		
		model.addAttribute("selectedType", selectedType);
		model.addAttribute("selectedSeq", selectedSeq);

		
		/** 차트 리스트 */
		List<ChartVO> chartList = ms.chartList();
		model.addAttribute("chartList", chartList);
		
		/** 장르 리스트 */
		List<GenreVO> genreList = ms.genreList();
		model.addAttribute("genreList", genreList);

		// 뮤직차트
		// 1. 선택한 타입과 선택한 시퀀스값 추출
			// @RequestParam(value = "selectedSeq", required = false, defaultValue = "1") int selectedSeq -> 선택안할경우 1
			// @RequestParam(value = "selectedType", required = false, defaultValue = "chart") String selectedType -> 선택안할경우 차트
			// 미선택시 차트의 1번으로 진행

		// 2. 선택한 타입과 선택한 시퀀스값으로 music_view 조회
		List<MusicVO> musicList = null;
		if ("chart".equals(selectedType)) {
			musicList = ms.musicListByChart(selectedSeq);
		} else if ("genre".equals(selectedType)){
			musicList = ms.musicListByGenre(selectedSeq);
		}

		MemberVO loginUser = (MemberVO) request.getSession().getAttribute("loginUser");
		
		if (loginUser != null) {
			List<BundleVO> bundleList = bundleService.listBundle(loginUser.getUseq());
			for (BundleVO b : bundleList) {
				List<MusicVO> musicListByBundle = ms.musicListByBundle(b.getBmseq());
				b.setMusicList(musicListByBundle);
			}
			model.addAttribute("bundleList", bundleList);

			// 로그인유저의 무시목록건 뺀 뮤직목록으로 
			musicList = ms.ignoreBanList(musicList, loginUser.getUseq());

			// 좋아요한 곡의 시퀀스 목록
			model.addAttribute("likeMusicList", ms.likeMusicListByUseq(loginUser.getUseq()));
		}

		model.addAttribute("musicList", musicList);

		return "music/browse";
	}
	
	@RequestMapping(value = "/albumView", method = RequestMethod.GET)
	public String albumView(Model model, HttpServletRequest request
			, @RequestParam("abseq") int abseq) {
		AlbumVO album = ms.getAlbum(abseq);
		List<MusicVO> musicListByAlbum = ms.musicListByAlbum(abseq);
		
		MemberVO loginUser = (MemberVO) request.getSession().getAttribute("loginUser");
		
		if (loginUser != null) {
			List<BundleVO> bundleList = bundleService.listBundle(loginUser.getUseq());
			for (BundleVO b : bundleList) {
				List<MusicVO> musicListByBundle = ms.musicListByBundle(b.getBmseq());
				b.setMusicList(musicListByBundle);
			}
			model.addAttribute("bundleList", bundleList);

			// 로그인유저의 무시목록건 뺀 뮤직목록으로 
			musicListByAlbum = ms.ignoreBanList(musicListByAlbum, loginUser.getUseq());

			// 좋아요한 곡의 시퀀스 목록
			model.addAttribute("likeMusicList", ms.likeMusicListByUseq(loginUser.getUseq()));
			
			// 좋아요한 앨범의 시퀀스 목록
			model.addAttribute("likeAlbumList", ms.likeAlbumListByUseq(loginUser.getUseq()));
		}
		
		
		model.addAttribute("album", album);
		
		
		model.addAttribute("musicList", musicListByAlbum);
		
		return "music/albumView";
	}

	@RequestMapping(value = "/artistView", method = RequestMethod.GET)
	public String artistView(Model model, HttpServletRequest request
			, @RequestParam("atseq") int atseq
			, @ModelAttribute("search") SearchDTO searchDTO) {
		
		System.out.println("System.out.println(searchDTO);");
		System.out.println(searchDTO);
		
		if (searchDTO.getTab() == null) {
			searchDTO.setTab("track"); // default 탭은 track
		}
		
		ArtistVO artist = ms.getArtist(atseq);
		List<AlbumVO> albumListByArtist = ms.albumListByArtist(searchDTO);
		List<MusicVO> musicListByArtist = ms.musicListByArtist(searchDTO);
		
		MemberVO loginUser = (MemberVO) request.getSession().getAttribute("loginUser");
		
		if (loginUser != null) {
			List<BundleVO> bundleList = bundleService.listBundle(loginUser.getUseq());
			for (BundleVO b : bundleList) {
				List<MusicVO> musicListByBundle = ms.musicListByBundle(b.getBmseq());
				b.setMusicList(musicListByBundle);
			}
			
			// 로그인한 유저의 내 리스트
			model.addAttribute("bundleList", bundleList);

			// 좋아요한 곡의 시퀀스 목록
			model.addAttribute("likeMusicList", ms.likeMusicListByUseq(loginUser.getUseq()));
			
			// 좋아요한 앨범의 시퀀스 목록
			model.addAttribute("likeAlbumList", ms.likeAlbumListByUseq(loginUser.getUseq()));

			// 좋아요한 아티스트의 시퀀스 목록
			model.addAttribute("likeArtistList", ms.likeArtistListByUseq(loginUser.getUseq()));
		}
		
		model.addAttribute("artist", artist);
		
		model.addAttribute("albumList", albumListByArtist);

		model.addAttribute("musicList", musicListByArtist);
		
		return "music/artistView";
	}
	


	@RequestMapping(value = "/musicView", method = RequestMethod.GET)
	public String musicView(Model model, HttpServletRequest request
			, @RequestParam("mseq") int mseq) {

		MusicVO music = ms.getMusic(mseq);

		// 유사곡 = 장르가 같은 곡(대신 상세로 들어온 곡과 다른 곡만 취급 -> 자바단에서 해보자...)
		List<MusicVO> musicListByGenre = ms.musicListByGenre(music.getGseq());
		musicListByGenre = musicListByGenre.stream().filter(m -> {
			return m.getMseq() != music.getMseq();
		}).collect(Collectors.toList());
		
		MemberVO loginUser = (MemberVO) request.getSession().getAttribute("loginUser");
		
		if (loginUser != null) {
			List<BundleVO> bundleList = bundleService.listBundle(loginUser.getUseq());
			for (BundleVO b : bundleList) {
				List<MusicVO> musicListByBundle = ms.musicListByBundle(b.getBmseq());
				b.setMusicList(musicListByBundle);
			}

			model.addAttribute("bundleList", bundleList);

			// 로그인유저의 무시목록건 뺀 뮤직목록으로 
			musicListByGenre = ms.ignoreBanList(musicListByGenre, loginUser.getUseq());

			// 좋아요한 곡의 시퀀스 목록
			model.addAttribute("likeMusicList", ms.likeMusicListByUseq(loginUser.getUseq()));

			// 무시한 곡의 시퀀스 목록
			model.addAttribute("banMusicList", ms.banMusicListByUseq(loginUser.getUseq()));
		}
		
		model.addAttribute("music", music);
		
		model.addAttribute("musicList", musicListByGenre);
		
		return "music/musicView";
	}
	
	@RequestMapping(value = "/like", method = RequestMethod.POST)
	public @ResponseBody boolean like(Model model, HttpServletRequest request
			, @RequestBody MusicVO music
		) {
		// 세션에서 유저값
		MemberVO loginUser = (MemberVO) request.getSession().getAttribute("loginUser");
		
		if (loginUser == null) {

			return false;
		} else {
			// 넘어온 값에 따라 like에 insert 다만, mseq일경우 ban에서 제거하고 insert
			if (music.getAtseq() != 0) {
				ms.likeArtist(loginUser.getUseq(), music.getAtseq());
			} else if (music.getAbseq() != 0) {
				ms.likeAlbum(loginUser.getUseq(), music.getAbseq());
			} else if (music.getMseq() != 0) {
				ms.likeMusic(loginUser.getUseq(), music.getMseq());
			}

			return true;
		}
	}
	
	@RequestMapping(value = "/unlike", method = RequestMethod.POST)
	public @ResponseBody boolean unlike(Model model, HttpServletRequest request
			, @RequestBody MusicVO music
		) {
		// 세션에서 유저값
		MemberVO loginUser = (MemberVO) request.getSession().getAttribute("loginUser");
		
		if (loginUser == null) {

			return false;
		} else {
			// 넘어온 값에 따라 like에 insert 다만, mseq일경우 ban에서 제거하고 insert
			if (music.getAtseq() != 0) {
				ms.unlikeArtist(loginUser.getUseq(), music.getAtseq());
			} else if (music.getAbseq() != 0) {
				ms.unlikeAlbum(loginUser.getUseq(), music.getAbseq());
			} else if (music.getMseq() != 0) {
				ms.unlikeMusic(loginUser.getUseq(), music.getMseq());
			}

			return true;
		}
	}
	
	@RequestMapping(value = "/ban", method = RequestMethod.POST)
	public @ResponseBody boolean ban(Model model, HttpServletRequest request
			, @RequestBody int mseq
			) {
		// 세션에서 유저값
		MemberVO loginUser = (MemberVO) request.getSession().getAttribute("loginUser");
		if (loginUser == null) {
			return false;
		} else {
			ms.banMusic(loginUser.getUseq(), mseq);
			return true;
		}		
	}

	@RequestMapping(value = "/unban", method = RequestMethod.POST)
	public @ResponseBody boolean unban(Model model, HttpServletRequest request
			, @RequestBody int mseq
			) {
		// 세션에서 유저값
		MemberVO loginUser = (MemberVO) request.getSession().getAttribute("loginUser");
		if (loginUser == null) {
			return false;
		} else {
			ms.unbanMusic(loginUser.getUseq(), mseq);
			return true;
		}		
	}
}
