package com.eco.admin.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.eco.admin.service.IAdminService;
import com.eco.admin.service.IMusicManageService;
import com.eco.dao.ICountDao;
import com.eco.dto.MusicVO;
import com.eco.dto.Paging;

@Controller
public class MusicManageController {
	
	@Autowired
	IAdminService adminService;
	
	@Autowired
	IMusicManageService musicManageService;
	
	@Autowired
	ICountDao countDao;
	
	@RequestMapping(value = "musicManageList", method = RequestMethod.GET)
	public String musicManageList(HttpServletRequest request, Model model) {
		
		System.out.println("testestest");
		
		// 세션 체크
		HttpSession session = request.getSession();
		String adminId = (String) session.getAttribute("adminId");
		if (adminId == null) {
			return "redirect:/admin";
		}
		
		System.out.println("System.out.println(adminId);");
		System.out.println(adminId);

		// 검색조건 체크
		int page=1;
		if( request.getParameter("first")!=null ) {
			session.removeAttribute("page");
			session.removeAttribute("key");
		}
		String key = "";
		if( request.getParameter("key") != null ) {
			key = request.getParameter("key");
			session.setAttribute("key", key);
		} else if( session.getAttribute("key")!= null ) {
			key = (String)session.getAttribute("key");
		} else {
			session.removeAttribute("key");
			key = "";
		}
		if( request.getParameter("page") != null ) {
			page = Integer.parseInt(request.getParameter("page"));
			session.setAttribute("page", page);
		} else if( session.getAttribute("page")!= null  ) {
			page = (int) session.getAttribute("page");
		} else {
			page = 1;
			session.removeAttribute("page");
		}

		// 검색조건 - 페이징
		Paging paging = new Paging();
		paging.setPage(page);
		int count = countDao.getAllCount("music", "title", key);
		paging.setTotalCount(count);
		paging.paging();

		// 검색조건기반 조회
		List<MusicVO> musicList = musicManageService.list(paging, key);

		// 페이지내에 필요값 지정
		model.addAttribute("paging", paging);
		model.addAttribute("key", key);
		model.addAttribute("musicList", musicList);

		return "admin/musicManageList";
	}
}
