package com.eco.admin.controller;

import java.util.List;

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

import com.eco.admin.service.IAdminService;
import com.eco.admin.service.IAlbumManageService;
import com.eco.dao.ICountDao;
import com.eco.dto.AlbumVO;
import com.eco.dto.Paging;

@Controller
public class AlbumManageController {

	@Autowired
	IAdminService adminService;
	
	@Autowired
	IAlbumManageService albumManageService;
	
	@Autowired
	ICountDao countDao;
	
	@RequestMapping("albumManageList")
	public String albumManageList(HttpServletRequest request, Model model) {
		
		HttpSession session = request.getSession();
		String adminId = (String) session.getAttribute("adminId");
		if (adminId == null) {
			return "redirect:/admin";
		}

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

		Paging paging = new Paging();
		paging.setPage(page);
		int count = countDao.getAllCount("album", "title", key);
		paging.setTotalCount(count);
		paging.paging();

		List<AlbumVO> albumList = albumManageService.list(paging, key);

		model.addAttribute("paging", paging);
		model.addAttribute("key", key);
		model.addAttribute("albumList", albumList);
		
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
