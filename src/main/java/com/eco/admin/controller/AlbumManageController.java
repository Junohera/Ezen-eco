package com.eco.admin.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.eco.admin.service.IAlbumManageService;
import com.eco.dao.ICountDao;
import com.eco.dao.IMusicDao;
import com.eco.dto.AlbumVO;
import com.eco.dto.Paging;

@Controller
public class AlbumManageController {
	
	@Autowired
	IAlbumManageService albumManageService;
	
	@Autowired
	IMusicDao musicDao;
	
	@Autowired
	ICountDao c;
	
	@RequestMapping("albumManageList")
	public String albumManageList(HttpServletRequest request, Model model
		, @ModelAttribute("search") AlbumVO search
		, Paging searchPaging
			) {
		
		// 세션 체크
		HttpSession session = request.getSession();
		String adminId = (String) session.getAttribute("adminId");
		if (adminId == null) {
			return "redirect:/admin";
		}
		
		// 검색조건에 의한 갯수조회
		search.setSearchTable("album_view"); // 검색조건 테이블 저장
		int count = c.count(search);

		// 페이징
		Paging paging = new Paging();
		paging.setPage(search.getPage());
		paging.setDisplayRow(searchPaging.getDisplayRow());
		paging.setTotalCount(count);
		paging.paging();
		search.setPaging(paging);

		// 페이징과 검색조건에 의한 조회 그리고 저장
		model.addAttribute("albumList", albumManageService.list(search));

		return "admin/albumManageList";
	}

	
	@RequestMapping(value = "albumManageInsertForm", method = RequestMethod.GET)
	public String albumManageInsertForm(HttpServletRequest request, Model model
			, @ModelAttribute("AlbumVO") AlbumVO album
			) {
		return "admin/albumManageInsertForm";
	}
	
	@RequestMapping(value = "albumManageInsert", method = RequestMethod.POST)
	public String albumManageInsert(HttpServletRequest request, Model model
			, @ModelAttribute("AlbumVO") @Valid AlbumVO album
			, BindingResult result
			) {

		HttpSession session = request.getSession();
		String adminId = (String) session.getAttribute("adminId");
		if (adminId == null) {
			return "redirect:/admin";
		}

		if (result.hasErrors()) { 
			if (result.getFieldError("memberName") != null) { // writer 硫ㅻ쾭蹂��닔�뿉 ���븳 �뿉�윭�궡�슜�씠 議댁옱�븳�떎硫�
				model.addAttribute("msg", "Writer �엯�젰�� 鍮꾩뼱�엳嫄곕굹 3湲��옄 誘몃쭔�씠硫� �븞�릺�슂~");
			}
			return "admin/albumManageInsertForm";
		}

		return "admin/albumManageInsert";
	}
	
	@RequestMapping(value = "albumManageUpdateForm", method = RequestMethod.GET)
	public String albumManageUpdateForm(HttpServletRequest request, Model model
			, @ModelAttribute("AlbumVO") AlbumVO album
			) {
		return "admin/albumManageUpdateForm";
	}
	
	@RequestMapping(value = "albumManageUpdate", method = RequestMethod.POST)
	public String albumManageUpdate(HttpServletRequest request, Model model
			, @ModelAttribute("AlbumVO") @Valid AlbumVO album
			, BindingResult result
			) {
		HttpSession session = request.getSession();
		String adminId = (String) session.getAttribute("adminId");
		if (adminId == null) {
			return "redirect:/admin";
		}

		return "admin/albumManageUpdate";
	}
	
	@RequestMapping(value = "albumManageDelete", method = RequestMethod.POST)
	public String albumManageDelete(HttpServletRequest request, Model model
			, @RequestParam("atseq") int atseq
			) {
		HttpSession session = request.getSession();
		String adminId = (String) session.getAttribute("adminId");
		if (adminId == null) {
			return "redirect:/admin";
		}

		return "admin/albumManageDelete";
	}

}
