package com.eco.admin.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ResourceUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.eco.admin.service.IArtistManageService;
import com.eco.admin.valid.ArtistValidator;
import com.eco.dao.ICountDao;
import com.eco.dao.IMusicDao;
import com.eco.dto.ArtistVO;
import com.eco.dto.Paging;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Controller
public class ArtistManageController {
	
	@Autowired
	IArtistManageService artistManageService;

	@Autowired
	IMusicDao musicDao;
	
	@Autowired
	ICountDao c;
	
	@RequestMapping("artistManageList")
	public String artistManageList(HttpServletRequest request, Model model
			, @ModelAttribute("search") ArtistVO search
			, Paging searchPaging
			) {
		
		// 세션 체크
		HttpSession session = request.getSession();
		String adminId = (String) session.getAttribute("adminId");
		if (adminId == null) {
			return "redirect:/admin";
		}

		// 검색조건에 의한 갯수조회
		search.setSearchTable("artist_view"); // 검색조건 테이블 저장
		int count = c.count(search);
		
		// 페이징
		Paging paging = new Paging();
		paging.setPage(search.getPage());
		paging.setDisplayRow(searchPaging.getDisplayRow());
		paging.setTotalCount(count);
		paging.paging();
		search.setPaging(paging);

		model.addAttribute("groupynList", musicDao.groupynListByArtist());

		model.addAttribute("genderList", musicDao.genderListByArtist());
		
		model.addAttribute("genreListIncludedArtist", musicDao.genreListIncludedArtist());

		// 페이징과 검색조건에 의한 조회 그리고 저장
		model.addAttribute("artistList", artistManageService.list(search));
		
		return "admin/artistManageList";
	}

	
	@RequestMapping(value = "artistManageInsertForm", method = RequestMethod.GET)
	public String artistManageInsertForm(HttpServletRequest request, Model model
			, @ModelAttribute("artist") ArtistVO artist
			) {
		model.addAttribute("genreList", musicDao.genreList());
		return "admin/artistManageInsertForm";
	}
	
	@RequestMapping(value = "artistManageInsert", method = RequestMethod.POST)
	public String artistManageInsert(HttpServletRequest request, Model model
			, @ModelAttribute("artist") ArtistVO artist
			, BindingResult result
			, RedirectAttributes redirect
			) {
		// 세션 체크
		HttpSession session = request.getSession();
		String adminId = (String) session.getAttribute("adminId");
		if (adminId == null) {
			return "redirect:/admin";
		}
		
		model.addAttribute("genreList", musicDao.genreList());
		
		try {
			MultipartRequest multi = new MultipartRequest(
					request
					, ResourceUtils.getFile("classpath:static/upload/").toPath().toString()
					, 1024 * 1024 * 10
					, "UTF-8"
					, new DefaultFileRenamePolicy()
			);
			
			// MultipartRequest multi로부터 artist로 차곡차곡 set
			artist.setName(multi.getParameter("name"));
			artist.setGroupyn(multi.getParameter("groupyn"));
			artist.setGender(multi.getParameter("gender"));
			artist.setImg(multi.getParameter("img"));
			artist.setImglink(multi.getParameter("imglink"));
			artist.setGseq(multi.getParameter("gseq") != null ? Integer.parseInt(multi.getParameter("gseq")) : 0);
			artist.setDescription(multi.getParameter("description"));
			
			// artist전용 validator를 호출
			ArtistValidator validator = new ArtistValidator();
	        validator.validate(artist, result);

	        // 하나라도 걸리면
	        if (result.hasErrors()) {
	        	// 해당필드 값 내려주고 다시 화면으로 입력
	        	model.addAttribute("message", result.getFieldError().getField());
	        	return "admin/artistManageInsertForm";
	        }
			
			artist.setImglink(multi.getParameter("imglink"));
			String img = multi.getFilesystemName("img");
			if (artist.getImglink() != null && !artist.getImglink().equals("")) {
				img = artist.getImglink();
			} /*else if (img == null || img.equals("")) {
				img = artist.getOldimg();
			} */
			else if (img != null) {
				img = "/upload/" + img;
			} else {
				img = null;
			}
			artist.setImg(img);
			
		} catch (IOException e) {e.printStackTrace();}
		
		int res = artistManageService.insert(artist);
		if (res > 0) {
			redirect.addFlashAttribute("message", "저장되었습니다.");
			return "redirect:/artistManageUpdateForm?atseq=" + artist.getAtseq();
		} else {
			return "admin/artistManageInsertForm";
		}
	}
	
	@RequestMapping(value = "artistManageUpdateForm", method = RequestMethod.GET)
	public String artistManageUpdateForm(HttpServletRequest request, Model model
			, @RequestParam("atseq") int atseq
			) {
		model.addAttribute("genreList", musicDao.genreList());
		model.addAttribute("artist", musicDao.getArtist(atseq));
		return "admin/artistManageUpdateForm";
	}
	
	@RequestMapping(value = "artistManageUpdate", method = RequestMethod.POST)
	public String artistManageUpdate(HttpServletRequest request, Model model
			, @ModelAttribute("artist") @Valid ArtistVO artist
			, BindingResult result
			) {
		
		// 세션 체크
		HttpSession session = request.getSession();
		String adminId = (String) session.getAttribute("adminId");
		if (adminId == null) {
			return "redirect:/admin";
		}
				
		try {
			MultipartRequest multi = new MultipartRequest(
					request
					, ResourceUtils.getFile("classpath:static/upload/").toPath().toString()
					, 1024 * 1024 * 10
					, "UTF-8"
					, new DefaultFileRenamePolicy()
			);
			artist.setAtseq(Integer.parseInt(multi.getParameter("atseq")));
			artist.setName(multi.getParameter("name"));
			artist.setGroupyn(multi.getParameter("groupyn"));
			artist.setGender(multi.getParameter("gender"));
			artist.setGseq(Integer.parseInt(multi.getParameter("gseq")));
			artist.setOldimg(multi.getParameter("oldimg"));
			artist.setImglink(multi.getParameter("imglink"));
			artist.setDescription(multi.getParameter("description"));
			
			String img = multi.getFilesystemName("img");
			if (artist.getImglink() != null && !artist.getImglink().equals("")) {
				img = artist.getImglink();
			} else if (img == null || img.equals("")) {
				img = artist.getOldimg();
			} else {
				img = "/upload/" + img;
			}
			artist.setImg(img);
			
			model.addAttribute("message", result.getAllErrors().get(0).getDefaultMessage());
			
		} catch (IOException e) {e.printStackTrace();}
		
		int res = artistManageService.update(artist);
		
		if (res > 0) {
			model.addAttribute("message", "저장되었습니다.");
		}
		
		model.addAttribute("genreList", musicDao.genreList());
		model.addAttribute("artist", musicDao.getArtist(artist.getAtseq()));
		return "admin/artistManageUpdateForm";
	}
	
	@RequestMapping(value = "artistManageDelete", method = RequestMethod.POST)
	public String artistManageDelete(HttpServletRequest request, Model model
			, @RequestParam("atseq") int atseq
			) {
		// 세션 체크
		HttpSession session = request.getSession();
		String adminId = (String) session.getAttribute("adminId");
		if (adminId == null) {
			return "redirect:/admin";
		}
		
		
		try {
			artistManageService.delete(atseq);
		} catch(Exception e) {
			model.addAttribute("message", "이미 앨범 또는 곡이 있으므로 해당 아티스트는 삭제가 불가능합니다.");
			return this.artistManageUpdateForm(request, model, atseq);
		}
		
		
		return "redirect:/artistManageList";
	}
}
