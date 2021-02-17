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

import com.eco.admin.service.IAlbumManageService;
import com.eco.dto.AlbumVO;
import com.eco.dto.Paging;
import com.eco.service.AdminService;

@Controller
public class AlbumManageController {
	
	
	@Autowired
	AdminService adminService;
	
	@Autowired
	IAlbumManageService albumManageService;
	
	@RequestMapping("albumManageList")
	public String albumManageList(HttpServletRequest request, Model model) {
		
		// �꽭�뀡 泥댄겕
		HttpSession session = request.getSession();
		String adminId = (String) session.getAttribute("adminId");
		if (adminId == null) {
			return "redirect:/admin";
		}

		// 寃��깋議곌굔 泥댄겕
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

		// 寃��깋議곌굔 - �럹�씠吏�
		Paging paging = new Paging();
		paging.setPage(page);
		int count = adminService.getAllCount("album", "title", key);
		paging.setTotalCount(count);
		paging.paging();

		// 寃��깋議곌굔湲곕컲 議고쉶
		List<AlbumVO> albumList = albumManageService.list(paging, key);

		// �럹�씠吏��궡�뿉 �븘�슂媛� ���옣
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

		// �꽭�뀡 泥댄겕
		HttpSession session = request.getSession();
		String adminId = (String) session.getAttribute("adminId");
		if (adminId == null) {
			return "redirect:/admin";
		}

		// �쑀�슚�꽦 泥댄겕
		if (result.hasErrors()) { // �뼱�뒓 硫ㅻ쾭蹂��닔�씤吏� 紐⑤Ⅴ吏�留�, �뿉�윭�궡�슜�씠 議댁옱�븳�떎硫�
			if (result.getFieldError("memberName") != null) { // writer 硫ㅻ쾭蹂��닔�뿉 ���븳 �뿉�윭�궡�슜�씠 議댁옱�븳�떎硫�
				model.addAttribute("msg", "Writer �엯�젰�� 鍮꾩뼱�엳嫄곕굹 3湲��옄 誘몃쭔�씠硫� �븞�릺�슂~");
			}
			return "admin/albumManageInsertForm";
		}

		// �꽌鍮꾩뒪瑜� �넻�븳 DB�벑濡�
		// ...

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
		// �꽭�뀡 泥댄겕
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
		// �꽭�뀡 泥댄겕
		HttpSession session = request.getSession();
		String adminId = (String) session.getAttribute("adminId");
		if (adminId == null) {
			return "redirect:/admin";
		}

		return "admin/albumManageDelete";
	}

}
