package com.eco.admin.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.eco.admin.service.IMusicManageService;
import com.eco.dao.ICountDao;
import com.eco.dao.IMusicDao;
import com.eco.dto.MusicVO;
import com.eco.dto.Paging;

@Controller
public class MusicManageController {
	
	@Autowired
	IMusicManageService musicManageService;
	
	@Autowired
	IMusicDao musicDao;
	
	@Autowired
	ICountDao c;
	
	@RequestMapping(value = "musicManageList", method = RequestMethod.GET)
	public String musicManageList(HttpServletRequest request, Model model
			, @ModelAttribute("search") MusicVO search
			, Paging searchPaging
			) {
		
		// 세션 체크
		HttpSession session = request.getSession();
		String adminId = (String) session.getAttribute("adminId");
		if (adminId == null) {
			return "redirect:/admin";
		}
		
		// 검색조건에 의한 갯수조회
		search.setSearchTable("music_view"); // 검색조건 테이블 저장
		int count = c.count(search);
		
		// 페이징
		Paging paging = new Paging();
		paging.setPage(search.getPage());
		paging.setDisplayRow(searchPaging.getDisplayRow());
		paging.setTotalCount(count);
		paging.paging();
		search.setPaging(paging);

		// 페이징과 검색조건에 의한 조회 그리고 저장
		model.addAttribute("musicList", musicManageService.list(search));
		
		return "admin/musicManageList";
	}
}
